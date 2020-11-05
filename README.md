# PNAS-codon-transcription
Customized python and R codes for the paper "Genome-wide role of codon usage on transcription and identification of potential regulators "

calculate correlation.py: Python code to calculate the correlation between mRNA level and CBI for strains sequenced at JGI. Selected gene list was also provided in the repository. FPKM files downloaded from JGI needs to be first processed using "fpkm file processing.py".

fpkm file processing.py: Preprocessing for fpkm files downloaded from JGI genome portal. Modify the row names and column names to gene IDs and strain names, respectively. The "Neurospora_Genome_annotation" and "Neurospora CBI" files were also provided in the repository. fpkm and Library files were obtained directly from JGI genome portal.

generate distance matrix.R: Generate correlation matrix using differentially expressed genes from all candidate strains. For every pair of strains, the differentially expressed genes were combined and then their Log2(fold change) comparing to wild-type strain were used to calculate spearman correlation. 

heatmap.R: Codes for generating the heatmap and corresponding dendrogram. The correlation matrix was generated using "generate distance matrix.R". 

PCA analysis.R: Codes for performing the principle component analysis. 

violin plots.R: Codes for generating the violin plots. 
