### Use el Script de Orlando, ya que el mio, no corrio con la recodificación. 
### Probabilidades empíricas

prop.table(AI)

## La probabilidad de los pacientes que presentan Artritis divididos en tres grupos de edad, de acuerdo a su 
## condición de mejoría con respecto a su padecimiento son las siguientes: los pacientes de 23 a 40 sin mejoría se 
## encuentra en  .59, y el sigueinte grupo de edad es de .09, también sin mejoría, mientras que para el último grupo, 
## de 57 a 74, es de .19;los pacientes de 23 a 40 con mejoría se encuentran en .11, y el sigueinte grupo de edad es de 
## .19, también sin mejoría, mientras que para el último grupo, de 57 a 74, es de .34.

### Probabilidades marginales

prop.table(margin.table(AI,1))

prop.table(margin.table(AI,2))

## Las probabilidades de pertenecer a los tres grupos de edad (23 a 40, 40 a 57 y 57 a 74), en tanto no se muestra 
## mejoría, son de .24 .38 y .38 respectivamente. Mientras que las probabilidades de pertenecer a estos mismo grupos, 
## en tanto se presenta alguna mejoría es son de .19 para los dos primeros y .69 para el tercero.

### Probabilidades condicionales

Cond.Age2<-prop.table(AI, 1)
Cond.Age2
margin.table(Cond.Age2, 1)

Cond.Mej<-prop.table(AI, 2)
Cond.Mej
margin.table(Cond.Mej, 2)

## La probabilidad de no mostrar mejoría, utilizando la edad como variable dependiente en tanto se es parte de los 
## grupos de edades 1 y 2 (23 a 40 y 40 a 57), es similar y se ubica en .66, de forma inversa las probabilidades de 
## mostrar mejoría para estos mismo grupos es de .33. por otra parte el últmo grupo (57 a 64) tiene un comportamiento 
## inverso a los dos grupos anteriores, con probabilidades de no mostrar mejoría de .35 y .64 de mostrar alguna 
## mejoría.