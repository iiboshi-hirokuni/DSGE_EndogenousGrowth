#====================================
# ノート7：パラメータ推定後の後処理
#====================================

# パスをsetwd()関数でzip解凍後のフォルダにセットしておくこと

setwd("G:/work/DSGE/NIH/NI/20170911/170910 ver1/egv1_eg_20170912")

library(coda)
library(R.matlab)
#library(xtable)

"%+%" <- function(a, b) paste(a, b, sep = "")

chain1 <- c()
chain2 <- c()
chain3 <- c()

modname <- "EGver1"

for (i in 1:1) {
chain1 <- rbind(chain1, readMat(file.path("./" %+% modname %+% "/metropolis", modname %+% "_mh" %+% i %+% "_blck1.mat"))$x2)
chain2 <- rbind(chain2, readMat(file.path("./" %+% modname %+% "/metropolis", modname %+% "_mh" %+% i %+% "_blck2.mat"))$x2)
chain3 <- rbind(chain3, readMat(file.path("./" %+% modname %+% "/metropolis", modname %+% "_mh" %+% i %+% "_blck3.mat"))$x2)
}

paraname0 <- readMat(file.path("./", modname %+% "_mode.mat"))

paraname <- c()
for(i in 1:length(paraname0$parameter.names))
  paraname <- c(paraname, paraname0$parameter.names[[i]][[1]][1])

len <- length(chain1[,1])
n_barnin <- len %/% 5
n_thin <- 10
m_chain1 <- chain1[seq((n_barnin+1),len, n_thin),]
m_chain2 <- chain2[seq((n_barnin+1),len, n_thin),]
m_chain3 <- chain3[seq((n_barnin+1),len, n_thin),]

colnames(m_chain1) <- paraname
colnames(m_chain2) <- paraname
colnames(m_chain3) <- paraname

#rslt <- mcmc.list(mcmc(m_chain1, start = n_barnin, thin = n_thin), mcmc(m_chain2, start = n_barnin, thin = n_thin))

rslt <- mcmc.list(mcmc(m_chain1, start = n_barnin, thin = n_thin), mcmc(m_chain2, start = n_barnin, thin = n_thin), mcmc(m_chain3, start = n_barnin, thin = n_thin))
plot(rslt, ask = T)

summary(rslt)

gelman.diag(rslt)

1-(rejectionRate(rslt[[1]])[1]+rejectionRate(rslt[[2]])[1]+rejectionRate(rslt[[3]])[1])/3


pdf("plotMCMC2.pdf", paper = "a4", width = 7, height = 9.5, pointsize = 10)
#par(mfrow = c(4, 2))
plot(rslt)
dev.off()



#sum <- summary(rslt)
#gew <- geweke.diag(rslt)
#
#ans <- as.matrix(sum$statistics[,1:2])
#ans <- cbind(ans, gew[[1]]$z, gew[[2]]$z)
#
#rownames(ans) <- paraname
#colnames(ans) <- c("Mean","SD","Z(1)", "Z(2)")
#
#cbind(1-rejectionRate(rslt[[1]][,1]), 1-rejectionRate(rslt[[2]][,1]))
#
#xtable(ans,digits = 3)
#
#pdf("posterior.pdf",paper="a4",width=7,height=9.5,pointsize=10)
#par(mfrow = c(4, 2))
#plot(rslt)
#dev.off()

