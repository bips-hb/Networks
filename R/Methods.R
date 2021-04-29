#JGL tests

#http://www.benoslab.pitt.edu/manatakisECCB2018.html
#http://www.benoslab.pitt.edu/Software/pimgm/  
#for another paper, java script

library(JGL)
library(igraph)
data(example.data)
example1 <- example.data[[1]]
example2 <- example.data[[2]]

example1 <- example1[1:10,1:20]
example2 <- example2[1:10,1:20]
all <- list(example1,example2)

jpltest <- JGL(all, lambda1 = 0.1, lambda2 = 0.1)
plot(jpltest,layout = layout_on_grid())
plot.jgl()

library(huge)
library(fastclime)
library(flare)