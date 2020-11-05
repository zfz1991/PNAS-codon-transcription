# -*- coding: utf-8 -*-
"""
Created on Sat Feb 17 16:25:15 2018

Replace the gene_ID in FPKM file with NCU number. Replace the condition name(first row) with KO strain name. Add CBI value at the last colume.

@author: Fangzhou
"""

f_gene = open('Neurospora_Genome_annotation.txt', 'r')
f_cbi = open('Neurospora CBI.txt', 'r')
f_fpkm = open('NeucraEProfiling_8/Transcriptome Analysis/fpkm_counts.txt', 'r')
f_lib = open('NeucraEProfiling_8/Transcriptome Analysis/LIBRARIES.txt', 'r')
f_write = open('FPKM_CBI.txt', 'w')
gene_lines = f_gene.readlines()
cbi_lines = f_cbi.readlines()
fpkm_lines = f_fpkm.readlines()
lib_lines = f_lib.readlines()
fpkm_headers =  fpkm_lines[0].split('\t')
f_write.write('NCU\tGeneID')
for fpkm_header in fpkm_headers:
    for lib_line in lib_lines[16:]:
        lib_tags = lib_line.split('\t')
        if fpkm_header.replace('\n', '') == lib_tags[0]:
            f_write.write('\t' + lib_tags[4])
            break
f_write.write('\tCBI\n')            
for gene_line in gene_lines[1:]:
    flag =  0
    gene_tags = gene_line.split('\t')
    for fpkm_line in fpkm_lines[1:]:
        fpkm_tags = fpkm_line.split('\t')
        if gene_tags[19].split(';')[1].split('=')[1] ==  fpkm_tags[0]:
            f_write.write(gene_tags[0] + '\t' + fpkm_line[:-1])
            break
    for cbi_line in cbi_lines[1:]:
        cbi_tags = cbi_line.split('\t')
        if gene_tags[0] in cbi_tags[0]:
            f_write.write('\t' + cbi_tags[1])
            flag = 1
            break
    if flag == 0:
        f_write.write('\tNA\n')
f_gene.close()
f_cbi.close()
f_fpkm.close()
f_lib.close()
f_write.close()
