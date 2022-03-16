#tabela de frequencia

setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()


#carregando dados

dados <- read.table("Usuarios.csv",
                    dec = ".",
                    sep = ",",
                    h = T,
                    fileEncoding = "windows-1252"
                    )

#visualizando e sumarizando dados

View(dados)
names(dados)
str(dados)
summary(dados$salario)
summary(dados$grau_instrucao)
mean(dados$salario)
mean(dados$grau_instrucao)

#tabela frequencia absoluta
freq <- table(dados$grau_instrucao)
View(freq)

#tabela frequencia relativa
freq_rel <- prop.table(freq)
View(freq_rel)

#Porcentagem
p_freq_rel <- 100* prop.table(freq_rel)
View(p_freq_rel)

#adiciona linhas de total
View(freq)
freq <- c(freq, sum(freq))
View(freq)
names(freq)[4] <- "Total"
View(freq)



#tabela final com todos os valores


#calculo da frequencia relativa e proporcional
freq_rel <- c(freq_rel,sum(freq_rel))
p_freq_rel<- c(p_freq_rel,sum(p_freq_rel))

#tabela final com todos os vetores

tabela_final <- cbind(freq,
                      freq_rel = round(freq_rel, digits=2),
                      p_freq_rel = round(p_freq_rel, digits=2)
                      
                      )

View(tabela_final)




