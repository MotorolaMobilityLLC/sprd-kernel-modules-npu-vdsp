/*
 * Copyright (C) 2017-2018 Spreadtrum Communications Inc.
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <asm/cacheflush.h>
#include "xrp_kernel_defs.h"
#include "vdsp_hw.h"
#include <linux/clk.h>
#include "xrp_internal.h"
#include "sprd_dvfs_vdsp.h"
#include "vdsp_dvfs_sharkl5pro.h"

static inline void reg_write32(
	struct vdsp_hw *hw,
	void *addr, u32 v)
{
	__raw_writel(v, addr);
}

static inline u32 reg_read32(
	struct vdsp_hw *hw,
	void *addr)
{
	return __raw_readl(addr);
}

static inline void reg_write32_setbit(
	struct vdsp_hw *hw,
	void *addr, u32 v)
{
	if (hw->ahb)
	{
		volatile u32 value;
		value = __raw_readl(addr);
		value = v | value;
		__raw_writel(value, addr);
	}
}

static inline void reg_write32_clearbit(
		struct vdsp_hw *hw,
		void *addr, u32 v)
{
	if (hw->ahb)
	{
		volatile u32 value;
		value = __raw_readl(addr);
		value = v & value;
		__raw_writel(value, addr);
	}
}

static void parse_qos(void *hw_arg , void *of_node)
{
	struct device_node *qos_node = NULL;
	struct vdsp_hw *hw = (struct vdsp_hw*) hw_arg;
	if((NULL == hw_arg) || (NULL == of_node)) {
		pr_err("add %s hw_arg:%lx , of_node:%lx\n" ,
			__func__ ,
			(unsigned long)hw_arg ,
			(unsigned long)of_node);
		return;
	}
	qos_node = of_parse_phandle(of_node, "vdsp-qos", 0);
	if(qos_node) {
		if (of_property_read_u8(qos_node,
			"arqos-vdsp-msti", &hw->qos.ar_qos_vdsp_msti)) {
			hw->qos.ar_qos_vdsp_msti = 6;
		}
		if (of_property_read_u8(qos_node,
			"awqos-vdsp-mstd", &hw->qos.aw_qos_vdsp_mstd)) {
			hw->qos.aw_qos_vdsp_mstd = 6;
		}
		if (of_property_read_u8(qos_node,
			"arqos-vdsp-mstd", &hw->qos.ar_qos_vdsp_mstd)) {
			hw->qos.ar_qos_vdsp_mstd = 6;
		}
		if (of_property_read_u8(qos_node,
			"arqos-vdsp-idma", &hw->qos.ar_qos_vdsp_idma)) {
			hw->qos.ar_qos_vdsp_idma = 1;
		}
		if (of_property_read_u8(qos_node,
			"awqos-vdsp-idma", &hw->qos.aw_qos_vdsp_idma)) {
			hw->qos.aw_qos_vdsp_idma = 1;
		}
		if (of_property_read_u8(qos_node,
			"arqos-vdma", &hw->qos.ar_qos_vdma)) {
			hw->qos.ar_qos_vdma = 1;
		}
		if (of_property_read_u8(qos_node,
			"awqos-vdma", &hw->qos.aw_qos_vdma)) {
			hw->qos.aw_qos_vdma = 1;
		}
		if (of_property_read_u8(qos_node,
			"arqos-threshold", &hw->qos.ar_qos_threshold)) {
			hw->qos.ar_qos_threshold = 0x0f;
		}
		if (of_property_read_u8(qos_node,
			"awqos-threshold", &hw->qos.aw_qos_threshold)) {
			hw->qos.aw_qos_threshold = 0x0f;
		}
	}
	else {
		hw->qos.ar_qos_vdsp_msti = 6;
		hw->qos.ar_qos_vdsp_mstd = 6;
		hw->qos.aw_qos_vdsp_mstd = 6;
		hw->qos.ar_qos_vdsp_idma = 1;
		hw->qos.aw_qos_vdsp_idma = 1;
		hw->qos.ar_qos_vdma = 1;
		hw->qos.aw_qos_vdma = 1;
		hw->qos.ar_qos_threshold = 0x0f;
		hw->qos.aw_qos_threshold = 0x0f;
	}
	return;
}

static void set_qos(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	/*set qos threshold*/
	APAHB_HREG_MWR(hw->ahb + REG_QOS_THRESHOLD ,
	(0xf<<28 | 0xf << 24) ,
	((hw->qos.ar_qos_threshold << 28)
	| (hw->qos.aw_qos_threshold << 24)));
	/*set qos 3*/
	APAHB_HREG_MWR(hw->ahb + REG_QOS_3 ,
	0xf0ffffff ,
	((hw->qos.ar_qos_vdsp_msti << 28)
	| (hw->qos.ar_qos_vdsp_mstd << 20)
	| (hw->qos.aw_qos_vdsp_mstd << 16)
	| (hw->qos.ar_qos_vdsp_idma << 12)
	| (hw->qos.aw_qos_vdsp_idma << 8)
	| (hw->qos.ar_qos_vdma << 4)
	| (hw->qos.aw_qos_vdma)));
	/*set qos sel 3*/
	APAHB_HREG_MWR(hw->ahb + REG_QOS_SEL3 , 0x7f , 0x7f);
	return;
}

