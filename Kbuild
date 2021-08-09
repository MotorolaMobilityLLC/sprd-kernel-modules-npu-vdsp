#
# sprd_vdsp.ko
#
# Kbuild: for kernel building external module
#
# Note:
# - Please refer to modules/sample/Kbuild to find out what should be
#   done is this Kbuild file
#

VDSP_DIR := Cadence

#
# Source List
#
KO_MODULE_NAME := sprd_vdsp
KO_MODULE_PATH := $(src)
KO_MODULE_SRC  :=

KO_MODULE_SRC += \
	$(wildcard $(KO_MODULE_PATH)/$(VDSP_DIR)/xrp/*.c)

#
# Final Objects
#
obj-m := $(KO_MODULE_NAME).o
# Comment it if the only object file has the same name with module
$(KO_MODULE_NAME)-y := $(patsubst $(src)/%.c,%.o,$(KO_MODULE_SRC))

#
# Build Options
#
ccflags-y += -DDEBUG
ccflags-y += -DKERNEL_VERSION_54
ccflags-y += -I$(KO_MODULE_PATH)/../interface
ccflags-y += -I$(srctree)/drivers/staging/android/ion
ccflags-y += -I$(srctree)/drivers/devfreq/apsys/
ccflags-y += -I$(srctree)/drivers/devfreq/apsys/vdsp
ccflags-y += -I$(KO_MODULE_PATH)/common
ccflags-y += -I$(KO_MODULE_PATH)/$(VDSP_DIR)/xrp

ifeq ($(CONFIG_COMPAT),y)
ccflags-y += -DCONFIG_COMPAT
endif

ifeq ($(TEST_ON_HAPS),true)
ccflags-y += -DTEST_ON_HAPS
endif
