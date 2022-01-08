# Creat my dataset
library(dplyr)
library(purrr)



# Import the Data set
computerByHome <- read.csv(file = "Database/ComputersByHome.csv")
computerByHome$NAME <- do.call(paste, c(computerByHome[c("LOCATION", "TIME")], sep = " "))
CBH <- computerByHome[c("NAME","Value" )]

pesquisa <- read.csv(file = "Database/Researches.csv")
pesquisa$NAME <- do.call(paste, c(pesquisa[c("LOCATION", "TIME")], sep = " "))
RES <- pesquisa[c("NAME","Value" )]


employeement <- read.csv(file = "Database/Employeement.csv")
employeement$NAME <- do.call(paste, c(employeement[c("LOCATION", "TIME")], sep = " "))
EMP <- employeement[c("NAME","Value" )]

exports <- read.csv(file = "Database/Exports.csv")
exports$NAME <- do.call(paste, c(exports[c("LOCATION", "TIME")], sep = " "))
EXP <- exports[c("NAME","Value" )]

internetAcess <- read.csv(file = "Database/InternetAcess.csv")
internetAcess$NAME <- do.call(paste, c(internetAcess[c("LOCATION", "TIME")], sep = " "))
INT <- internetAcess[c("NAME","Value" )]

investment <- read.csv(file = "Database/Investiment.csv")
investment$NAME <- do.call(paste, c(investment[c("LOCATION", "TIME")], sep = " ")) 
INV <- investment[c("NAME","Value" )]

innequality <- read.csv(file = "Database/GINI.csv")
innequality$NAME <- do.call(paste, c(innequality[c("LOCATION", "TIME")], sep = " ")) 
GINI <- innequality[c("NAME","Value" )]


pib <- read.csv(file = "Database/GPD.csv")
indicator <- c("MLN_USD"," ")
pib <- filter(pib, pib$MEASURE %in% indicator)
pib$NAME <- do.call(paste, c(pib[c("LOCATION", "TIME")], sep = " "))
GPD <- pib[c("NAME","Value" )]

temp1 <- merge(CBH, INV, by="NAME")
colnames(temp1) <- c("NAME", "X", "Y")
temp2 <- merge(temp1, GPD, by="NAME")
colnames(temp2) <- c("NAME", "X", "Y", "Z")
temp3 <- merge(temp2, RES, by="NAME")
colnames(temp3) <- c("NAME", "X", "Y", "Z", "W")
# temp4 <- merge(temp3, GINI, by="NAME")
# colnames(temp4) <- c("NAME", "X", "Y", "Z", "W", "V")
df <- merge(temp3, INT, by="NAME")
colnames(df) <-c("Local", "computadoresPorcasa","Investimento",
                 "PIBCapita", "Pesquisa" ,"AcessoAInternet")

write.csv(df, file = "./Database/DataFrame.csv", row.names=FALSE)
print(df)
source("AEM.r")


