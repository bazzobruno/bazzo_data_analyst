# Estatistica basica Parte 3

# Linguagem R é CASE SENSITIVE, ou seja, diferencia maiusculas 
# de minusculas



setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()

#carregando o dataset

vendas <- read.csv("Vendas.csv", fileEncoding = "Windows-1252")

#resumo de dados

head(vendas)
tail(vendas)
View(vendas)


#medidas de tendencia central

summary(vendas$Valor)

#varredura na tabela de vendas
# 'c' significa que é uma funcao,no caso, uma funcao de vetores de string 

summary(vendas[c('Valor','Custo')])

#explorando variaveis numericas

#media
mean(vendas$Valor)

#mediana
median(vendas$Valor)

#quartis
quantile(vendas$Valor)

#percentil de 100 posicoes
quantile(vendas$Valor, probs = c(0.01,0.99))

#percentil com range
quantile(vendas$Valor, seq(from = 0, to = 1, by = 0.20))


#diferenca entre os quartis 3 e 1 || intervalo interquartil
IQR(vendas$Valor)

#intervalo
range(vendas$Valor)
summary(vendas$Valor)

#diferenca
diff(range(vendas$Valor))