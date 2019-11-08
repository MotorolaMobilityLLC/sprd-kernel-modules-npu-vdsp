/*
 * Copyright (C) 2019 Spreadtrum Communications Inc.
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

#include <linux/debugfs.h>
#include <linux/genalloc.h>
#include <linux/kernel.h>
#include <linux/list.h>
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/vmalloc.h>
#include <linux/sched.h>
#include <linux/seq_file.h>
#include <linux/slab.h>

#include <linux/sprd_iommu.h>
#include <linux/sprd_ion.h>
#include "ion.h"
#include "vdsp_smem.h"

#ifdef pr_fmt
#undef pr_fmt
#endif
#define pr_fmt(fmt) "VDSP_SMEM: %d %d %s : "\
	fmt, current->pid, __LINE__, __func__

static int __vdsp_mem_iommu_map(struct ion_buf *pfinfo, int idx)
{
	int i = 0, ret = 0;
	struct sprd_iommu_map_data iommu_data;

	if (!pfinfo || !pfinfo->dev) {
		pr_err("fail to get valid input pt"
				"pinfo:%p , pinfo dev:%p , num:%d\n",
		       pfinfo , pfinfo->dev,pfinfo->num);
		return -EINVAL;
	}

	for (i = 0; i < 2; i++) {
		if ((pfinfo->size[i] <= 0) || (pfinfo->buf[i] == NULL))
			continue;
		memset(&iommu_data, 0x00, sizeof(iommu_data));
		if (sprd_iommu_attach_device(pfinfo->dev) == 0) {
			memset(&iommu_data, 0x00, sizeof(iommu_data));
			iommu_data.buf = pfinfo->buf[i];
			iommu_data.iova_size = pfinfo->size[i];
			iommu_data.ch_type = SPRD_IOMMU_FM_CH_RW;
			iommu_data.sg_offset = pfinfo->offset[i];

			ret = sprd_iommu_map_with_idx(pfinfo->dev, &iommu_data, idx);
			if (ret) {
				pr_err("fail to get iommu kaddr %d\n", i);
				return ret;
			}

			pfinfo->iova[i] = iommu_data.iova_addr
				+ pfinfo->offset[i];
		} else {
			ret = sprd_ion_get_phys_addr(pfinfo->mfd[i],
						     NULL,
						     &pfinfo->iova[i],
						     &pfinfo->size[i]);
			if (ret) {
				pr_err("fail to get iommu phy addr %d mfd 0x%x\n",
				       i, pfinfo->mfd[i]);
				return ret;
			}
			pr_info("may be error path\n");
			pfinfo->iova[i] += pfinfo->offset[i];
		}
	}

	return ret;
}

static int __vdsp_mem_iommu_unmap(struct ion_buf *pfinfo, int idx)
{
	int i, ret = 0;
	struct sprd_iommu_unmap_data iommu_data;

	if (!pfinfo || !pfinfo->dev) {
		pr_err("fail to get valid input ptr\n");
		return -EINVAL;
	}

	for (i = 0; i < 2; i++) {
		if (pfinfo->size[i] <= 0)
			continue;
		memset(&iommu_data, 0x00, sizeof(iommu_data));
		if (sprd_iommu_attach_device(pfinfo->dev) == 0) {
			iommu_data.iova_addr = pfinfo->iova[i] - pfinfo->offset[i];
			iommu_data.iova_size = pfinfo->size[i];
			iommu_data.ch_type = SPRD_IOMMU_FM_CH_RW;
			iommu_data.buf = NULL;

			ret = sprd_iommu_unmap_with_idx(pfinfo->dev,
							&iommu_data, idx);
			if (ret) {
				pr_err("failed to free iommu %d\n", i);
				return ret;
			}
		}
	}

	return ret;
}


static int vdsp_mem_alloc(struct vdsp_mem_desc *ctx,
		struct ion_buf *ion_buf, int heap_type, size_t size)
{
	int ret = 0;

	pr_debug("ion_alloc buffer entry\n");

	memset(ion_buf, 0x00, sizeof(*ion_buf));

	ion_buf->dmabuf_p[0] = ion_new_alloc(size, heap_type, 0);
	if (IS_ERR_OR_NULL(ion_buf->dmabuf_p[0])) {
		pr_err("ion_alloc buffer fail\n");
		ret = -ENOMEM;
		return ret;
	}
	ret = sprd_ion_get_buffer(-1,
				  ion_buf->dmabuf_p[0],
				  &ion_buf->buf[0],
				  &ion_buf->size[0]);
	if (ret) {
		pr_err("failed to get ionbuf for kernel buffer %p\n",
		       ion_buf->dmabuf_p[0]);
		ret = -EFAULT;
		goto failed;
	}
	/*At vdsp faceid,we need phys addr,not iommu */
	if(ION_HEAP_ID_MASK_VDSP == heap_type)
	{
		ret = sprd_ion_get_phys_addr(-1,
				     ion_buf->dmabuf_p[0],
				     &ion_buf->addr_p[0],
				     &ion_buf->size[0]);
		if (ret) {
			pr_err("fail to get phy addr dmabuf_p %p\n",
					ion_buf->dmabuf_p[0]);
			ret = -EFAULT;
			goto failed;
		}
	}
	pr_debug("dmabuf_p[%p], ionbuf[%p], size %d, heap %d\n",
		ion_buf->dmabuf_p[0],
		ion_buf->buf[0], (int)ion_buf->size[0], heap_type);

	pr_debug("alloc done. %p\n", ion_buf);
	return 0;

