#!/usr/bin/env bash

##This is a script for checking the quality of the raw reads using fastqc.

##Change directories to where the fastq files are stored

cd ~/epichloe_2024/02_trimming/results/01

##Load the conda environment where fastqc is installed

source ~/anaconda3/etc/profile.d/conda.sh
conda activate fastqc

#Do the analysis

declare -a runqc=(*.fastq.gz)

for file in ${runqc[@]}

do
	echo Checking the quality of ${runqc}
	fastqc -o ~/epichloe_2024/02_trimming/qc/01 --noextract -t 32 ${file}
	echo Finished with the quality check of ${runqc}
done

cd ~/epichloe_2024/02_trimming/qc
multiqc -o ~/epichloe_2024/02_trimming/qc/01 01/

#repeat all the steps for every replicate

cd ~/epichloe_2024/02_trimming/results/02

declare -a runqc=(*.fastq.gz)

for file in ${runqc[@]}

do
	echo Checking the quality of ${runqc}
	fastqc -o ~/epichloe_2024/02_trimming/qc/02 --noextract -t 32 ${file}
	echo Finished with the quality check of ${runqc}
done

cd ~/epichloe_2024/02_trimming/qc
multiqc -o ~/epichloe_2024/02_trimming/qc/02 02/


cd ~/epichloe_2024/02_trimming/results/03

declare -a runqc=(*.fastq.gz)

for file in ${runqc[@]}

do
	echo Checking the quality of ${runqc}
	fastqc -o ~/epichloe_2024/02_trimming/qc/03 --noextract -t 32 ${file}
	echo Finished with the quality check of ${runqc}
done

cd ~/epichloe_2024/02_trimming/qc
multiqc -o ~/epichloe_2024/02_trimming/qc/03 03/