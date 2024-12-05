# Cargar las librerías necesarias
install.packages("randomForest")
install.packages("readxl")

library(readxl)
library(randomForest)

# Leer los datos
data <- read_excel("D:\\MYNOR\\USAC\\MAESTRIA\\4TO SEMESTRE\\Introducción a la minería de datos\\Proyecto1\\Datos Hogares INE.xlsx")

# Convertir la variable dependiente a factor si es categórica
data$P02B05 <- as.factor(data$P02B05)

# Dividir los datos en entrenamiento y prueba
index <- sample(1:nrow(data), 0.8 * nrow(data))
train <- data[index, ]
test <- data[-index, ]

# Entrenamiento del modelo de bosque aleatorio 1
# Fuente de energia para cocinar(P02B05) dependiendo de Material predominante del piso(P02A04), 
# Tipo de servicio sanitario(P02B07), Area geografica(areag),  Cuantas personas residen habitualmente(P01B04)
# Tratamiento al agua para beber(P02B04).
bosque1 <- randomForest(P02B05 ~ 
                         areag + 
                         P02A04 + 
                         P02B07 + 
                         P01B04 + 
                         P02B04,
                       data = train,
                       ntree = 100,
                       mtry = 3)

plot(bosque1)
# Predicción sobre el conjunto de test
entreno <- predict(bosque1, test)

# Predicción 1 - bosque 1
# Crear el nuevo dato para la predicción
dato_nuevo1 <- data.frame(areag = 1,  # Area Urbana
                         P02A04 = 2,  # Ladrillo de Cemento
                         P02B07 = 5,  # No tiene
                         P01B04 = 4,  # Reside 4 persona habitualmente
                         P02B04 = 2   # Hervida
)

# Realizar la predicción sobre el nuevo dato
prediccion <- predict(bosque1, dato_nuevo1)
prediccion

# Predicción 2 - bosque 1
# Crear el nuevo dato para la predicción
dato_nuevo2 <- data.frame(areag = 2,  # Area rural
                          P02A04 = 3,  # Ladrillo de Barro
                          P02B07 = 4,  # Letrina
                          P01B04 = 2,  # Residen 2 persona habitualmente
                          P02B04 = 4   # Clorada
)

# Realizar la predicción sobre el nuevo dato
prediccion <- predict(bosque1, dato_nuevo2)
prediccion


# Predicción 3 - bosque 1
# Crear el nuevo dato para la predicción
dato_nuevo3 <- data.frame(areag = 2,  # Area Urbana
                          P02A04 = 8,  # Tierra
                          P02B07 = 1,  # Inodoro red drenaje
                          P01B04 = 1,  # Reside 1 persona habitualmente
                          P02B04 = 1   # Ninguno
)

# Realizar la predicción sobre el nuevo dato
prediccion <- predict(bosque1, dato_nuevo3)
prediccion



# Entrenamiento del modelo de bosque aleatorio 2

# Convertir la variable dependiente a factor si es categórica
data$P02B04 <- as.factor(data$P02B04)

# Dividir los datos en entrenamiento y prueba
index <- sample(1:nrow(data), 0.8 * nrow(data))
train <- data[index, ]
test <- data[-index, ]


# Tratamiento al agua para beber(P02B04) dependiendo de Material predominante del piso(P02A04), 
# Tipo de servicio sanitario(P02B07),  Cuantas personas residen habitualmente(P01B04)
# Fuente de energia para cocinar(P02B05).
bosque2 <- randomForest(P02B04 ~ 
                          P02A04 + 
                          P02B07 + 
                          P01B04 + 
                          P02B05,
                        data = train,
                        ntree = 100,
                        mtry = 4)

plot(bosque2)
# Predicción sobre el conjunto de test
entreno <- predict(bosque2, test)

# Predicción 1 - bosque 2
# Crear el nuevo dato para la predicción
dato_nuevo1 <- data.frame(P02A04 = 2,  # Ladrillo de Cemento
                          P02B07 = 5,  # No tiene
                          P01B04 = 4,  # Reside 4 persona habitualmente
                          P02B05 = 2   # Propano
)

# Realizar la predicción sobre el nuevo dato
prediccion <- predict(bosque2, dato_nuevo1)
prediccion

# Predicción 2 - bosque 2
# Crear el nuevo dato para la predicción
dato_nuevo2 <- data.frame(P02A04 = 3,  # Ladrillo de Barro
                          P02B07 = 4,  # Letrina
                          P01B04 = 2,  # Residen 2 persona habitualmente
                          P02B05 = 4   # Leña
)

# Realizar la predicción sobre el nuevo dato
prediccion <- predict(bosque2, dato_nuevo2)
prediccion


# Predicción 3 - bosque 2
# Crear el nuevo dato para la predicción
dato_nuevo3 <- data.frame(P02A04 = 8,  # Tierra
                          P02B07 = 1,  # Inodoro red drenaje
                          P01B04 = 1,  # Reside 1 persona habitualmente
                          P02B05 = 1   # Electricidad
)

# Realizar la predicción sobre el nuevo dato
prediccion <- predict(bosque2, dato_nuevo3)
prediccion