static void *get_hw_sync_data(void *hw_arg, size_t *sz, uint32_t log_addr)
{
	static const u32 irq_mode[] = {
		[XRP_IRQ_NONE] = XRP_DSP_SYNC_IRQ_MODE_NONE,
		[XRP_IRQ_LEVEL] = XRP_DSP_SYNC_IRQ_MODE_LEVEL,
		[XRP_IRQ_EDGE] = XRP_DSP_SYNC_IRQ_MODE_EDGE,
		[XRP_IRQ_EDGE_SW] = XRP_DSP_SYNC_IRQ_MODE_EDGE,
	};
	struct vdsp_hw *hw = hw_arg;
	struct vdsp_side_sync_data *hw_sync_data =
		kmalloc(sizeof(*hw_sync_data), GFP_KERNEL);

	if (!hw_sync_data) {
		pr_info("hw_sync_data is NULL !!!\n");
		return NULL;
	}
	pr_info("get_hw_sync_data ahb_phys:%x"
		"host_irq_mode:%d,host_irqoffset:%d , host_irq_bit:%d"
		"hw->device_irq_mode:%d , device_irq_mode:%d"
		"device_irq_offset:%d , device_irq_bit:%d"
		"device_irq:%d, smsg addr:0x%lx, log_addr:0x%x\n",
	       (unsigned int)hw->ahb_phys , hw->host_irq_mode,
	       hw->host_irq[0] , hw->host_irq[1],hw->device_irq_mode,
	       irq_mode[hw->device_irq_mode] , hw->device_irq[0],
	       hw->device_irq[1],
	       hw->device_irq[2], (unsigned long)*sz, log_addr);
	*hw_sync_data = (struct vdsp_side_sync_data){
			.device_mmio_base = hw->ipi_phys,
			.host_irq_mode = hw->host_irq_mode,
			.host_irq_offset = hw->host_irq[0],
			.host_irq_bit = hw->host_irq[1],
			.device_irq_mode = irq_mode[hw->device_irq_mode],
			.device_irq_offset = hw->device_irq[0],
			.device_irq_bit = hw->device_irq[1],
			.device_irq = hw->device_irq[2],
			.vdsp_smsg_addr = (unsigned int)*sz,
			.vdsp_log_addr = log_addr,
	};
	pr_info("vdsp_smsg_addr 0x%x \n",
		hw_sync_data->vdsp_smsg_addr);
	*sz = sizeof(*hw_sync_data);
	return hw_sync_data;
}

static void reset(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	pr_debug("%s arg:%p ,offset:%x , value:0\n" ,
		__func__ , hw->ahb , REG_RESET);
	reg_write32_setbit(hw_arg, hw->ahb+REG_RESET, (0x3<<9));
	reg_write32_clearbit(hw_arg,hw->ahb+REG_RESET , ~(0x3<<9));
}

static void halt(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
        pr_debug("%s arg:%p ,offset:%x , value:1\n" ,
			__func__ , hw->ahb , REG_RUNSTALL);
	reg_write32_setbit(hw_arg, hw->ahb+REG_RUNSTALL, 1<<2);
}

