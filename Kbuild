#
# sprd_vdsp.ko
#
# Kbuild: for kernel building external module
#
# Note:
# - Please refer to modules/sample/Kbuild to find out what should be
#   done is this Kbuild file
#

#
# Build Options
#
ifeq ($(BSP_BOARD_PRODUCT_USING_VDSP),sharkl5pro)
PROJ_DIR := sharkl5pro
ccflags-y += -DMYL5
ccflags-y += -DVDSP_IOMMU_EDP_ON
ccflags-y += -DVDSP_DVFS_MONITOR
else ifeq ($(BSP_BOARD_PRODUCT_USING_VDSP),qogirn6pro)
PROJ_DIR := qogirn6pro
ccflags-y += -DMYN6
ccflags-y += -DVDSP_DVFS_MONITOR
endif

ifeq ($(BSP_VDSP_TARGET_DTB),ums9620_3c10) #Apollo
ccflags-y += -DDVFS_HIGH_FREQ_RANGE
endif

#ccflags-y += -DDEBUG
ccflags-y += -g

#reserve mem
#ccflags-y += -DRESERVE_MEM

# iommu dirver use signal iova
ccflags-y += -DVDSP_IOMMU_USE_SIGNAL_IOVA

ifeq ($(CONFIG_COMPAT),y)
ccflags-y += -DCONFIG_COMPAT
endif

#
# Source List
#
KO_MODULE_NAME := sprd_vdsp
KO_MODULE_PATH := $(src)
KO_MODULE_SRC  :=
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/iommu/*.c)
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/memory/*.c)
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/xvp/*.c)
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/debug/*.c)
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/products/$(PROJ_DIR)/*.c)
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/dvfs/*.c)

ifeq ($(BSP_BOARD_PRODUCT_USING_VDSP),sharkl5pro) # sharkl5pro
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/products/$(PROJ_DIR)/ipi/*.c)
else ifeq ($(BSP_BOARD_PRODUCT_USING_VDSP),qogirn6pro) # qogirn6pro
KO_MODULE_SRC += $(wildcard $(KO_MODULE_PATH)/products/$(PROJ_DIR)/mailbox/*.c)
endif

#
# Build Options
#
ccflags-y += -I$(KO_MODULE_PATH)/xvp/
ccflags-y += -I$(KO_MODULE_PATH)/iommu/
ccflags-y += -I$(KO_MODULE_PATH)/memory/
ccflags-y += -I$(KO_MODULE_PATH)/debug/
ccflags-y += -I$(KO_MODULE_PATH)/products/$(PROJ_DIR)/
ccflags-y += -I$(KO_MODULE_PATH)/dvfs/

ifeq ($(BSP_BOARD_PRODUCT_USING_VDSP),sharkl5pro)
ccflags-y += -I$(srctree)/drivers/devfreq/apsys/
ccflags-y += -I$(srctree)/drivers/devfreq/apsys/vdsp/
ccflags-y += -I$(KO_MODULE_PATH)/products/$(PROJ_DIR)/ipi/

endif
ifeq ($(BSP_BOARD_PRODUCT_USING_VDSP),qogirn6pro)
ccflags-y += -I$(srctree)/drivers/devfreq/
ccflags-y += -I$(KO_MODULE_PATH)/../../../common/camera/mmdvfs/r2p0/dvfs_driver/dvfs_reg_param/qogirn6pro/
ccflags-y += -I$(KO_MODULE_PATH)/../../../common/camera/mmdvfs/r2p0/mmsys_comm/
ccflags-y += -I$(KO_MODULE_PATH)/../../../common/camera/os_adapt/linux
ccflags-y += -I$(KO_MODULE_PATH)/../../../common/camera/power/kernel/
ccflags-y += -I$(KO_MODULE_PATH)/products/$(PROJ_DIR)/mailbox/
endif
#
# Final Objects
#
obj-m := $(KO_MODULE_NAME).o
# Comment it if the only object file has the same name with module
$(KO_MODULE_NAME)-y := $(patsubst $(src)/%.c,%.o,$(KO_MODULE_SRC))