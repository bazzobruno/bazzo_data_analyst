#graficos em r - barplot, pie chart, line chart, scatter plot, histograma e treemap
# http://www.r-graph-gallery.com


setwd("C:/Users/bazzowin/Desktop/POWER_BI/Cap12_linguagem_R_para_analise_estatistica")
getwd()

#dados

vetor_total_resultados = c(3,12,5,18,45)
names(vetor_total_resultados) = c("A","B","C","D","E")
vetor_total_resultados




#barplot

?barplot

barplot(vetor_total_resultados)
  barplot(vetor_total_resultados, col = c(5,8,2,4,7))

#salvando o grafico em disco

png("barplot.png", width = 480, height = 480)
barplot(vetor_total_resultados,
        col = rgb(0.1,0.5,0.6,0.7),
        xlab = "Categorias",
        ylab = "Valores",
        main = "Barplot em R",
        ylim = c(0,60)
        )
dev.off()

#ggplot2
library(ggplot2)
View(mtcars)

#Barplot

ggplot(mtcars, aes(x = as.factor(cyl) )) +
  geom_bar()



ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) +
  geom_bar()+
  scale_fill_manual(values = c("red", "green", "blue"))



#criando dados dummy (ficticios)

dados = data.frame(group = c("A", "B", "C", "D"), value = c(33, 62, 56, 67))
View(dados)

#barplot

ggplot(dados, aes(x = group, y = value, fill=group)) +
  geom_bar(width = 0.85, stat = "identity")



#####PIE CHART 


fatias <- c(4,12,14,16,8)
paises <- c("Brasil", "Estados Unidos", "Alemanha", "Reino Unido", "Espanha")
pie(fatias, labels = paises, main = "Leitura de Livros por Pessoa/Ano")


#pie chart 3D

install.packages("plotrix")
library(plotrix)

fatias <- c(4,12,14,16,8)
paises <- c("Brasil", "Estados Unidos", "Alemanha", "Reino Unido", "Espanha")
pie3D(fatias, labels = paises, explode = 0.1, main = "Leitura de Livros por Pessoa/Ano")


#Line chart

#dados

carros <- c(1,3,6,4,9)
caminhoes <- c(2,5,4,5,12)

#plot

plot(carros, type = "o", col = "blue", ylim = c(0,12))

lines(caminhoes, type = "o", pch = 22, lty = 2, col = "red")

title(main = "Produção de Veículos", col.main = "red", font.main=4)

#bloxpot  


library(ggplot2)
View(mpg)

#plot

ggplot(mpg,aes(x = reorder(class,hwy), y = hwy, fill = class))+
  geom_boxplot()+
  xlab("class")+
  theme(legend.position = "none")

#scatter plot

data = data.frame(cond = rep(c("condition_1", "condition_2"), each = 10),
                  my_x = 1:100 + rnorm(100,sd=9),my_y = 1:100 + rnorm(100,sd=16))
View(data)


ggplot(data, aes(x=my_x,y=my_y))+
  geom_point(shape=1)

#adicionar linha de regressao

  ggplot(data, aes(x=my_x,y=my_y))+
    geom_point(shape=1)+
    geom_smooth(method=lm,color = "green", se = FALSE)
  
#ADICIONA SMOOTH  >  MUDAR PARA TRUE

  ggplot(data, aes(x=my_x,y=my_y))+
    geom_point(shape=1)+
    geom_smooth(method=lm,color = "green", se = TRUE)

  
  
#####TREEMAP
  
install.packages("treemap")
library(treemap)

#dados

group = c(rep("group-1",4), rep("group-2",2), rep("group-3",3))
subgroup = paste("subgroup", c(1,2,3,4,1,2,1,2,3), sep = "-")
value = c(13,5,22,12,11,7,3,1,23)
data = data.frame(group,subgroup,value)

#labels

treemap(data, index=c("group","subgroup"),
       vSize="value", type = "index",
       fontsize.labels=c(15,12),
       fontcolor.labels=c("white", "orange"),
       fontface.labels=c(2,1),
       bg.labels=220,
       align.labels=list(
         c("center", "center"),
         c("right","bottom")),
       overlap.labels=0.5,
       inflate.labels=F
       
       )
       

#customizando o treemap

treemap( data,
         index = c("group", "subgroup"),
         vSize= "value",
         type = "index",
         border.col = c("black", "white"),
         border.lwds = c(7,2)
         )
       

#####HISTOGRAMA###

#GERANDO VALORES PARA X

x <- mtcars$mpg

#criando histograma

h <- hist(x,
          breaks=10,
          col = "grey",
          xlab = "Milhas Por Galão",
          main = "Histograma com Curva de Distribuição"
          )

#customizando histograma

xfit <- seq(min(x), max(x),length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col = "blue", lwd = 2)


##histogramas com ggplot 2

library(ggplot2)

#dataset

dados = data.frame(value = rnorm(10000))

#tamanho das colunas

ggplot(dados, aes (x=value))+
  geom_histogram(binwidth = 0.05)

#cor uniforme

ggplot(dados, aes (x=value))+
  geom_histogram(binwidth = 0.2, color= "white", fill=rgb(0.2,0.7,0.1,0.4)
  )

#cor proporcional

ggplot(dados, aes(x=value))+
  geom_histogram(binwidth = 0.2, aes(fill = ..count..))
  
       
