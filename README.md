# Universidad de San Carlos de Guatemala
## Escuela de Estudios de Postgrado
### Maestría en ingeniería para la industria con especialización en ciencias de la computación
#### Introducción al análisis de datos
#### No carne: 999014035
#### Proyecto 2

---

## Temática: Encuesta nacional de empleo - Énfasis hogares

---

# Documentación Técnica

## 1. Bibliotecas Utilizadas

- **rpart**: Implementa árboles de decisión, permitiendo generar modelos de clasificación con alta interpretabilidad.
- **randomForest**: Ofrece herramientas para construir bosques aleatorios, mejorando la robustez y precisión de las predicciones.
- **tensorflow**: Utilizado para implementar y entrenar redes neuronales en Python, ofreciendo flexibilidad y rendimiento.
- **numpy y pandas**: Proveen manejo eficiente de datos y estructuras para su análisis.
- **scikit-learn**: Facilita el preprocesamiento de datos, la evaluación de modelos y el cálculo de métricas de desempeño.

---

## 2. Preparación y Preprocesamiento de Datos

Para garantizar la calidad del análisis, se realizaron las siguientes etapas de preprocesamiento:

- **Selección de variables relevantes**: Se seleccionaron las características clave relacionadas con:
  - Material predominante del piso (P02A04)
  - Tipo de servicio sanitario (P02B07)
  - Fuente de energía para cocinar (P02B05)
  - Área geográfica (areag)
  - Tratamiento del agua para beber (P02B04)
- **Imputación de datos faltantes**: Los valores faltantes fueron imputados utilizando la moda de cada columna para mantener la consistencia del conjunto de datos.
- **Transformación de variables**: Se codificaron las variables categóricas en factores y las numéricas fueron escaladas cuando se utilizaron métodos basados en distancias.
- **División de datos**: El conjunto fue dividido en datos de entrenamiento (80%) y prueba (20%) para evaluar la capacidad predictiva de los modelos.

---

## 3. Metodología

### Árboles de Decisión
El análisis utilizó el algoritmo de árboles de decisión (`rpart`) para generar modelos de clasificación. Esto permitió:
- Identificar reglas claras basadas en las características de los hogares.
- Visualizar las relaciones jerárquicas entre variables.

### Bosques Aleatorios
Los bosques aleatorios (`randomForest`) combinaron múltiples árboles para mejorar la precisión y reducir el sesgo y la varianza. Se ajustaron los siguientes hiperparámetros:
- Número de árboles: 100.
- Profundidad máxima: Automática, basada en el criterio de Gini.

### Redes Neuronales
Se implementaron redes neuronales con `tensorflow` para modelar relaciones complejas y no lineales entre las variables. La arquitectura incluyó:
- Modelo 1: Entrada de 3 variables, 2 capas ocultas y 5 neuronas de salida.
- Modelo 2: Entrada de 4 variables, 2 capas ocultas y 6 neuronas de salida.

---

## 4. Instrucciones de Ejecución

1. **Preparación del Entorno**:
   - Instalar las bibliotecas requeridas (`rpart`, `randomForest`, `tensorflow`, `numpy`, `pandas`, `scikit-learn`).
2. **Carga de Datos**:
   - Colocar el archivo `Datos Hogares INE.xlsx` en la ruta especificada.
3. **Ejecución**:
   - Para árboles de decisión: Ejecutar el script `Arboles de decisión.R`.
   - Para bosques aleatorios: Ejecutar el script `Bosques aleatorios.R`.
   - Para redes neuronales: Ejecutar el script `redes_neuronales.py`.
4. **Interpretación de Resultados**:
   - Los gráficos y métricas de desempeño serán generados automáticamente por cada script.

---

## 5. Recomendaciones de Replicación

1. **Parámetros Consistentes**:
   - Mantener la misma semilla de aleatoriedad en cada ejecución para garantizar resultados reproducibles.
2. **Evaluación de Modelos**:
   - Validar los modelos utilizando técnicas como la validación cruzada para garantizar su capacidad de generalización.
3. **Documentación del Proceso**:
   - Registrar las configuraciones, métricas y gráficos generados para facilitar el análisis posterior.