failed:
	ion_free(ion_buf->dmabuf_p[0]);
	ion_buf->dmabuf_p[0] = NULL;
	ion_buf->buf[0] = NULL;
	ion_buf->size[0] = 0;
	ion_buf->addr_p[0] = 0;
	return ret;
}


static int vdsp_mem_free(struct vdsp_mem_desc *ctx,
		struct ion_buf *ion_buf)
{
	int rtn = 0;
	struct dma_buf *dmabuf = NULL;

	if (!ion_buf) {
		pr_err("error: input ptr is NULL\n");
		return -EFAULT;
	}

	dmabuf = ion_buf->dmabuf_p[0];
	if (dmabuf) {
		ion_free(dmabuf);
		ion_buf->dmabuf_p[0] = NULL;
		ion_buf->mfd[0] = 0;
		ion_buf->size[0] = 0;
		ion_buf->buf[0] = NULL;
		ion_buf->addr_p[0] = 0;
	}

	pr_debug("free done: %p, dmabuf[%p]\n", ion_buf, dmabuf);
	return rtn;
}


static int vdsp_mem_kmap(struct vdsp_mem_desc *ctx,
		struct ion_buf *buf_info)
{
	int i;
	int ret = 0;

	if (!buf_info) {
		pr_err("error: input ptr is NULL\n");
		return -EFAULT;
	}

	for (i = 0; i < 3; i++) {
		if ((buf_info->size[i] <= 0) ||
		    (buf_info->dmabuf_p[i] == NULL))
			continue;

		buf_info->addr_k[i] = (unsigned long)
			sprd_ion_map_kernel(buf_info->dmabuf_p[i], 0);
		if (IS_ERR_OR_NULL((void *)buf_info->addr_k[i])) {
			pr_err("fail to map k_addr for dmabuf[0x%p]\n",
			       buf_info->dmabuf_p[i]);
			buf_info->addr_k[i] = 0;
			ret = -EINVAL;
			goto map_fail;
		}

		pr_debug("buf%d, addr_k 0x%p, dmabuf[0x%p]\n", i,
			(void *)buf_info->addr_k[i], buf_info->dmabuf_p[i]);
	}

	pr_debug("done: 0x%p\n", (void *)buf_info->addr_k[0]);
	return 0;

map_fail:
	for (i = 0; i < 3; i++) {
		if ((buf_info->size[i] <= 0) ||
		    (buf_info->dmabuf_p[i] == NULL))
			continue;
		sprd_ion_unmap_kernel(buf_info->dmabuf_p[i], 0);
		buf_info->addr_k[i] = 0;
	}
	return ret;
}


static int vdsp_mem_kunmap(struct vdsp_mem_desc *ctx,
		struct ion_buf *buf_info)
{
	int i;
	int ret = 0;

	if (!buf_info) {
		pr_err("error: input ptr is NULL\n");
		return -EFAULT;
	}

	for (i = 0; i < 3; i++) {
		if ((buf_info->size[i] <= 0) ||
		    (buf_info->dmabuf_p[i] == NULL))
			continue;

		pr_debug("buf%d, addr_k %p, dmabuf[%p]\n", i,
			(void *)buf_info->addr_k[i], buf_info->dmabuf_p[i]);

		sprd_ion_unmap_kernel(buf_info->dmabuf_p[i], 0);
		buf_info->addr_k[i] = 0;
	}

	return ret;
}



static int vdsp_mem_get_ionbuf(struct vdsp_mem_desc *ctx,
		struct ion_buf *pfinfo)
{
	int i = 0, ret = 0;

	for (i = 0; i < 2; i++) {
		pr_debug("mfd i:%d, value:%d\n" , i , pfinfo->mfd[i]);
		if (pfinfo->mfd[i] > 0) {
			ret = sprd_ion_get_buffer(pfinfo->mfd[i],
						  NULL,
						  &pfinfo->buf[i],
						  &pfinfo->size[i]);
			if (ret) {
				pr_err("fail to get ion buffer\n");
				return -EFAULT;
			}
		}
	}
	return 0;
}


static int vdsp_mem_iommu_map(struct vdsp_mem_desc *ctx,
		struct ion_buf *pfinfo, int idx)
{
	int ret = 0;

