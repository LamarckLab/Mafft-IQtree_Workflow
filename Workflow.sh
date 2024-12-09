#!/bin/bash

# 设置线程数和输入输出路径
THREADS=64
INPUT_FILE="L.fasta"
OUTPUT_ALIGNED="aligned_L_1774.fasta"
GENOME_FILE="/data/workdata/limk/03_genome_check/genome.fasta"
OUTPUT_TREE="tree_result"

# 01. Mafft多序列比对
echo "Running Mafft for multiple sequence alignment..."
mafft --thread $THREADS --auto $INPUT_FILE > $OUTPUT_ALIGNED
echo "Mafft alignment finished. Output saved to $OUTPUT_ALIGNED."

# 02. iqtree建树
echo "Running iqtree2 for tree construction..."
iqtree2 -s $OUTPUT_ALIGNED -m MFP -bb 1000 -bnni -nt 30 -o $OUTPUT_TREE
echo "iqtree2 tree construction finished. Tree saved as $OUTPUT_TREE."

# 03. iqtree建树 & 统计学检验
echo "Running iqtree2 for tree construction with statistical tests..."
iqtree2 -s $GENOME_FILE -m MFP -alrt 1000 -bb 1000 -nt $THREADS -o ${OUTPUT_TREE}_genome
echo "iqtree2 tree construction and statistical testing finished. Results saved as ${OUTPUT_TREE}_genome."

echo "Pipeline completed."
