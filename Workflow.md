*01  Mafft多序列比对*
```bash
mafft --thread 64 --auto L.fasta > aligned_L_1774.fasta
```

*02  iqtree建树*
```bash
iqtree2 -s aligned_L_1774.fasta -m MFP -bb 1000 -bnni -nt 30
```

*03  iqtree建树&统计学检验*
```bash
iqtree2 -s /data/workdata/limk/03_genome_check/genome.fasta -m MFP -alrt 1000 -bb 1000 -nt 64
```
