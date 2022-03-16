setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()


vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

##carregar ggplot2

library(ggplot2)

#cria grafico

?qplot
qplot(Valor, Custo, data = vendas )