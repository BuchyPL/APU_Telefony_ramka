a<-2*exp(5)
b<-2*a
help("sum")
x<-seq(15,25,1)
sum(x)
setwd("C:/Users/Buchy/Desktop/rstudio")
a="smartfony Samsung"
save(a, file="zmiennaA.csv")
rm(a)
load("zmiennaA.csv")
library(gridExtra)
b=mtcars
g<-tableGrob(b)
grid.table(g)
c=seq(20, 100, by = 4)
d=seq(9, 5)
e=seq(11,16)
f=c(d,e)
nazwa<-c("Samsung Galaxy Note20","Samsung Galaxy M11","Samsung Galaxy S21","Samsung Galaxy M51","Samsung J4","Samsung Galaxy M31s","Samsung Galaxy A71","Samsung Galaxy M21","Samsung Galaxy A12","Samsung Galaxy S20 FE")
wyswietlacz<-c(6.9,6.39,6.2,6.67,6.5,6.7,6.4,6.5,6.5,6.39)
ram<-c(12,3,8,6,6,6,4,4,6,6)
pamiec<-c(256,32,128,128,128,128,64,128,256,128)
aparat<-c(108,13,64,64,64,64,48,64,64,48)
cena<-c(4949,499,3699,1299,999,1599,999,799,1999,2999)
liczba_opini<-c(29,43,15,393,195,143,392,20,2,415)
telefony<-data.frame(nazwa,wyswietlacz,ram,pamiec,aparat,cena,liczba_opini)
mean(telefony$cena)
nazwa="samsung galaxy s10+"
wyswietlacz=6.4
ram=8
pamiec=128
aparat=16
cena=3399
liczba_opini=58
nowy<-data.frame(nazwa,wyswietlacz,ram,pamiec,aparat,cena,liczba_opini)
telefony<-rbind(telefony,nowy)
mean(telefony$cena)
telefony$ocena<-c(5,5,5,4.5,4,4,3,4,3,5,5)
nowy<-data.frame(nazwa="samsung zfold2",wyswietlacz=7.6,ram=12,pamiec=256,aparat=12,cena=6999,liczba_opini=6,ocena=5)
telefony<-rbind(telefony,nowy)
nowy<-data.frame(nazwa="samsung zflip",wyswietlacz=6.7,ram=8,pamiec=256,aparat=12,cena=5999,liczba_opini=10,ocena=4)
telefony<-rbind(telefony,nowy)
nowy<-data.frame(nazwa="samsung a42",wyswietlacz=6.6,ram=4,pamiec=128,aparat=48,cena=1449,liczba_opini=6,ocena=5)
telefony<-rbind(telefony,nowy)
nowy<-data.frame(nazwa="samsung s21+",wyswietlacz=6.7,ram=8,pamiec=128,aparat=64,cena=4399,liczba_opini=4,ocena=5)
telefony<-rbind(telefony,nowy)
library(plotrix)
dane <- aggregate(telefony$liczba_opini, list(telefony$ocena), sum)
barp(dane[,2], names.arg = dane[,1], main = 'Liczba opini przypadajacych na ocene')
percentage <- table(telefony$ocena)/length(telefony$liczba_opini)
pie(percentage)
fan.plot(percentage, labels = names(percentage), main = "Oceny")
nowa_k <- ifelse(telefony$liczba_opini>100,'wiecej 100 opinii',
                 +                    ifelse(telefony$liczba_opini>=50, '50-100 opinii', 
                                             +                           ifelse(telefony$liczba_opini>0, 'mniej 50 opinii', 
                                                                                +                                  'nie ma')))
telefony['status_opini'] <- factor(nowa_k)
pie(percentage)
for (i in 1:length(telefony$nazwa)){
  print(paste(telefony$nazwa[i], 'ma ocene klientow', telefony$ocena[i], ',bo ma liczbe opinii', telefony$liczba_opini[i]))
}
save(telefony, file="telefony.csv")

