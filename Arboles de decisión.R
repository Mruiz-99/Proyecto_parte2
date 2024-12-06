install.packages("rpart")
install.packages("rpart.plot")
install.packages("readxl")

library(readxl)

library(rpart)
library(rpart.plot)

data <- read_excel("D:\\MYNOR\\USAC\\MAESTRIA\\4TO SEMESTRE\\Introducción a la minería de datos\\Proyecto1\\Datos Hogares INE.xlsx")
hogares <- data

# Arbol 1
# Fuente de energia para cocinar(P02B05) dependiendo de Material predominante del piso(P02A04), 
# Tipo de servicio sanitario(P02B07), Area geografica(areag),  Cuantas personas residen habitualmente(P01B04).
arbol1 <- rpart(P02B05 ~
                 areag+
                 P02A04+
                 P02B07+
                 P01B04,
               data = hogares, method = "class")


rpart.plot(arbol1, type=2,extra=100,under=TRUE, fallen.leaves = TRUE, box.palette = "BuGn",
           main = "Prediccion de fuente de energia para cocinar",cex = 0.7)
# Predicción 1 - Arbol 1
hogar1 <- data.frame(
  areag=c(1),# Area urbana
  P02A04=c(2),# Ladrillo de Cemento
  P02B07=c(5),# No tiene
  P01B04=c(1)# Reside 1 persona habitualmente
)

result <- predict(arbol1,hogar1, type="class")
result

# Predicción 2 - Arbol 1
hogar2 <- data.frame(
  areag=c(1),# Area urbana
  P02A04=c(7),# Madera
  P02B07=c(2),# Inodoro fosa séptica
  P01B04=c(3)# Reside 3 persona habitualmente
)

result <- predict(arbol1,hogar2, type="class")
result

# Predicción 3 - Arbol 1
hogar3 <- data.frame(
  areag=c(3),# Area rural
  P02A04=c(2),# Ladrillo de Cemento
  P02B07=c(1),# Inodoro red drenaje
  P01B04=c(3)# Reside 3 persona habitualmente
)

result <- predict(arbol1,hogar3, type="class")
result


# Arbol 2
# Tipo de servicio sanitario(P02B07), dependiendo de  Tratamiento al agua para beber(P02B04), 
# Fuente de energia para cocinar(P02B05), Area geografica(areag).
arbol2 <- rpart(P02B07 ~
                  areag+
                  P02B04+
                  P02B05,
                data = hogares, method = "class")


rpart.plot(arbol2, type=2,extra=100,under=TRUE, fallen.leaves = TRUE, box.palette = "BuGn",
           main = "Prediccion de tipo de servicio sanitario",cex = 0.7)
# Predicción 1 - Arbol 2
hogar1 <- data.frame(
  areag=c(1),# Area urbana
  P02B04=c(2),# Hervida
  P02B05=c(5)# Carbón
)

result <- predict(arbol2,hogar1, type="class")
result
# Predicción 2 - Arbol 2
hogar2 <- data.frame(
  areag=c(2),# Area rural
  P02B04=c(4),# Clorada
  P02B05=c(3)# Kerocene
)

result <- predict(arbol2,hogar2, type="class")
result
# Predicción 3 - Arbol 2
hogar3 <- data.frame(
  areag=c(2),# Area rural
  P02B04=c(3),# Filtrada
  P02B05=c(4)# Leña
)

result <- predict(arbol2,hogar3, type="class")
result

# Arbol 3
# Material predominante del techo(P02A03), dependiendo de  Tipo de servicio sanitario(P02B07), 
# Total de cuartos en la vivienda(P02A06),   Tratamiento al agua para beber(P02B04), 
# Forma para eliminar la basura(P02B09).
arbol3 <- rpart(P02A03 ~
                  P02B07+
                  P02A06+
                  P02B04+
                  P02B09,
                data = hogares, method = "class")


rpart.plot(arbol3, type=2,extra=100,under=TRUE, fallen.leaves = TRUE, box.palette = "BuGn",
           main = "Prediccion de material que predomina en el techo",cex = 0.7)
# Predicción 1 - Arbol 3
hogar1 <- data.frame(
  P02B07=c(3),# Excusado
  P02A06=c(2),# Cantidad de cuartos 2
  P02B04=c(2),# Hervida
  P02B09=c(1)# Servicio municipal
)

result <- predict(arbol3,hogar1, type="class")
result
# Predicción 2 - Arbol 3
hogar1 <- data.frame(
  P02B07=c(1),# Inodoro red drenaje
  P02A06=c(1),# Cantidad de cuartos 1
  P02B04=c(5),# Compran purificada
  P02B09=c(4)# Se entierra
)

result <- predict(arbol3,hogar1, type="class")
result
# Predicción 3 - Arbol 3
hogar1 <- data.frame(
  P02B07=c(4),# Letrina
  P02A06=c(3),# Cantidad de cuartos 3
  P02B04=c(4),# Clorada
  P02B09=c(3)# Se quema
)

result <- predict(arbol3,hogar1, type="class")
result



# Arbol 4
#  Material predominante del piso(P02A04), dependiendo de:
# Total de cuartos en la vivienda(P02A06),   Tratamiento al agua para beber(P02B04), 
#  Material predominante del techo(P02A03).
arbol4 <- rpart(P02A04 ~
                  P02A06+
                  P02B04+
                  P02A03,
                data = hogares, method = "class")


rpart.plot(arbol4, type=2,extra=100,under=TRUE, fallen.leaves = TRUE, box.palette = "BuGn",
           main = "Prediccion de material que predomina en el piso",cex = 0.7)

# Me quede por el arbol 4 - PREDICCIONES
# Predicción 1 - Arbol 4
hogar1 <- data.frame(
  P02A06=c(4),# Cantidad de cuartos 4
  P02B04=c(1),# Ninguno
  P02A03=c(2)# Lámina
)
result <- predict(arbol4,hogar1, type="class")
result
# Predicción 2 - Arbol 4
hogar1 <- data.frame(
  P02A06=c(3),# Cantidad de cuartos 3
  P02B04=c(3),# Filtrada
  P02A03=c(4)# Teja
)
result <- predict(arbol4,hogar1, type="class")
result
# Predicción 3 - Arbol 4
hogar1 <- data.frame(
  P02A06=c(1),# Cantidad de cuartos 1
  P02B04=c(5),# Compran purificada
  P02A03=c(1)# Concreto
)
result <- predict(arbol4,hogar1, type="class")
result