static void release(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	pr_debug("%s arg:%p ,offset:%x , value:0\n" ,
		__func__ , hw->ahb , REG_RUNSTALL);
	reg_write32_clearbit(hw_arg, hw->ahb+REG_RUNSTALL, ~(1<<2));
}
static int enable(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	unsigned int rdata;

	pr_info("%s entry\n" , __func__);
	/*pd_ap_vdsp_force_shutdown bit */
	reg_write32(hw_arg, hw->pmu+0x07e4, 0x204004);
	/*vdsp_stop_en*/
	reg_write32_clearbit(hw_arg, hw->ahb+REG_LP_CTL , ~(1<<2));
	reg_write32_setbit(hw_arg, hw->ahb+REG_LP_CTL, 1<<3);
	/*isppll open for 936M*/
	reg_write32_setbit(hw_arg, hw->pmu+0x8c, 0x1);
	/* loop PD_AD_VDSP_STATE*/
	rdata = reg_read32(hw_arg, hw->pmu+0xbc);
	rdata &= 0xFF000000;
	while (rdata) {
		rdata = reg_read32(hw_arg, hw->pmu+0xbc);
		rdata &= 0xFF000000;
	}
	/* IPI enable */
	reg_write32_setbit(hw_arg, hw->ahb, (1<<6));
	/* vdma enable */
	reg_write32_setbit(hw_arg, hw->ahb, (1<<3));
	/*vdsp_all_int_mask = 0*/
	reg_write32_clearbit(hw_arg, hw->ahb+0x3094, ~(1<<13));
	return 0;
}

static void disable(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	pr_debug("%s arg:%p ,offset:%x , value:0\n" ,
		__func__ , hw->ahb , REG_LP_CTL);
	reg_write32_setbit(hw_arg, hw->ahb+REG_LP_CTL , 1<<2);
	reg_write32_setbit(hw_arg, hw->ahb+REG_RESET , 0x3<<9);

}

static void enable_dvfs(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	printk("%s arg:%p ,offset:%x , value:0\n" ,
		__func__ , hw->dvfs , 0x8);
	reg_write32_setbit(hw_arg , hw->dvfs + 0x8 , 1<<2);
}

static void disable_dvfs(void *hw_arg)
{
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	reg_write32_clearbit(hw_arg , hw->dvfs +0x8 , ~(1<<2));
}

static uint32_t translate_dvfsindex_to_freq(uint32_t index)
{
	switch(index) {
	case 0:
		return SHARKL5PRO_VDSP_CLK256M;
	case 1:
		return SHARKL5PRO_VDSP_CLK384M;
	case 2:
		return SHARKL5PRO_VDSP_CLK512M;
	case 3:
		return SHARKL5PRO_VDSP_CLK614M4;
	case 4:
		return SHARKL5PRO_VDSP_CLK768M;
	case 5:
		return SHARKL5PRO_VDSP_CLK936M;
	default:
		return SHARKL5PRO_VDSP_CLK256M;
	}
}

static void setdvfs(void *hw_arg , uint32_t index)
{
#if 0
	struct vdsp_hw *hw = (struct vdsp_hw *)hw_arg;
	printk("%s arg:%p , value:0\n" , __func__ , hw->dvfs);
	reg_write32(hw_arg , hw->dvfs + 0x114, index);
#else
	uint32_t freq;
	freq = translate_dvfsindex_to_freq(index);
	printk("%s before call_chain freq:%d , index:%d\n",
		__func__ , freq ,index);
	vdsp_dvfs_notifier_call_chain(&freq);
	return;
#endif
}

static void send_irq(void *hw_arg)
{
	struct vdsp_hw *hw = hw_arg;

	hw->vdsp_ipi_desc->ops->irq_send(hw->device_irq[1]);
}
static void ack_irq(void *hw_arg)
{
	struct vdsp_hw *hw = hw_arg;

	if (hw->host_irq_mode == XRP_IRQ_LEVEL) {
		pr_info("clr = 0x%x\n",
			reg_read32(hw,
			hw->device_irq_host_offset + hw->ipi) & 0xF);
	}
}


static irqreturn_t xrp_hw_irq_handler(int irq, void *dev_id)
{
	irqreturn_t ret = 0;
	struct vdsp_hw *hw = dev_id;

	ret = xrp_irq_handler(irq, hw->xrp);

	if (ret == IRQ_HANDLED)
		ack_irq(hw);

	return ret;
}

static void memcpy_hw_function(
	void __iomem *dst, const void *src, size_t sz)
{
	memcpy(dst , src , sz);
	return;
}

static void memset_hw_function(
	void __iomem *dst, int c, size_t sz)
{
	memset(dst , c , sz);
	return;
}

