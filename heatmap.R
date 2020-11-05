library(gplots)
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap.2(as.matrix(cor_matrix), 
          distfun = function(cor_matrix) as.dist(1 - cor_matrix),
          col = col, 
          symm = TRUE, 
          trace = "none", 
          revC = TRUE,
          dendrogram = "row", 
          density.info = "none", 
          cexRow = 0.9, cexCol = 0.9)