	if (!pfinfo) {
		pr_err("invalid pfinfo\n");
		return -EINVAL;
	} else {
		if (!pfinfo->dev) {
			pfinfo->dev = ctx->dev;
			pr_debug("set default dev!\n");
		}
	}
	mutex_lock(&ctx->iommu_lock);
	switch (idx)
	{
	case IOMMU_MSTI:
	case IOMMU_MSTD:
	case IOMMU_IDMA:
	case IOMMU_VDMA:
		ret = __vdsp_mem_iommu_map(pfinfo, idx);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", idx);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}

		break;
	case IOMMU_ALL:
		ret = __vdsp_mem_iommu_map(pfinfo, IOMMU_MSTI);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", IOMMU_MSTI);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}
		pr_debug("first pfinfo->iova0 :%x\n",
				(unsigned int)pfinfo->iova[0]);
		ret = __vdsp_mem_iommu_map(pfinfo, IOMMU_MSTD);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", IOMMU_MSTD);
			__vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTI);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}
		pr_debug("second pfinfo->iova0 :%x\n",
				(unsigned int)pfinfo->iova[0]);
		ret = __vdsp_mem_iommu_map(pfinfo, IOMMU_IDMA);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", IOMMU_IDMA);
			__vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTI);
			__vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTD);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}
#if 0
		ret = __vdsp_mem_iommu_map(pfinfo, IOMMU_VDMA);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", IOMMU_VDMA);
			__vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTI);
			__vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTD);
			__vdsp_mem_iommu_unmap(pfinfo, IOMMU_IDMA);
			return ret;
		}
#endif
		break;
	default:
		pr_err("fail to get invalid iommu idx %d\n", idx);
		mutex_unlock(&ctx->iommu_lock);
		break;
	}
	mutex_unlock(&ctx->iommu_lock);
	return 0;
}

static int vdsp_mem_iommu_unmap(struct vdsp_mem_desc *ctx,
		struct ion_buf *pfinfo, int idx)
{
	int ret = 0;

	mutex_lock(&ctx->iommu_lock);
	switch (idx)
	{
	case IOMMU_MSTI:
	case IOMMU_MSTD:
	case IOMMU_IDMA:
	case IOMMU_VDMA:
		ret = __vdsp_mem_iommu_unmap(pfinfo, idx);
		if (ret)
		{
			pr_err("fail to unmap iommu: %d\n", idx);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}

		break;
	case IOMMU_ALL:
		ret = __vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTI);
		if (ret)
		{
			pr_err("fail to unmap iommu: %d\n", IOMMU_MSTI);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}
		ret = __vdsp_mem_iommu_unmap(pfinfo, IOMMU_MSTD);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", IOMMU_MSTD);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}
		ret = __vdsp_mem_iommu_unmap(pfinfo, IOMMU_IDMA);
		if (ret)
		{
			pr_err("fail to unmap iommu: %d\n", IOMMU_IDMA);
			mutex_unlock(&ctx->iommu_lock);
			return ret;
		}
#if 0
		ret = __vdsp_mem_iommu_unmap(pfinfo, IOMMU_VDMA);
		if (ret)
		{
			pr_err("fail to map iommu: %d\n", IOMMU_VDMA);
			return ret;
		}
#endif
		break;
	default:
		pr_err("fail to get invalid iommu idx %d\n", idx);
		mutex_unlock(&ctx->iommu_lock);
		break;
	}
	mutex_unlock(&ctx->iommu_lock);
	return ret;
}


static int vdsp_mem_register_callback(struct vdsp_mem_desc *ctx,
					  unsigned int idx,
					  mem_cb_t cb, void *arg)
{
	if (idx < CB_MAX) {
		ctx->cb_func[idx] = cb;
		ctx->cb_args[idx] = arg;
	} else {
		pr_err("error idx[%d]\n", idx);
	}

	return idx;
}


static int vdsp_mem_unregister_callback(struct vdsp_mem_desc *ctx,
					    unsigned int idx)
{
	if (idx < CB_MAX) {
		ctx->cb_func[idx] = NULL;
		ctx->cb_args[idx] = NULL;
	} else {
		pr_err("error idx[%d]\n", idx);
	}

	return idx;
}


struct vdsp_mem_ops vdsp_mem_ops = {
//	.ctx_init = ,
//	.ctx_deinit = ,
	.mem_alloc = vdsp_mem_alloc,
	.mem_free = vdsp_mem_free,
	.mem_kmap = vdsp_mem_kmap,
	.mem_kunmap = vdsp_mem_kunmap,
	.mem_iommu_map = vdsp_mem_iommu_map,
	.mem_iommu_unmap = vdsp_mem_iommu_unmap,
	.mem_get_ionbuf = vdsp_mem_get_ionbuf,
	.mem_register_callback = vdsp_mem_register_callback,
	.mem_unregister_callback = vdsp_mem_unregister_callback,
};

static struct vdsp_mem_desc s_vdsp_mem_desc = {
	.ops = &vdsp_mem_ops,
};


/*
 * Global function
 */
struct vdsp_mem_desc *get_vdsp_mem_ctx_desc(struct device *dev)
{
	if (dev)
		s_vdsp_mem_desc.dev = dev;

	return &s_vdsp_mem_desc;
}
EXPORT_SYMBOL_GPL(get_vdsp_mem_ctx_desc);

MODULE_AUTHOR("Camera System Design");
MODULE_DESCRIPTION("Share memory driver");
MODULE_LICENSE("GPL v2");
