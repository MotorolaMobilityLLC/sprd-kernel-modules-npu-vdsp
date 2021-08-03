
/*****************************************************************************
 * Copyright (C) 2020 Unisoc Inc.
 * SPDX-License-Identifier: GPL-2.0
 *****************************************************************************/

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/dma-mapping.h>
#include "sprd_vdsp_iommu_dev.h"
#include "sprd_vdsp_iova.h"
#include "sprd_vdsp_iommuvau_register.h"
#include "sprd_vdsp_iommuvau_cll.h"

#ifdef pr_fmt
#undef pr_fmt
#endif
#define pr_fmt(fmt) "sprd-vdsp: [iommus]: %d %s: " fmt, current->pid, __func__

static void iommus_release(struct sprd_vdsp_iommus *iommus);
static int iommus_init(struct sprd_vdsp_iommus *iommus,
		       struct device_node *vxp_dev_of_node, struct device *dev)
{

	int iommu_cnt = 0;
	unsigned int index = 0;
	struct device_node *iommu_dev_of_node = NULL;
	struct sprd_vdsp_iommu_dev *iommu_dev = NULL;
	int ret = 0;

#ifdef KERNEL_VERSION_54
	const char *iommu_name;
#endif

	if (unlikely(!iommus)) {
		pr_err("Error: iommus is NULL!\n");
		return -EINVAL;
	}
	if (unlikely(!vxp_dev_of_node)) {
		pr_err("Error: vxp_dev_of_node is NULL!\n");
		return -EINVAL;
	}
#ifdef KERNEL_VERSION_54
	iommu_cnt = of_property_count_strings(vxp_dev_of_node, "iommu_names");
	if (iommu_cnt < 1) {
		pr_err("Error: iommu_names attribute not found\n");
		return -ENODEV;
	}
#else
	if (!of_find_property(vxp_dev_of_node, "iommus", NULL)) {
		pr_err("Error: iommus attribute not found");
		return -ENODEV;
	}
	iommu_cnt = of_count_phandle_with_args(vxp_dev_of_node, "iommus", NULL);
#endif
	pr_debug("iommu_cnt = %d\n", iommu_cnt);
	if (iommu_cnt <= 0) {
		pr_err("Error reading wsa device from DT. iommu_cnt = %d\n",
		       iommu_cnt);
		return -ENODEV;
	}
	if (iommu_cnt != SPRD_VDSP_IOMMU_MAX) {
		pr_err
		    ("Error: iommu_cnt != SPRD_VDSP_IOMMU_MAX. iommu_cnt = %d\n",
		     iommu_cnt);
		return -ENODEV;
	}

	for (index = 0; index < iommu_cnt; index++) {
#ifdef KERNEL_VERSION_54
		ret = of_property_read_string_index(vxp_dev_of_node,
						    "iommu_names", index,
						    &iommu_name);
		if (ret) {	// return 0 on success
			pr_err("Error: of_property_read_string_index failed\n");
			return ret;
		}

		iommu_dev_of_node =
		    of_find_compatible_node(NULL, NULL, iommu_name);
		if (unlikely(!iommu_dev_of_node)) {
			pr_err("Error: iommu node[%d]=%s not found\n", index,
			       iommu_name);
			return -EINVAL;
		} else {
			pr_info("iommu node[%d]=%s  found\n", index,
				iommu_name);
		}

#else
		iommu_dev_of_node =
		    of_parse_phandle(vxp_dev_of_node, "iommus", index);
		if (unlikely(!iommu_dev_of_node)) {
			pr_err("Error: iommus phandle index:%d not found\n",
			       index);
			return -EINVAL;
		}
#endif

		iommu_dev =
		    devm_kzalloc(dev, sizeof(struct sprd_vdsp_iommu_dev),
				 GFP_KERNEL);
		if (iommu_dev == NULL) {
			pr_err("Error: devm_kzalloc failed\n");
			return -ENOMEM;
		}
		iommu_dev->ops = &iommu_dev_ops;
		ret = iommu_dev->ops->init(iommu_dev, iommu_dev_of_node, dev);
		if (ret) {
			iommus_release(iommus);
			pr_err
			    ("Error: iommu_dev[%d] init failed, iommus_release\n",
			     index);
			return ret;
		}

		iommus->iommu_devs[index] = iommu_dev;
		of_node_put(iommu_dev_of_node);
	}
	mutex_init(&iommus->mutex);
	return 0;
}

static void iommus_release(struct sprd_vdsp_iommus *iommus)
{

	unsigned int index = 0;
	struct sprd_vdsp_iommu_dev *iommu_dev = NULL;

	if (unlikely(!iommus)) {
		pr_err("Error: iommus is NULL!\n");
		return;
	}
	for (index = 0; index < SPRD_VDSP_IOMMU_MAX; index++) {
		iommu_dev = iommus->iommu_devs[index];
		pr_debug("iommus[%d]\n", index);
		if ((iommu_dev) && (iommu_dev->status & (0x1 << 0))) {
			iommu_dev->ops->release(iommu_dev);
			pr_debug("release iommus[%d] sucessed\n", index);
		}
	}
	return;
}

