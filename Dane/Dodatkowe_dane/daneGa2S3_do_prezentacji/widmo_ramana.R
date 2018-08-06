library(dplyr)
library(Hmisc)
library(stringr)
data <- read.delim("000.txt", sep = "")
data <- data %>% filter(X.Wave > 50) %>% filter(X.Wave<550)
par(cex.lab=1.7,mar=c(5,7,4,2))
plot(data,
     type = "l",
     xlim = c(50,550),
     lwd = 2,
     xlab = expression(paste("Przesunięcie Ramana [cm"^-1,"]")),
     ylab = "Intensywność [j.u]",
     yaxt = 'n',
     cex.lab = 1.5,
     cex.axis = 1.2,
     col = "royalblue")
minor.tick(nx =10, ny = 0)

c1 = "springgreen4" 
c2 = "firebrick4"
text(115, 6000 , "1", col = c1 , cex = 1.3)
text(147, 7200 , "2", col = c1, cex = 1.3)
text(234, 28800 , "3", col = c1, cex = 1.3)
text(329, 6000 , "4", col = c1, cex = 1.3)
text(363, 16500 , "5", col = c2, cex = 1.3)
text(388, 8500 , "6", col = c1, cex = 1.3)
text(400, 12200 , "7",col = c2, cex = 1.3)

