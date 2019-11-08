cmd_/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.o := clang -Wp,-MD,/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/.vdsp_sipc.o.d  -nostdinc -isystem /home/kevin.yang/sprdroidq_trunk_test/prebuilts/clang/host/linux-x86/clang-r353983c/lib64/clang/9.0.3/include -I/home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include -I./arch/arm64/include/generated  -I/home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include -I./include -I/home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi -I./include/generated/uapi -include /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kconfig.h  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -Qunused-arguments -Wall -Werror -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 --target=aarch64-linux-gnu --prefix=/home/kevin.yang/sprdroidq_trunk_test/bsp/toolchain/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/ --gcc-toolchain=/home/kevin.yang/sprdroidq_trunk_test/bsp/toolchain/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -no-integrated-as -fno-PIE -mno-implicit-float -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -fno-pic -Wno-asm-operand-widths -DKASAN_SHADOW_SCALE_SHIFT=3 -fno-delete-null-pointer-checks -Wno-address-of-packed-member -Os -Wframe-larger-than=4096 -fstack-protector-strong -Wno-format-invalid-specifier -Wno-gnu -Wno-duplicate-decl-specifier -Wno-tautological-compare -mno-global-merge -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fno-stack-check -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Wno-initializer-overrides -Wno-unused-value -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-uninitialized -DDEBUG -DKERNEL_VERSION_414  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/../interface  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/drivers/staging/android/ion  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/drivers/devfreq/apsys/  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/drivers/devfreq/apsys/vdsp  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/common  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/xrp  -I/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/inc -DCONFIG_COMPAT  -DMODULE -mcmodel=large  -DKBUILD_BASENAME='"vdsp_sipc"'  -DKBUILD_MODNAME='"vdsp_sipc"' -c -o /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/.tmp_vdsp_sipc.o /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.c

source_/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.o := /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.c

