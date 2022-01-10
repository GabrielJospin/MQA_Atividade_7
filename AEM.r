library("MASS")
dados = read.csv("./Database/DataFrame.csv", na.strings=c("NaN"))
dados_processedos = dados[0:66,c("computadoresPorcasa","Investimento", "Pesquisa" ,"AcessoAInternet")]

Q1 <- quantile(dados$AcessoAInternet, probs = 1/3)
Q2 <- quantile(dados$AcessoAInternet, probs = 2/3)

dados$Type1[dados$AcessoAInternet > Q2] <-  2
dados$Type1[dados$AcessoAInternet < Q1] <-  1
dados$Type1[is.na(dados$Type1)] <-  3

Q1 <- quantile(dados$Pesquisa, probs = 1/3)
Q2 <- quantile(dados$Pesquisa, probs = 2/3)

dados$Type2[dados$Pesquisa > Q2] <-  2
dados$Type2[dados$Pesquisa < Q1] <-  1
dados$Type2[is.na(dados$Type2)] <-  3

distancia <- dist(dados_processedos)
data_Mds <- isoMDS(distancia)
x <- data_Mds$points[,1]
y <- data_Mds$points[,2]

colors <-c("brown2", "darkgoldenrod1", "darkolivegreen")

plot(x, y, xlab="Coordenada 1", ylab="Coordenada 2", 
     xlim=range(data_Mds$points[,1] * 1.2), type="n")
text(x, y, labes=colnames(distancia), cex=0.6)


plot(x, y, xlab="Coordenada 1", ylab="Coordenada 2", 
     xlim=range(data_Mds$points[,1] * 1.2), type="n")
text(x, y, labes=colnames(distancia), cex=0.6, 
     col=colors[dados$Type1])

plot(x, y, xlab="Coordenada 1", ylab="Coordenada 2", 
     xlim=range(data_Mds$points[,1] * 1.2), type="n")
text(x, y, labes=colnames(distancia), cex=0.6, 
     col=colors[dados$Type2])

data_sh <- Shepard(distancia[lower.tri(distancia)], data_Mds$points)

