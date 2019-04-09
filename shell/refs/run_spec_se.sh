# parsec on fs. need to modify in this file. 2019.3.12

# current working dir. used for finding the benchmarks.
cd /home/fandroid/mydoc/gem5/benchspec

# gem5 home dir
GEM5_DIR=/home/fandroid/mydoc/gem5
OUTPUT_DIR=/home/fandroid/mydoc/gem5/m5out
BINARY_DIR=/dist/m5/system/binaries
IMAGE_DIR=/dist/m5/system/disks

# running script
$GEM5_DIR/build/ARM/gem5.debug --debug-flags=Cache --debug-file=$OUTPUT_DIR/trace.out \
    --outdir=$OUTPUT_DIR $GEM5_DIR/configs/example/spec06_l3_se.py --benchmark=bzip2 \
    --kernel=$BINARY_DIR/vmlinux.vexpress_gem5_v1_64 --machine-type=VExpress_GEM5_V1 \
    --disk-image=$IMAGE_DIR/aarch64-ubuntu-trusty-headless.img \
    --dtb-filename=$BINARY_DIR/armv8_gem5_v1_8cpu.dtb \
    -n 8 --cpu-type=detailed --cpu-clock=2GHz \
    --mem-size=8GB --mem-channels=4 --mem-type=LPDDR3_1600_x32 \
    --caches --l1i_size=32kB --l1i_assoc=2 --l1d_size=32kB --l1d_assoc=2 \
    --l2cache --l2_size=1536kB --l2_assoc=8 \
    --l3cache --l3_size=3072kB --l3_assoc=16 \
    --fast-forward=10000000000 --maxinsts=2000000000
