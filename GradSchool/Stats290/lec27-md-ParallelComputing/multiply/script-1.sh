#!/bin/bash

#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --mem=1024
#SBATCH --job-name=multiply-001
#SBATCH --output=multiply-001.out
#SBATCH --error=multiply-001.err
#SBATCH --workdir=/home/users/naras/multiply

#now run normal batch commands
module load R/3.4.0

## No user serviceable part below

./multiply.R params.csv 1

