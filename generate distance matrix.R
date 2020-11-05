fc_all <- read.csv(file = 'DEG_18 candidates.csv', fill = FALSE)

cal_spearman_cor <- function(col_index_1, col_index_2){
  fold_change <- as.data.frame(matrix(nrow = 0, ncol = 3))
  for(gene in fc_all[, col_index_1]){
    if(gene != ""){
      row_index_1 <- grep(gene, fc_all[, col_index_1])
      row_index_2 <- grep(gene, fc_all[, col_index_2])
      if(length(row_index_2) > 0){
        fc_1 <- fc_all[row_index_1, col_index_1 + 1]
        fc_2 <- fc_all[row_index_2, col_index_2 + 1]
        if(fc_1 >= 1 || fc_1 <= -1){
          fold_change[nrow(fold_change) + 1,] = list(gene, fc_1, fc_2)
        }
      }
    }
  }
  for(gene_a in fc_all[, col_index_2]){
    if(gene_a != ""){
      row_index_1_a <- grep(gene_a, fc_all[, col_index_1])
      row_index_2_a <- grep(gene_a, fc_all[, col_index_2])
      if(length(row_index_1_a) > 0 && length(grep(gene_a, fold_change[, 1])) == 0){
        fc_1_a <- fc_all[row_index_1_a, col_index_1 + 1]
        fc_2_a <- fc_all[row_index_2_a, col_index_2 + 1]
        if(fc_2_a >= 1 || fc_2_a <= -1){
          fold_change[nrow(fold_change) + 1,] = list(gene_a, fc_1_a, fc_2_a)
        }
      }
    }
  }
  return(cor(x = fold_change[,2], y = fold_change[,3], use = "pairwise.complete.obs", method = "spearman"))
}

cor_matrix <- as.data.frame(matrix(nrow = 18, ncol = 18))
k <- 1
for (i in seq(1, ncol(fc_all), by = 2)){
  strain_a = colnames(fc_all)[i]
  rownames(cor_matrix)[k] <- strain_a
  l <- 1
  for (j in seq(1, ncol(fc_all), by = 2)){
    strain_b = colnames(fc_all)[j]
    if(i == 1){
      colnames(cor_matrix)[l] <- strain_b
    }
    cor_matrix[k, l] <- cal_spearman_cor(i, j)
    l <- l + 1
  }
  k <- k + 1
}










