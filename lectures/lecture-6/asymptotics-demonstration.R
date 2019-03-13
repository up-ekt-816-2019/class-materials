rm(list=ls())
gc()

library(tidyverse)
library(skimr)

# generate uniform random numbers
u <- runif(1000)
ggplot(data=as.tibble(u),aes(x=u)) + geom_density()

lambda = 1

inverseCDF <- function(p){
  x <- -log(1-p)/lambda
  return(x)
}

# R understands how to apply user-defined functions to whole vectors of inputs
myX <- inverseCDF(u)
ggplot(data=as.tibble(myX),aes(x=myX)) + geom_density()