static int iommus_map_idx(struct sprd_vdsp_iommus *iommus,
			  struct sprd_vdsp_iommu_map_conf *map_conf,
			  int iommu_dev_id)
{

	struct sprd_vdsp_iommu_dev *iommu_dev = NULL;
	int ret = 0;

	if (unlikely(iommus == NULL || map_conf == NULL)) {
		pr_err("Error: iommu_dev_list or map_conf is NULL!\n");
		return -EINVAL;
	}

	if ((iommu_dev_id < 0) || (iommu_dev_id > SPRD_VDSP_IOMMU_MAX)) {
		pr_err("Error: iommu_dev_id inval\n", iommu_dev_id);
		return -EINVAL;
	}

	iommu_dev = iommus->iommu_devs[iommu_dev_id];
	if (unlikely(!iommu_dev)) {
		pr_err("Error iommu_dev is NULL!\n");
		return -EINVAL;
	}
	ret = iommu_dev->ops->map(iommu_dev, map_conf);
	return ret;
}

static int iommus_map_all(struct sprd_vdsp_iommus *iommus,
			  struct sprd_vdsp_iommu_map_conf *map_conf)
{

	unsigned int index = 0;
	int ret = 0;
	int max = 0;

	if (unlikely(iommus == NULL || map_conf == NULL)) {
		pr_err("Error: iommu_dev_list or map_conf is NULL!\n");
		return -EINVAL;
	}
	mutex_lock(&iommus->mutex);
#ifdef BSP_DTB_SHARKL5PRO
	max = SPRD_VDSP_IOMMU_MAX - 1;	// sharkl5pro  SPRD_VDSP_IOMMU_VDMA set int dtb，but not use （power is't set）
#else
	max = SPRD_VDSP_IOMMU_MAX;
#endif
	for (index = 0; index < max; index++) {	//SPRD_VDSP_IOMMU_MAX
		ret = iommus_map_idx(iommus, map_conf, index);
		if (ret) {
			pr_err("Error:iommus_map_all failed,index=%d\n", index);
			mutex_unlock(&iommus->mutex);
			return ret;
		}
	}
	mutex_unlock(&iommus->mutex);
	return ret;
}

static int iommus_unmap_idx(struct sprd_vdsp_iommus *iommus,
			    struct sprd_vdsp_iommu_unmap_conf *unmap_conf,
			    int iommu_id)
{

	struct sprd_vdsp_iommu_dev *iommu_dev = NULL;
	int ret = 0;

	if (unlikely(iommus == NULL || unmap_conf == NULL)) {
		pr_err("Error: iommu_dev_list or unmap_conf is NULL!\n");
		return -EINVAL;
	}
	if ((iommu_id < 0) || (iommu_id > SPRD_VDSP_IOMMU_MAX - 1)) {
		pr_err("Error: iommu_id inval\n", iommu_id);
		return -EINVAL;
	}

	iommu_dev = iommus->iommu_devs[iommu_id];
	if (unlikely(!iommu_dev)) {
		pr_err("Error iommu_dev is NULL!\n");
		return -EINVAL;
	}
	ret = iommu_dev->ops->unmap(iommu_dev, unmap_conf);
	return ret;
}

int iommus_unmap_all(struct sprd_vdsp_iommus *iommus,
		     struct sprd_vdsp_iommu_unmap_conf *unmap_conf)
{

	unsigned int index = 0;
	int ret = 0;
	int max = 0;

	if (unlikely(iommus == NULL || unmap_conf == NULL)) {
		pr_err("Error: iommu_dev_list or unmap_conf is NULL!\n");
		return -EINVAL;
	}
	mutex_lock(&iommus->mutex);
#ifdef BSP_DTB_SHARKL5PRO
	max = SPRD_VDSP_IOMMU_MAX - 1;
#else
	max = SPRD_VDSP_IOMMU_MAX;
#endif
	for (index = 0; index < max; index++) {
		ret = iommus_unmap_idx(iommus, unmap_conf, index);
		if (ret) {
			pr_err
			    ("Error:sprd_vdsp_iommu_unmap_idx failed,ret=%d\n",
			     ret);
			mutex_unlock(&iommus->mutex);
			return ret;
		}
	}
	mutex_unlock(&iommus->mutex);
	return ret;
}

struct sprd_vdsp_iommus_ops iommus_ops = {
	.init = iommus_init,
	.release = iommus_release,
	.map_all = iommus_map_all,
	.unmap_all = iommus_unmap_all,
	.map_idx = iommus_map_idx,
	.unmap_idx = iommus_unmap_idx,
};
