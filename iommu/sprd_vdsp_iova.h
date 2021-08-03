#ifndef _SPRD_VDSP_IOVA_H_
#define _SPRD_VDSP_IOVA_H_

#include <linux/types.h>

struct sprd_vdsp_iommu_iova {
	unsigned long iova_base;	// iova base addr
	size_t iova_size;	// iova range size
	struct gen_pool *pool;
	struct iommu_iova_ops *ops;
};

struct iommu_iova_ops {
	int (*iova_init) (struct sprd_vdsp_iommu_iova * iova,
			  unsigned long iova_base, size_t iova_size,
			  int min_alloc_order);
	void (*iova_release) (struct sprd_vdsp_iommu_iova * iova);
	unsigned long (*iova_alloc) (struct sprd_vdsp_iommu_iova * iova,
				     size_t iova_length);
	void (*iova_free) (struct sprd_vdsp_iommu_iova * iova,
			   unsigned long iova_addr, size_t iova_length);
};

extern struct iommu_iova_ops version12_iova_ops;

#endif // end _SPRD_VDSP_IOVA_H_