static const struct xrp_hw_ops hw_ops = {
	.halt = halt,
	.release = release,
	.reset = reset,
	.get_hw_sync_data = get_hw_sync_data,
	.send_irq = send_irq,
	.memcpy_tohw = memcpy_hw_function,
	.memset_hw = memset_hw_function,
	.enable = enable,
	.disable = disable,
	.enable_dvfs = enable_dvfs,
	.disable_dvfs = disable_dvfs,
	.setdvfs = setdvfs,
	.set_qos = set_qos,
};


static long sprd_vdsp_parse_hw_dt(struct platform_device *pdev,
	struct vdsp_hw *hw,
	int mem_idx,
	enum vdsp_init_flags *init_flags)
{
	struct resource *mem;
	int irq;
	long ret;

	/*ahb */
	mem = platform_get_resource(pdev, IORESOURCE_MEM, mem_idx);
	pr_debug("ahb memstart:%lx , mem:%p , mem_idx:%d\n" ,
		(unsigned long)mem->start , mem , mem_idx);
	if (!mem) {
		ret = -ENODEV;
		goto err;
	}
	hw->ahb_phys = mem->start;
	hw->ahb = devm_ioremap_resource(&pdev->dev, mem);
	pr_debug("%s: ahb = %pap/%p\n",
		 __func__, &mem->start, hw->ahb);
	/*ipi */
	mem = platform_get_resource(pdev, IORESOURCE_MEM, mem_idx+1);
	pr_debug("add ipi memstart:%lx , mem:%p , mem_idx:%d\n" ,
		(unsigned long)mem->start , mem , mem_idx+1);
	if (!mem) {
		ret = -ENODEV;
		goto err;
	}
	hw->ipi_phys = mem->start;
	hw->ipi = devm_ioremap_resource(&pdev->dev, mem);
	pr_debug("%s: ipi = %pap/%p\n",
		 __func__, &mem->start, hw->ipi);
	/*pmu 0x327e0000*/
	mem = platform_get_resource(pdev, IORESOURCE_MEM, mem_idx+2);
	pr_debug("add pmu memstart:%lx, mem:%p , mem_idx:%d\n" ,
		(unsigned long)mem->start , mem , mem_idx+2);
        if (!mem) {
                ret = -ENODEV;
                goto err;
        }
	hw->pmu = devm_ioremap_resource(&pdev->dev, mem);
	pr_debug("%s: pmu = %pap/%p\n",
                 __func__, &mem->start, hw->pmu);
	/*dvfs */
	mem = platform_get_resource(pdev, IORESOURCE_MEM, mem_idx+3);
	pr_debug("add dvfs memstart:%lx , mem:%p , mem_idx:%d\n" ,
		(unsigned long)mem->start , mem , mem_idx+3);
	if (!mem) {
		ret = -ENODEV;
		goto err;
	}
	hw->dvfs_phys = mem->start;
	hw->dvfs = devm_ioremap_resource(&pdev->dev, mem);
	pr_debug("%s: dvfs = %pap/%p\n",
		 __func__, &mem->start, hw->dvfs);
	/* qos */
	parse_qos(hw, pdev->dev.of_node);
	/* irq */
	ret = of_property_read_u32_array(pdev->dev.of_node,
			"device-irq",
			hw->device_irq,
			ARRAY_SIZE(hw->device_irq));
	if (ret == 0) {
		u32 device_irq_host_offset;

		ret = of_property_read_u32(pdev->dev.of_node,
				"device-irq-host-offset",
				&device_irq_host_offset);
		if (ret == 0) {
			hw->device_irq_host_offset = device_irq_host_offset;
		} else {
			hw->device_irq_host_offset = hw->device_irq[0];
			ret = 0;
		}
	}
	if (ret == 0) {
		u32 device_irq_mode;

		ret = of_property_read_u32(pdev->dev.of_node,
				"device-irq-mode",
				&device_irq_mode);
		if (device_irq_mode < XRP_IRQ_MAX)
			hw->device_irq_mode = device_irq_mode;
		else
			ret = -ENOENT;
	}
	if (ret == 0) {
		pr_debug("%s: device IRQ MMIO host offset = 0x%08x,"
			"offset = 0x%08x, bit = %d,"
			"device IRQ = %d, IRQ mode = %d",
			__func__, hw->device_irq_host_offset,
			hw->device_irq[0], hw->device_irq[1],
			hw->device_irq[2], hw->device_irq_mode);
	} else {
		pr_debug("using polling mode on the device side\n");
	}

