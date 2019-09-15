library(tidyverse)
library(mlbench)

data(BreastCancer)
BreastCancer <- tbl_df(BreastCancer)

BreastCancer

?BreastCancer

#removing any subjects that have missing values as PCA cannot cope with missing values:
BreastCancer <- na.omit(BreastCancer)

# Next we get just the predictors:
colnames(BreastCancer)
predictors <- BreastCancer %>% select(Cl.thickness:Mitoses)
predictors

# changing from categorical variables to numbers

predictors <- predictors %>% mutate_all(funs(as.numeric(.)))
predictors

#Now we will perform PCA and get the first two principal components:

PCA <- princomp(predictors, scores = TRUE)
BreastCancer$PC1 <- PCA$scores[,1]
BreastCancer$PC2 <- PCA$scores[,2]

#Finally, we look at the points:

ggplot(BreastCancer,aes(PC1, PC2)) +
  geom_point(aes(col = Class))
