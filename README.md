## Universidad de San Carlos de Guatemala
## Escuela de estudios de postgrado
## Maestría en ingeniería para la industria con especialización en ciencias de la computación
## Introducción al análisis de datos
## No carne: 999014035
## Proyecto 1
------

### Temática: Encuesta nacional de empelo - énfasis hogares
# Documentación Técnica

## 1. Bibliotecas Utilizadas

- **readxl**: Permite cargar datos desde archivos Excel (.xlsx), una función esencial para importar datos sin necesidad de convertirlos a otros formatos intermedios.
- **arules**: Proporciona herramientas para el análisis de asociaciones, particularmente útiles para implementar el algoritmo Apriori. Facilita la creación y visualización de reglas de asociación, ayudando a identificar patrones en conjuntos de datos transaccionales.
- **ggplot2**: Utilizada para generar gráficos en 2D, esta biblioteca facilita la visualización de los resultados de clustering, lo cual es esencial para interpretar los grupos de datos y su distribución.
- **plotly**: Permite la creación de gráficos interactivos en 3D, una herramienta clave para visualizar el análisis de clustering en un espacio tridimensional y ofrecer una representación más detallada de las relaciones entre las variables.

## 2. Preparación y Preprocesamiento de Datos

Para asegurar que los datos sean adecuados para el análisis, se realizó un preprocesamiento que incluyó la carga y selección de columnas específicas relacionadas con el material del piso, cantidad de cuartos, y la fuente de energía utilizada en el hogar. Este paso fue crucial para enfocar el análisis en variables que afectan directamente el acceso a servicios básicos y la calidad de vida en los hogares guatemaltecos.

Además, los datos fueron escalados en el análisis de clustering para evitar que diferencias en la escala de las variables afecten los resultados de segmentación. Esto permite que las distancias en el espacio de clustering sean más representativas de las diferencias reales entre los datos.

## 3. Metodología

### Análisis de Reglas de Asociación con Apriori
Se empleó el algoritmo Apriori para identificar relaciones frecuentes entre diferentes características del hogar. Este análisis ayuda a descubrir patrones de comportamiento, como la correlación entre el tipo de material del piso y el tipo de energía utilizado para cocinar. Los resultados proporcionan información sobre las condiciones de vida y las preferencias en el uso de recursos en hogares específicos.

### Clustering con K-Means
El algoritmo de clustering K-Means fue utilizado para segmentar los hogares en grupos con características similares. El número óptimo de clústeres fue determinado utilizando el método del codo, lo cual implica evaluar la suma de cuadrados dentro de los clústeres a medida que se incrementa el número de clústeres. Esta técnica permite identificar un valor de K que minimiza la variabilidad dentro de cada clúster y maximiza la distancia entre los clústeres.

La visualización de los clústeres se realizó tanto en 2D como en 3D para facilitar la interpretación de los grupos formados. En el gráfico tridimensional, se analizaron variables como el material del piso, el número de cuartos y la fuente de energía para cocinar, lo que ofrece una perspectiva completa de la segmentación y las relaciones entre estas características.

## 4. Instrucciones de Ejecución

1. **Preparación del Entorno**: Asegurarse de tener R y RStudio instalados.
2. **Instalación de Bibliotecas**: Instalar las bibliotecas requeridas (`readxl`, `arules`, `ggplot2`, `plotly`) usando la función `install.packages()` en R.
3. **Carga de Datos**: Colocar el archivo `Datos Hogares INE.xlsx` en la ruta especificada en el código. Esta ubicación debe coincidir con la estructura de carpetas del proyecto en RStudio.
4. **Ejecución Secuencial**: Ejecutar el código en el orden indicado, primero el preprocesamiento, luego el análisis de reglas de asociación y finalmente el clustering. Asegurarse de escalar los datos antes de aplicar K-Means para obtener resultados precisos.
5. **Visualización de Resultados**: Los gráficos generados en RStudio mostrarán tanto la distribución bidimensional como tridimensional de los clústeres. Para la gráfica 3D, se utilizará `plotly` que permite una visualización interactiva de los datos.

## 5. Recomendaciones de Replicación

Para replicar los resultados, es importante:

- Mantener los parámetros de soporte y confianza en el algoritmo Apriori, ya que estos afectan la frecuencia y relevancia de las reglas encontradas.
- Utilizar el mismo valor de semilla en K-Means para asegurar que los resultados de clustering sean reproducibles.
- Revisar la integridad del archivo `Datos Hogares INE.xlsx`, asegurándose de que no haya alteraciones en el formato original.

