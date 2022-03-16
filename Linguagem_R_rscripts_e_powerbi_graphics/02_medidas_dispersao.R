setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()

#carregando o dataset

vendas <- read.csv("Vendas.csv", fileEncoding = "Windows-1252")

#resumo do dataset

View(vendas)
str(vendas$Valor)
summary(vendas$Valor)
summary(vendas$Custo)

#variancia

var(vendas$Valor)

#desvio padrao

sd(vendas$Valor)