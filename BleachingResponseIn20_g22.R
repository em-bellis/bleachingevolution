##This script simulates trajectories of bleaching response evolution over 20 generations based on varied values of omega and G22.

library(MASS)
library(car)
library(sfsmisc)
library(ggplot2)
library(gridExtra)

##choose parameter values
gen=100
theta = c(0.95,0.95)
zbar1.start=0.7
zbar2.start=0.6
P11=0.135
P22=0.05
q=matrix(c(0.75,0.25),2)

traject <- function(omega1, omega2, G22) {
##for each trajectory, calculate based on different g-matrix
G11=c(0.5*G22, G22, 2*G22, 4*G22, 8*G22, 16*G22, 32*G22)
r12=c(0.999, 0.75, 0.375, 0, -0.375, -0.75, -0.999)

df <- NULL
for(i in 1:length(G11)) { ##this loop controls different values of G11
	for(j in 1:length(r12)){ ##this loop controls different values of genetic correlation
		G12 <- r12[j]*sqrt(G11[i]*G22)
		rval <- r12[j]
		
		##create matrices
		omega.P = matrix(c(omega1+P11, 0, 0, omega2+P22), 2)
		inverse = solve(omega.P)
		zbar.mat=matrix(c(zbar1.start, zbar2.start),1)
		start=zbar.mat[1,]
		zbar=zbar.mat[1,]
		G=matrix(c(G11[i],G12,G12,G22),2)
		prod = G %*% inverse
		P=NULL
		
		##calculate trajectories
		delta=c(0,0)
		for (j in 2:gen) {
			delta = prod %*% (q*(theta - zbar))
			zbar=zbar+delta
			P=rbind(P,t(zbar))
		}
		
		T=rbind(t(start),P)
		dist_to_theta1 <- theta[1]-zbar1.start
		prop_in_20 <- (T[20,1])
		value <- c(G11[i], G22, G12, rval, omega1, omega2, prop_in_20)
		df <- rbind(df, value)
	}
}
df <- data.frame(df)
colnames(df) <- c("G11","G22","G12","r","omega1","omega2","prop_in_20")
return(df)
}

#run traject function with different values of omega and G22
df5 <- traject(1,1,0.005)
yval1 <- (df5[42,]$prop_in_20 + (df5[49,]$prop_in_20 - df5[42,]$prop_in_20)/2)
yval2 <- (df5[36,]$prop_in_20 + (df5[43,]$prop_in_20 - df5[36,]$prop_in_20)/2)
G0.005 <- ggplot(df5, aes(x=G11/G22, y=prop_in_20, group=r, color=r))+geom_line(size=1.5)+ scale_colour_gradientn(colours = c("#b2182b","#ef8a62","#fddbc7","#f7f7f7","#d1e5f0","#67a9cf","#2166ac")) + theme_bw() + theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), plot.margin= unit(c(1, 1, -1, -1), "lines"))+ xlab("")+theme(legend.position = "none")+ylab("")+ geom_segment(aes(x=24, y= yval2, xend=0, yend= yval2), color=1, lty=2)+ geom_segment(aes(x=24, y=yval1, xend=0, yend=yval1), color=1, lty=2) + scale_y_continuous(breaks=seq(0,1,0.1), limits=c(0.6,1.0))+ scale_x_continuous(expand = c(0, 0))

df5 <- traject(1,1,0.001)
yval3 <- (df5[42,]$prop_in_20 + (df5[49,]$prop_in_20 - df5[42,]$prop_in_20)/2)
yval4 <- (df5[36,]$prop_in_20 + (df5[43,]$prop_in_20 - df5[36,]$prop_in_20)/2)
G0.001 <- ggplot(df5, aes(x=G11/G22, y=prop_in_20, group=r, color=r))+geom_line(size=1.5)+ scale_colour_gradientn(colours = c("#b2182b","#ef8a62","#fddbc7","#f7f7f7","#d1e5f0","#67a9cf","#2166ac")) + theme_bw() + theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), plot.margin= unit(c(1, 1, -1, -1), "lines"))+ xlab("")+theme(legend.position = "none")+ylab("")+ geom_segment(aes(x=24, y= yval3, xend=0, yend= yval3), color=1, lty=2)+ geom_segment(aes(x=24, y=yval4, xend=0, yend=yval4), color=1, lty=2) + scale_y_continuous(breaks=seq(0,1,0.1), limits=c(0.6,1.0))+ scale_x_continuous(expand = c(0, 0))

df5 <- traject(1,1,0.0005)
yval5 <- (df5[42,]$prop_in_20 + (df5[49,]$prop_in_20 - df5[42,]$prop_in_20)/2)
yval6 <- (df5[36,]$prop_in_20 + (df5[43,]$prop_in_20 - df5[36,]$prop_in_20)/2)
G0.0005 <- ggplot(df5, aes(x=G11/G22, y=prop_in_20, group=r, color=r))+geom_line(size=1.5)+ scale_colour_gradientn(colours = c("#b2182b","#ef8a62","#fddbc7","#f7f7f7","#d1e5f0","#67a9cf","#2166ac")) + theme_bw() + theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank(), plot.margin= unit(c(1, 1, -1, -1), "lines"))+ xlab("")+theme(legend.position = "none")+ylab("")+ geom_segment(aes(x=24, y= yval5, xend=0, yend= yval5), color=1, lty=2)+ geom_segment(aes(x=24, y=yval6, xend=0, yend=yval6), color=1, lty=2) + scale_y_continuous(breaks=seq(0,1,0.1), limits=c(0.6,1.0))+ scale_x_continuous(expand = c(0, 0))

#save pdf
pdf("/Users/Weissem/Desktop/amnat_figs/br_figs/g22full.pdf", width=3.5, height=1.75)
grid.arrange(G0.005, G0.001, G0.0005, ncol=3, nrow=1, clip=T)
dev.off()