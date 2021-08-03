
 /*****************************************************************************
 * Copyright (C) 2020 Unisoc Inc.
 * SPDX-License-Identifier: GPL-2.0
 *****************************************************************************/

#include <linux/genalloc.h>
#include <linux/module.h>
#include "sprd_vdsp_iova.h"

#ifdef pr_fmt
#undef pr_fmt
#endif
#define pr_fmt(fmt) "sprd-vdsp: [iommu_iova]: %d %s: "\
        fmt, current->pid, __func__
static unsigned int trace_iova_alloc_free = 0;

static int genalloc_iova_init(struct sprd_vdsp_iommu_iova *iova,
			      unsigned long iova_base, size_t iova_size,
			      int min_alloc_order)
{
	int ret = 0;

	if (unlikely(!iova)) {
		pr_err("Error: iova is NULL\n");
		return -EINVAL;
	}
	iova->iova_base = iova_base;
	iova->iova_size = iova_size;
	iova->pool = gen_pool_create(min_alloc_order, -1);
	if (!iova->pool) {
		pr_err("gen_pool_create error\n");
		return -1;
	}
	ret = gen_pool_add(iova->pool, iova_base, iova_size, -1);
	if (ret) {
		gen_pool_destroy(iova->pool);
		return ret;
	}
	pr_debug("iova init success,iova->iova_base=0x%lx,iova->iova_size=0x%x",
		 iova->iova_base, iova->iova_size);
	return 0;
}

static void genalloc_iova_release(struct sprd_vdsp_iommu_iova *iova)
{
	gen_pool_destroy(iova->pool);	//return type of void
	return;
}

static unsigned long genalloc_iova_alloc(struct sprd_vdsp_iommu_iova *iova,
					 size_t iova_length)
{
	unsigned long iova_addr = 0;

	iova_addr = gen_pool_alloc(iova->pool, iova_length);	//gen_pool_alloc failed return 0
	if (!iova_addr) {
		pr_err("Error: gen_pool_alloc failed!\n");
		return -ENOMEM;
	}
	return iova_addr;
}

static void genalloc_iova_free(struct sprd_vdsp_iommu_iova *iova,
			       unsigned long iova_addr, size_t iova_length)
{
	if (trace_iova_alloc_free) {
		pr_debug("iova->pool:0x%lx\n", (unsigned long)iova->pool);
		pr_debug("iova_addr:0x%lx\n", iova_addr);
	}
	gen_pool_free(iova->pool, iova_addr, iova_length);	//return type of void
	return;
}

struct iommu_iova_ops version12_iova_ops = {
	.iova_init = genalloc_iova_init,
	.iova_release = genalloc_iova_release,
	.iova_alloc = genalloc_iova_alloc,
	.iova_free = genalloc_iova_free,
};