deps_/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.o := \
    $(wildcard include/config/debug/fs.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/compiler-clang.h \
    $(wildcard include/config/lto/clang.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/debugfs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/fs.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/ext4/reserve/space/filter.h) \
    $(wildcard include/config/migration.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/linkage.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/stringify.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/linkage.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/wait_bit.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/wait.h \
    $(wildcard include/config/lockdep.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/int-ll64.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/int-ll64.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/bitsperlong.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitsperlong.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/bitsperlong.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/posix_types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/stddef.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/stddef.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/posix_types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/posix_types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/const.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
  /home/kevin.yang/sprdroidq_trunk_test/prebuilts/clang/host/linux-x86/clang-r353983c/lib64/clang/9.0.3/include/stdarg.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/barrier.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/barrier.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kasan-checks.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/bitops.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/bits.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/bitops.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/builtin-__ffs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/builtin-ffs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/builtin-__fls.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/builtin-fls.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/ffz.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/fls64.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/sched.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/hweight.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/arch_hweight.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/const_hweight.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/lock.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/non-atomic.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bitops/le.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/byteorder.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/byteorder/little_endian.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/swab.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/swab.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/byteorder/generic.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/typecheck.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kern_levels.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/kernel.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/sysinfo.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/cache.h \
    $(wildcard include/config/kasan/sw/tags.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/cputype.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/broken/gas/inst.h) \
    $(wildcard include/config/arm64/4k/pages.h) \
    $(wildcard include/config/arm64/16k/pages.h) \
    $(wildcard include/config/arm64/64k/pages.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dynamic_debug.h \
    $(wildcard include/config/jump/label.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/build_bug.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm64/include/generated/asm/preempt.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/preempt.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/bug.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/brk-imm.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/restart_block.h \
    $(wildcard include/config/compat.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/current.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/thread_info.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/debug/align/rodata.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/arm64/page/shift.h) \
    $(wildcard include/config/arm64/cont/shift.h) \
  arch/arm64/include/generated/asm/sizes.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/sizes.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sizes.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pfn.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/stack_pointer.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/irqflags.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/ptrace.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/ptrace.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/hwcap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/hwcap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/ptrace.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/bottom_half.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/spinlock_types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/spinlock_types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/lockdep/crossrelease.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rwlock_types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/spinlock.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/lse.h \
    $(wildcard include/config/as/lse.h) \
    $(wildcard include/config/arm64/lse/atomics.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
    $(wildcard include/config/foo.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/cpucaps.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/insn.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/string.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/string.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/fpsimd.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/hw_breakpoint.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/cpufeature.h \
    $(wildcard include/config/arm64/ssbd.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/jump_label.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/atomic.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/atomic_lse.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/cmpxchg.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/atomic-long.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/virt.h \
    $(wildcard include/config/arm64/vhe.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/sections.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/sections.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/pgtable/levels.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rwlock.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/wait.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kdev_t.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/kdev_t.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dcache.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rculist.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/sprd/core/ctl.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/bitmap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rcutree.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rculist_bl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/list_bl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/bit_spinlock.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/seqlock.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  include/generated/bounds.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/path.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/stat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/stat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/stat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/stat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/compat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/sched/walt.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/cpu/freq/times.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/livepatch.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/sched.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pid.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/time64.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/time.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  arch/arm64/include/generated/asm/div64.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/div64.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/sem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/ipc.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/highuid.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rhashtable.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/err.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/errno.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/errno-base.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/errno.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/errno.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/jhash.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/unaligned/packed_struct.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/list_nulls.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/ktime.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/jiffies.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/timex.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/timex.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/param.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/param.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/param.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/timex.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/arm/arch/timer/ool/workaround.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/arm64/acpi/parking/protocol.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/percpu.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/timecounter.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/timex.h \
  include/generated/timeconst.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/timekeeping.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/osq_lock.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/ipcbuf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/sembuf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/shm.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/page.h \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/personality.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/personality.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/pgtable-types.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/pgtable-nopud.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/pgtable-nop4d-hack.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/5level-fixup.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/getorder.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/shm.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/shmbuf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/shmparam.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/shmparam.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kcov.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/kcov.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rbtree.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/timerqueue.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/seccomp.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/seccomp.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/unistd.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/unistd.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/unistd.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/unistd.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/seccomp.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/unistd.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/resource.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/resource.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/resource.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/latencytop.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sched/prio.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/signal.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/signal.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/signal.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/signal.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/signal-defs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/sigcontext.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/siginfo.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/siginfo.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/magic.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/stat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/list_lru.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/shrinker.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  arch/arm64/include/generated/asm/rwsem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/rwsem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mm_types.h \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hmm.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/auxvec.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/auxvec.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/auxvec.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/completion.h \
    $(wildcard include/config/lockdep/completions.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/uprobes.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/page-flags-layout.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/sparsemem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/mmu.h \
    $(wildcard include/config/unmap/kernel/at/el0.h) \
    $(wildcard include/config/harden/branch/predictor.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/capability.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/capability.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/semaphore.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/fcntl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/fcntl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/uapi/asm/fcntl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/fcntl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/fiemap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/migrate_mode.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/percpu-rwsem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rcuwait.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rcu_sync.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/delayed_call.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/uuid.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/uuid.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/errseq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/fs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/limits.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/ioctl.h \
  arch/arm64/include/generated/uapi/asm/ioctl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/ioctl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/ioctl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/percpu_counter.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/notifier.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rcu_segcblist.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/srcutree.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/topology.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/arch_topology.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/topology.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/dqblk_xfs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dqblk_v1.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dqblk_v2.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dqblk_qtree.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/projid.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/quota.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/nfs_fs_i.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/seq_file.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/keys.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/key.h \
    $(wildcard include/config/sysctl.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sysctl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/sysctl.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/net.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/irq/timings.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irqreturn.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irqnr.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/irqnr.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/hardirq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/static_key.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/hardirq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/irq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/irq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/kvm_arm.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/esr.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irq_cpustat.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kref.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/io.h \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/pci.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/io.h \
    $(wildcard include/config/sprd/last/regs.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/pgtable.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/proc-fns.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/pgtable-prot.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/fixmap.h \
    $(wildcard include/config/acpi/apei/ghes.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/boot.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/fixmap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/pgtable.h \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/x86/espfix64.h) \
  arch/arm64/include/generated/asm/early_ioremap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/xen/xen.h \
    $(wildcard include/config/xen.h) \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/vmalloc.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/module.h \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/cfi/clang.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kmod.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/umh.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/elf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/elf.h \
  arch/arm64/include/generated/asm/user.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/user.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/elf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/elf-em.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sysfs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/idr.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kobject_ns.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/rbtree_latch.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/cfi.h \
    $(wildcard include/config/cfi/clang/shadow.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/module.h \
    $(wildcard include/config/arm64/module/plts.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/randomize/base.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/of_address.h \
    $(wildcard include/config/of/address.h) \
    $(wildcard include/config/of.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/ioport.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/attach/node.h) \
    $(wildcard include/config/detach/node.h) \
    $(wildcard include/config/add/property.h) \
    $(wildcard include/config/remove/property.h) \
    $(wildcard include/config/update/property.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/no/change.h) \
    $(wildcard include/config/change/add.h) \
    $(wildcard include/config/change/remove.h) \
    $(wildcard include/config/of/resolve.h) \
    $(wildcard include/config/of/overlay.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mod_devicetable.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/property.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/fwnode.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/of_device.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/cpu.h \
    $(wildcard include/config/pm/sleep/smp.h) \
    $(wildcard include/config/hotplug/smt.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/node.h \
    $(wildcard include/config/memory/hotplug/sparse.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/klist.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pinctrl/devinfo.h \
    $(wildcard include/config/pm.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pinctrl/consumer.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pinctrl/pinctrl-state.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/ratelimit.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/device.h \
    $(wildcard include/config/iommu/api.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/pm_wakeup.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/cpuhotplug.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/of_platform.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/of_irq.h \
    $(wildcard include/config/ppc32.h) \
    $(wildcard include/config/ppc/pmac.h) \
    $(wildcard include/config/of/irq.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irq.h \
    $(wildcard include/config/generic/irq/effective/aff/mask.h) \
    $(wildcard include/config/generic/irq/ipi.h) \
    $(wildcard include/config/irq/domain/hierarchy.h) \
    $(wildcard include/config/generic/irq/migration.h) \
    $(wildcard include/config/generic/pending/irq.h) \
    $(wildcard include/config/hardirqs/sw/resend.h) \
    $(wildcard include/config/generic/irq/legacy/alloc/hwirq.h) \
    $(wildcard include/config/generic/irq/legacy.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irqhandler.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/kasan.h \
    $(wildcard include/config/kasan/generic.h) \
  arch/arm64/include/generated/asm/irq_regs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/irq_regs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irqdesc.h \
    $(wildcard include/config/irq/preflow/fasteoi.h) \
    $(wildcard include/config/generic/irq/debugfs.h) \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/handle/domain/irq.h) \
  arch/arm64/include/generated/asm/hw_irq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/asm-generic/hw_irq.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/irqdomain.h \
    $(wildcard include/config/irq/domain.h) \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/inc/vdsp_sipc.h \
    $(wildcard include/config/sprd/sipc/zero/copy/sipx.h) \
    $(wildcard include/config/sprd/sipc/v2.h) \
    $(wildcard include/config/arm64.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/poll.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/uaccess.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/uaccess.h \
    $(wildcard include/config/arm64/pan.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/kernel-pgtable.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/compiler.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/extable.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/poll.h \
  arch/arm64/include/generated/uapi/asm/poll.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/asm-generic/poll.h \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/xrp/vdsp_smem.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sprd_iommu.h \
    $(wildcard include/config/sprd/iommu.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/arch/has/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/x86/intel/memory/protection/keys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/device/public.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/e/show/mem.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/process/reclaim.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/range.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/percpu-refcount.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/page_ext.h \
    $(wildcard include/config/idle/page/tracking.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/stackdepot.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/tracepoint-defs.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/memremap.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/huge_mm.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/cacheflush.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/sprd_ion.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/sprd_ion.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dma-buf.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/file.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dma-mapping.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/dma/set/coherent/mask.h) \
    $(wildcard include/config/need/dma/map/state.h) \
    $(wildcard include/config/dma/api/debug.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dma-debug.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dma-direction.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/dma-mapping.h \
    $(wildcard include/config/iommu/dma.h) \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/arch/arm64/include/asm/xen/hypervisor.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/xen/arm/hypervisor.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/dma-fence.h \
    $(wildcard include/config/dma/fence/trace.h) \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/drivers/staging/android/ion/ion.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/linux/miscdevice.h \
  /home/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/include/uapi/linux/major.h \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/kernel/kernel4.14/drivers/staging/android/ion/../uapi/ion.h \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/inc/vdsp_sipc_priv.h \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/xrp/vdsp_ipi_drv.h \
  /home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/common/sprd_vdsp_mm.h \

/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.o: $(deps_/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.o)

$(deps_/home4/kevin.yang/sprdroidq_trunk_test/bsp/modules/npu/vdsp/Cadence/uipc/sipc/src/vdsp_sipc.o):
