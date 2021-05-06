#path_tcga <- "C:/Users/Arne/Documents/Arbeit/TCGA/data2"
#load(file = file.path(path_tcga, "TCGA-FPKM_network_data_2019.RData"))
load("TCGA-FPKM_network_data_2019.RData")


library(huge)

huge(TCGA2)

ErsteDaten <- TCGA2[,13:86]

data <- as.matrix(ErsteDaten)

tiger <- huge(data, method = "tiger")
hausen <- huge(data, method = "mb")
glass <- huge(data,method = "glasso")

tiger1 <- huge.select(tiger, criterion = "ric")

hausen1 <- huge.select(hausen, criterion = "stars")
hausen2 <- huge.select(hausen, criterion = "ric")

glass1 <- huge.select(glass, criterion = "ric")
glass2 <- huge.select(glass, criterion = "stars")
glass3 <- huge.select(glass, criterion = "ebic")

plot(tiger1)
plot(hausen1)
plot(hausen2)
plot(glass1)
plot(glass2)
plot(glass3)

library(flare)

tiger_f <- sugm(data = data, method = "tiger")
clime   <- sugm(data = data, method = "clime")

tiger_f1 <- sugm.select(tiger_f, criterion = "stars")
tiger_f2 <- sugm.select(tiger_f, criterion = "cv")

clime_1 <- sugm.select(clime, criterion = "stars")
clime_2 <- sugm.select(clime, criterion = "cv")


plot(tiger_f)
plot(tiger_f1)
plot(tiger_f2)

plot(clime)
plot(clime_1)
plot(clime_2)
