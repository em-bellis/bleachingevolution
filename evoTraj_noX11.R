#Depicts a simulated evolutionary trajectory for bleaching response in two environments, a la Figure 3A. 
#Original versions of this code were shared by Steve Arnold during Z599 : Evolutionary Quantitative Genetics, a course he taught at Oregon State University in Winter 2012.

library(MASS)
library(car)
library(sfsmisc)
library(ggplot2)
library(grid)

##choose parameter values
gen=100
theta = c(0.9,0.8)
zbar1.start=0.7
zbar2.start=0.6
G11=0.113
G22=0.005
P11=0.12
P22=0.05
omega1=1
omega2=1
q1=0.75
q=matrix(c(q1,(1-q1)),2)
r12=c(0.999, 0.75, 0.375, 0, -0.375, -0.75, -0.999)

##calculate evolutionary trajectories
df.T <- NULL
for(i in 1:length(r12)){ ##this loop controls different values of genetic correlation, creating a trajectory for each
  
  ##create matrices based on parameter values
  omega.P = matrix(c(omega1+P11, 0, 0, omega2+P22), 2)
  inverse = solve(omega.P)
  zbar.mat=matrix(c(zbar1.start, zbar2.start),1)
  start=zbar.mat[1,]
  zbar=zbar.mat[1,]
  G12 <- r12[i]*sqrt(G11*G22)
  G=matrix(c(G11,G12,G12,G22),2)
  prod = G %*% inverse
  P=NULL #clear P for each iteration; P stores each set of points for one trajectory sans the first row

  delta=c(0,0)
  for (j in 2:gen) {
	  delta = prod %*% (q*(theta - zbar))
	  zbar=zbar+delta
	  P.1=cbind(j, r12[i],t(zbar))
    P=rbind(P,P.1)
  }
  T.1 <- cbind(1, r12[i],t(start)) #create rows to id gen and r
  T <- rbind(T.1,P)  #add start position to P
  T <- data.frame(T)
  df.T <- rbind(df.T, T) #df.T combines P for each 
}

### create plot
interval = seq(from=20, to=length(df.T$j), by=20)
p <- ggplot(df.T, aes(x=V3, y=V4, group=V2, color=V2)) + geom_line(size=1.25)+ theme_bw()+ scale_colour_gradientn(name="Genetic correlation", colours = c("#b2182b","#ef8a62","#fddbc7","#f7f7f7","#d1e5f0","#67a9cf","#2166ac")) + xlab("Bleaching response\nEnvironment 1")+ ylab("Bleaching response\nEnvironment 2")  
for (i in 1:length(interval)) {
    p <- p + geom_segment(x= df.T[interval[i]-1,3], y=df.T[interval[i]-1,4], xend=df.T[interval[i],3], yend=df.T[interval[i],4], colour="black", arrow=arrow(type="closed", length=unit(0.2,"cm")))
}
p +  annotate("text", x = theta[1], y = theta[2], label = "+", size=15, color="black")
