#get necessary packages
Library(ggplot2)
#load excel file
SpearmanCorr <- read_excel("file_path.xlsx")
#make into data frame
spearmandf <- data.frame(SpearmanCorr)
#rename column so it can be called in plotting commands
colnames(spearmancorrelationsedited)[1] <- "GeneID"
#make a violin plot showing the distribution of averages
#NOTE: this command is formatting dependent, geom_violin requires 
#both x and y parameters, even if we are looking at 1 dimension. 
#the x (or y) parameter is factorial. because we only want the distribution
#of 1 value, add a column to excel consisting of the desired label in the data set
#example, "average" written for every row in a column
vplot <- ggplot(data = spearmandf)+geom_violin(aes(x = factor(Avg), y = Average), 
      adjust = .3,draw_quantiles = c(0.25, 0.5, 0.75))
#flips graph for viewing purposes if needed
vplot + coord_flip()
# 2D dot plot (standard deviation (y) vs average (x)), with added 2d density lines
ps2 <- ggplot(spearmancorrelationsedited, aes(x = Average, y = S.D.))+ geom_point() + geom_density2d()

#code foe violin plots to measure frequencies of acesssions w snps versus wild type in expression data
ggplot(data = viodf)+geom_violin(aes(x = factor(Group), y = AverageZscore), adjust = .5,draw_quantiles = c(0.25, 0.5, 0.75))
