#JGL tests

#http://www.benoslab.pitt.edu/manatakisECCB2018.html
#http://www.benoslab.pitt.edu/Software/pimgm/  
#for another paper, java script



library(usethis)
use_git_config(user.name = "Arne Godt", user.email = "arne23@hotmail.de")


# Dieses Package enthält eine wichtige Funktion mit 2 Optionen.
# Der Algorithmus braucht mehrere "ähnliche Netzwerke", also mehrere Beobachtungen gleicher Netzwerke
# Die Methode gibt dann mehrere Konzentrationsmatrizen zurück
# Zwei Tuning Parameter müssen gewählt werden
# 
library(JGL)
library(igraph)
data(example.data)
example1 <- example.data[[1]]
example2 <- example.data[[2]]

example1 <- example1[1:10,1:10]
example2 <- example2[1:10,1:10]
all <- list(example1,example2)

jpltest <- JGL(all, lambda1 = 0.1, lambda2 = 0.1)
plot(jpltest)


screen.fgl(all,lambda1 = 0.1, lambda2 = 0.1)

library(huge)

L = huge.generator(n = 50, d = 12, graph = "hub", g = 4)

huge1  <- huge(L$data, method = "mb")           # Meinshausen Bühlmann
huge2  <- huge(L$data, method = "glasso")       # Graphical Lasso
huge3 <- huge(L$data, method = "tiger")         # tuning intensive graph estimator
huge4 <- huge(L$data, method = "ct")            # correlation threshholding (Das ist kein Schätzer)

plot(huge1)

huge(example1)

library(fastclime)
X = fastclime.generator(n = 100, d = 20)
out1 = fastclime(X$data,0.1)
out2 = fastclime.selector(out1$lambdamtx, out1$icovlist,0.2)
fastclime.plot(out2)

plot(out1)


library(flare)


n = 50
d = 100
X = matrix(rnorm(n*d), n, d)
beta = c(3,2,0,1.5,rep(0,d-4))
eps = rnorm(n)
Y = X%*%beta + eps
nlamb = 5
ratio = 0.3
out5 = slim(X=X,Y=Y)
plot(out5)



D = sugm.generator(n=n,d=d,graph="band",g=1)
plot(D)
## sparse precision matrix estimation with method "clime"
out1 = sugm(D$data, method = "clime")
plot(out1)
sugm.plot(out1$path[[4]])
## sparse precision matrix estimation with method "tiger"
out2 = sugm(D$data, method = "tiger")
plot(out2)
sugm.plot(out2$path[[5]])
