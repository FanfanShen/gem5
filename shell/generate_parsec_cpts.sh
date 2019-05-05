# set working path
GEM5_DIR=/home/fandroid/mydoc/gem5
OUTPUT_DIR=/home/fandroid/mydoc/gem5/m5out/baseline

# different cpu cores have different ckpts. eg. 4 cores , 8cores.
echo "Generate the ckpts for 8cores with parsec in the dir: " + $OUTPUT_DIR

BENCHMARK=(01black 02body 03canneal 04dedup 05facesim 06ferret 07fluid 08freq 09stream 10swap 11vips 12x264)
SCRIPT=(blackscholes_8c_simlarge_ckpts.rcS bodytrack_8c_simlarge_ckpts.rcS canneal_8c_simlarge_ckpts.rcS dedup_8c_simlarge_ckpts.rcS facesim_8c_simlarge_ckpts.rcS ferret_8c_simlarge_ckpts.rcS fluidanimate_8c_simlarge_ckpts.rcS freqmine_8c_simlarge_ckpts.rcS streamcluster_8c_simlarge_ckpts.rcS swaptions_8c_simlarge_ckpts.rcS vips_8c_simlarge_ckpts.rcS x264_8c_simlarge_ckpts.rcS)

for((i=0;i<12;i++))
#for i in 0
do
  nohup nice -n 10 $GEM5_DIR/build/ALPHA/gem5.opt \
      --outdir=$OUTPUT_DIR/${BENCHMARK[$i]} \
      $GEM5_DIR/configs/example/fs.py -n 8 \
      --script=$GEM5_DIR/benchparsec/${SCRIPT[$i]} > $OUTPUT_DIR/${BENCHMARK[$i]}/runlog.txt 2>&1 &
  echo "-----" + ${BENCHMARK[$i]} + "---- is submit to run in grid----"
done