	ret = of_property_read_u32_array(pdev->dev.of_node,
			"host-irq",
			hw->host_irq,
			ARRAY_SIZE(hw->host_irq));
	if (ret == 0) {
		u32 host_irq_mode;

		ret = of_property_read_u32(pdev->dev.of_node,
				"host-irq-mode",
				&host_irq_mode);
		if (host_irq_mode < XRP_IRQ_MAX)
			hw->host_irq_mode = host_irq_mode;
		else
			ret = -ENOENT;
	}

	if (ret == 0 && hw->host_irq_mode != XRP_IRQ_NONE)
		irq = platform_get_irq(pdev, 0);
	else
		irq = -1;

	pr_debug("%s , irq is:%d , ret:%ld , host_irq_mode:%d\n" ,
		__func__ , irq , ret , hw->host_irq_mode);
	if (irq >= 0) {
		pr_debug("%s: host IRQ = %d, ", __func__, irq);
		hw->vdsp_ipi_desc = get_vdsp_ipi_ctx_desc();
		if (hw->vdsp_ipi_desc) {
			hw->vdsp_ipi_desc->base_addr = hw->ahb_phys;
			hw->vdsp_ipi_desc->vir_addr = hw->ahb;
			hw->vdsp_ipi_desc->ipi_addr = hw->ipi;
			hw->vdsp_ipi_desc->irq_mode = hw->host_irq_mode;
			ret = devm_request_irq(&pdev->dev,
					irq,
					hw->vdsp_ipi_desc->ops->irq_handler,
					IRQF_SHARED,
					pdev->name,
					hw);

			if (ret < 0) {
				pr_err("request_irq %d failed\n", irq);
				goto err;
			}

			hw->vdsp_ipi_desc->ops->irq_register(0,
					xrp_hw_irq_handler, hw);
			hw->vdsp_ipi_desc->ops->irq_register(1,
					xrp_hw_irq_handler, hw);

			*init_flags |= XRP_INIT_USE_HOST_IRQ;
		}
	} else {
		pr_debug("using polling mode on the host side\n");
	}
	ret = 0;
err:
	return ret;
}

static long init_sprd(struct platform_device *pdev,
	struct vdsp_hw *hw)
{
	long ret;
	enum vdsp_init_flags init_flags = 0;
	ret = sprd_vdsp_parse_hw_dt(pdev, hw, 0, &init_flags);
	if (ret < 0)
		return ret;
	return sprd_vdsp_init(pdev, init_flags, &hw_ops, hw);
}

#ifdef CONFIG_OF
static const struct of_device_id vdsp_device_match[] = {
	{
		.compatible = "sprd,sharkl5pro-vdsp",
		.data = init_sprd,
	},
	 {},
};
MODULE_DEVICE_TABLE(of, vdsp_device_match);
#endif

static int vdsp_driver_probe(struct platform_device *pdev)
{
	struct vdsp_hw *hw =
		devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
	const struct of_device_id *match;
	long (*init)(struct platform_device *pdev, struct vdsp_hw *hw);
	long ret;

	if (!hw)
		return -ENOMEM;

	match = of_match_device(of_match_ptr(vdsp_device_match),
				&pdev->dev);
	if (!match)
		return -ENODEV;

	init = match->data;
	ret = init(pdev, hw);
	if (IS_ERR_VALUE(ret)) {
		sprd_vdsp_deinit(pdev);
		return ret;
	} else {
		hw->xrp = ERR_PTR(ret);
		return 0;
	}

}

static int vdsp_driver_remove(struct platform_device *pdev)
{
	return sprd_vdsp_deinit(pdev);
}

static const struct dev_pm_ops vdsp_pm_ops = {
	SET_RUNTIME_PM_OPS(vdsp_runtime_suspend,
			   vdsp_runtime_resume, NULL)
};

static struct platform_driver vdsp_driver = {
	.probe   = vdsp_driver_probe,
	.remove  = vdsp_driver_remove,
	.driver  = {
		.name = DRIVER_NAME,
		.of_match_table = of_match_ptr(vdsp_device_match),
		.pm = &vdsp_pm_ops,
	},
};

module_platform_driver(vdsp_driver);

MODULE_DESCRIPTION("Sprd CAM Driver");
MODULE_AUTHOR("Multimedia_Camera@Spreadtrum");
MODULE_LICENSE("GPL");
