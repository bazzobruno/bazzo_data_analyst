#estatistica basica

#Parte 1 - Medidas de posicao

#definindo a pasta de trabalho

#substitua o caminho abaixo pela pasta no seu computador


setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()

#carregando o dataset

vendas <- read.csv("Vendas.csv", fileEncoding = "Windows-1252")

#resumo do dataset

View(vendas)
str(vendas$Valor)
summary(vendas$Valor)
summary(vendas$Custo)

#MEDIA

?mean
mean(vendas$Valor)
mean(vendas$Custo)

#MEDIA PONDERADA

?weighted.mean
wighted.mean(vendas$Valor, w = vendas$Custo)

#MEDIANA

median(vendas$Valor)
median(vendas$Custo)


#MODA
#CRIANDO FUNÇAO

moda <- function(v){
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v,valor_unico)))]
}

#obtendo a moda
resultado <- moda(vendas$Valor)
print(resultado)

resultado_custo <- moda(vendas$Custo)
print(resultado_custo)


#criando um grafico de media de valor por estado com ggplot

install.packages("ggplot2")
library(ggplot2)

#criando o grafico

ggplot(vendas) +
  stat_summary(aes(x = Estado,
                   y = Valor),
               fun = mean,
               geom = "bar",
               fill = "lightpink",
               col =  "grey50") + 
  labs(title = "Média  de valor por Estado")
  




