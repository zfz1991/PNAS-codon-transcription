# -*- coding: utf-8 -*-
"""

Take log value of FPKM and calculate the pearson correlation between logFPKM and CBI. Take selected genes.

@author: Fangzhou
"""

import math
from scipy.stats import pearsonr
f_fpkm = open('FPKM_CBI.txt', 'r')
f_genelist = open('selected gene list.txt', 'r')
f_write = open('Correlation_logFPKM_CBI_selected genes.txt', 'w')
genelist = f_genelist.readlines()  # There is '\n' for each gene in the list
fpkm_lines = f_fpkm.readlines()
headers = fpkm_lines[0].split('\t')
cbi_index = len(headers) - 1
f_write.write('Strain\tCorrelation\n')
for i in range(2, len(headers) - 1):
    fpkm = []
    cbi = []
    for fpkm_line in fpkm_lines[1:]:
        fpkm_tags = fpkm_line.split('\t')
        if fpkm_tags[0] + '\n' in genelist:
                if float(fpkm_tags[i]) < 1:
                    print(fpkm_tags[0])
                if float(fpkm_tags[i]) == 0:
                    print('No expression for %s' %(fpkm_tags[0]))
                    fpkm.append(math.log(float(fpkm_tags[i]) + 1, 2)) # fpkm + 1 for genes with no expression
                else:
                    fpkm.append(math.log(float(fpkm_tags[i]), 2))
                cbi.append(float(fpkm_tags[cbi_index]))
    f_write.write(fpkm_lines[0].split('\t')[i] + '\t' + str(pearsonr(fpkm, cbi)) + '\t' + str(len(fpkm)) +'\n')
f_fpkm.close()
f_genelist.close()
f_write.close()
