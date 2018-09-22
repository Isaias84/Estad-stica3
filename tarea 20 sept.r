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

### Tablas con dos variables, tratamiento y mejoría ##

MT1<-table(Sex,Improved)

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

Arthritis$age2<-recode(Arthritis$age, "23:39=1; 40:56=2; 57:74=3") ## !!!???? ##

Age_disc <- discretize(Age, method = "interval", length = 17)
table(Age_disc)
table (Improved, Age_disc)
