#!/bin/bash -e
#SBATCH --job-name=AtomsCavityBasisDemo # job name (shows up in the queue)
#SBATCH --time=2:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=16GB          # Memory in MB

module purge
module load Python
python -m cProfile -o output.pstats AtomsCavityBasisDemo.py -c ./Configs/largeconfig2.ini
gprof2dot --colour-nodes-by-selftime -f pstats output.pstats | \
    dot -Tpng -o output_large2.png
