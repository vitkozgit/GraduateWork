library(dplyr)
library(Hmisc)
library(stringr)
library(plotrix)
filenames <- list.files( pattern="*.txt", full.names=TRUE)
#ldf <- lapply(filenames, function (file) read.delim(file,  header = FALSE, sep = "", skip = 1))


num_reg <- regex("(\\d{3})")

res <- data.frame(x = seq(0,350,10), y = 0)
d <- list()
m <-  0
n <- 7
for(i in 1:length(filenames)) {
  d[[i]] <- read.delim(filenames[i],  header = FALSE, sep = "", skip = 1)
  num <- as.integer(str_match(filenames[i],num_reg)[1])
  res[i,1] = d[[i]]$V8[n]*cos(num*pi/180)
  res[i,2] = d[[i]]$V8[n]*sin(num*pi/180)
  m <-  max(d[[i]]$V8[n], m)
}

ang <- seq(0,2*pi,0.01)
circ <- data.frame(x = m * cos(ang) , y = m*sin(ang))

plot(circ$x,
     circ$y,
     col = "grey40",
     lwd = 2,
     yaxt = 'n',
     xaxt = 'n',
     ylab = "",
     xlab = "",
     type = "l")
abline(v = 0,
       h = 0,
       col = 'grey47',
       lty=5
       )
points(0,0,pch=3,lwd = 2)
points(res,
       pch=19,
       col = 'royalblue1',
       type = "b",
       lwd = 2)
