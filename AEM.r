library("MASS")
dados = read.csv("./Database/DataFrame.csv", na.strings=c("NaN"))
dados_processedos = dados[0:66,c("computadoresPorcasa","Investimento",
                                 "PIBCapita", "Pesquisa" ,"AcessoAInternet")]
distancia <- dist(dados_processedos)
data_Mds <- isoMDS(distancia)
x <- data_Mds$points[,1]
y <- data_Mds$points[,2]
plot(x, y, xlab="Coordenada 1", ylab="Coordenada 2", 
     xlim=range(data_Mds$points[,1] * 1.2), type="n")
text(x, y, labes=colnames(distancia), cex=0.6)
data_sh <- Shepard(distancia[lower.tri(distancia)], data_Mds$points)
