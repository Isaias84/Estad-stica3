## Librerias a utilizar en el trabajo ##

library(epiDisplay)
library(vcd)
library(epitools)
library(catdata)
library(Deducer)
library(vcdExtra)
library(MASS)
library(effects)
library(visreg)
library(lme4)
library(aod)
library(car)
library(rms)
library(ROCR)
library(boot)
library(ggplot2)
library(grDevices)
library(mvc)
library(ca)
library(FactoMineR)
library(arules)

## Exprolar las cabeceras de la base ##

head(Arthritis)

## Anclar base de datos ##

attach(Arthritis)

## Crear tablas a partir vde la base de datos##

Q1<-table(factor(Treatment))

Q2<-table(factor(Improved))

Q3<-table(factor(Sex))

Q4<-table(factor(Age))

### Tablas con dos variables, tratamiento y mejoría ##

MT<-table(Treatment,Improved)

MT

prop.table(MT)

### Tablas con dos variables, tratamiento y mejoría ##

MT1<-table(Sex,Improved)

MT1

prop.table(MT1)

## Chi cuadrada Asociación tratamiento y mejoría ##

NQ<-chisq.test(MT)

NQ

NQ$expected

NQ$residuals

NQ$stdres

## Chi cuadrada Asociación sexo y mejoría ##

NQ1<-chisq.test(MT1)

NQ1

NQ1$expected

NQ1$residuals

NQ1$stdres

## Gráficos Chi cuadrada - Tratamiento - mejoría ##

MosCHI<-mosaic(MT,color=TRUE,shade=T,main="mosaico")

Mosaso<-assoc(MT,color=TRUE,shade=T,main="mosaico")

plot(MosCHI)

plot(Mosaso)

## Gráficos Chi cuadrada - Tratamiento - mejoría ##

MosCHI1<-mosaic(MT1,color=TRUE,shade=T,main="mosaico")

Mosaso1<-assoc(MT1,color=TRUE,shade=T,main="mosaico")

plot(MosCHI1)

plot(Mosaso1)

## Discretizar edades de pacientes ##

## Arthritis$age2<-recode(Arthritis$age, "23:39=1; 40:56=2; 57:74=3") ## !!!???? ##

Age2<- discretize(Age, method = "interval", length = 17)
table(Age2)
table(Improved, Age2)
prop.table(table (Improved, Age2))

##Recodificamos Improved para facilitar el manejo de la variable y para poder aplicar prueba de Chi

Improved2<-recode(Improved, "'None'=0; 'Some'=1; 'Marked'=1;")


## Tabla edad2 y mejoría ##

MT3<-table(Improved2,Age2)

MT3

prop.table(MT3)

## Tabla 2 edad2 y mejoría ##

MT3A<-table(Age2, Improved2)

MT3A

prop.table(MT3A)

## Prueba de Fisher

IA2<- fisher.test(MT3)

IA

IA2$expected

IA2$residuals

IA2$stdres

## prueba de Fisher 2

A2<- fisher.test(MT3A)

IA2

IA2$expected

IA2$residuals

IA2$stdres

### Distribución conjunta mejoría y edad2

prop.table(MT3)

## La probabilidad de los pacientes que presentan Artritis divididos en tres grupos de edad, de acuerdo a su 
## condición de mejoría con respecto a su padecimiento son las siguientes: los pacientes de 23 a 40 sin mejoría se 
## encuentra en  .59, y el sigueinte grupo de edad es de .09, también sin mejoría, mientras que para el último grupo, 
## de 57 a 74, es de .19;los pacientes de 23 a 40 con mejoría se encuentran en .11, y el sigueinte grupo de edad es de 
## .19, también sin mejoría, mientras que para el último grupo, de 57 a 74, es de .34.


### Marginales mejoría y edad2

prop.table(margin.table(MT3,1))

prop.table(margin.table(MT3,2))

## Las probabilidades de pertenecer a los tres grupos de edad (23 a 40, 40 a 57 y 57 a 74), en tanto no se muestra 
## mejoría, son de .24 .38 y .38 respectivamente. Mientras que las probabilidades de pertenecer a estos mismo grupos, 
## en tanto se presenta alguna mejoría es son de .19 para los dos primeros y .69 para el tercero.


### Distribuciones condicionales mejoría y edad2

Cond.Age2<-prop.table(MT3, 1)
Cond.Age2
margin.table(Cond.Age2, 1)

Cond.Mej<-prop.table(MT3, 2)
Cond.Mej
margin.table(Cond.Mej, 2)

## La probabilidad de no mostrar mejoría, utilizando la edad como variable dependiente en tanto se es parte de los 
## grupos de edades 1 y 2 (23 a 40 y 40 a 57), es similar y se ubica en .66, de forma inversa las probabilidades de 
## mostrar mejoría para estos mismo grupos es de .33. por otra parte el últmo grupo (57 a 64) tiene un comportamiento 
## inverso a los dos grupos anteriores, con probabilidades de no mostrar mejoría de .35 y .64 de mostrar alguna 
## mejoría.