setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()



notas <- read.csv("Notas.csv", fileEncoding = "Windows-1252")


View(notas)
str(notas)
summary(notas)



#qual turma apresentou maior variabilidade de notas?
sd(notas$TurmaA)

sd(notas$TurmaB)

#resposta: turma 'A' tem maior variabilidade



#calcule o coeficiente de variacao das 2 turmas

media_ta <- mean(notas$TurmaA)
media_tb <- mean(notas$TurmaB)

sd_ta <- sd(notas$TurmaA)
sd_tb <- sd(notas$TurmaB)

cvA <- sd_ta / media_ta * 100
cvB <- sd_tb / media_tb * 100

#coeficiente de variacao A
cvA

#coeficiente de variacao B
cvB





#qual nota apareceu mais vezes em cada turma?
#CRIANDO FUNÇAO

moda <- function(v){
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v,valor_unico)))]
}

#obtendo a moda
Turma_A <- moda(notas$TurmaA)
print(Turma_A)

Turma_B <- moda(notas$TurmaB)
print(Turma_B)


