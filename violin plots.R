library(ggplot2)
p <- ggplot(X04424_vs_4200FZ, aes(x=Group, y=CBI, fill = Group)) + geom_violin(trim=FALSE)
p + geom_boxplot(width=0.1) + scale_x_discrete(limits=c("Up", "CTRL", "Down"))
