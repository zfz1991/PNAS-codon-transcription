library(factoextra)
library(readxl)
m <- read_excel("D:/Data/mRNA seq/JGI_analysis results_all batches/clustering analysis/clustering based on genes with extreme CBI_20pct both ends.xlsx", 
                                                         sheet = "selected_transposed")
m <- as.data.frame(m)
rownames(m) <- m[,1]
m[,1] <- NULL
res.pca <- prcomp(m[,-4137], scale = TRUE) # Last column is the group names
fviz_eig(res.pca)
fviz_pca_ind(res.pca,
             geom.ind = "text",
             mean.point = FALSE,
             pointsize = 4,
             #labelsize = 10,
             #col.ind = "cos2", # Color by the quality of representation
             #gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             #addEllipses=TRUE, 
             #ellipse.level=0.95,
             #repel = TRUE,     # Avoid text overlapping
             habillage = m$Group
) +
  scale_color_brewer(palette="Set1") +
  theme_minimal()
