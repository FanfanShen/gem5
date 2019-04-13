echo "This is used for parsec benchmark test."

# gem5 home path
GEM5_DIR=/home/fandroid/mydoc/gem5
OUTPUT_DIR=/home/fandroid/mydoc/gem5/m5out
BINARY_DIR=/dist/m5/system/binaries


# excution code
$GEM5_DIR/build/ARM/gem5.debug --debug-flag=l3CacheAccess --debug-file=trace.out.gz \
        --outdir=$OUTPUT_DIR $GEM5_DIR/configs/example/parsec_l3_fs.py --maxinsts=2000000000 \
        --kernel=$BINARY_DIR/vmlinux.vexpress_gem5_v1_64 --machine-type=VExpress_GEM5_V1 \
	--script=$GEM5_DIR/benchmark/streamcluster_16c_simsmall_ckpts.rcS \
        --dtb-filename=$BINARY_DIR/armv8_gem5_v1_8cpu.dtb \
        -n 8 --cpu-clock=2GHz --cpu-type=O3_ARM_v7a_3 \
	--caches --l1d_size=32kB --l1d_assoc=2 --l1i_size=32kB --l1i_assoc=2 \
	--l2cache --l2_size=256kB --l2_assoc=8 \
        --l3cache --l3_size=8MB --l3_assoc=16
