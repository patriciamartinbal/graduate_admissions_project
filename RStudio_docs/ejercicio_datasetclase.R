## 21747742 PATRICIA MARTIN BALLESTEROS #####
# Enunciado:
# Queremos leer un archivo el cual los generaremos en tiempo real, 
# procesaremos el archivo y obtendremos información útil.

#Carga del dataset ####
dataset <- read.csv(file.choose(),header = T, sep = ',')
head(dataset)

#Renombrar columnas ####
names (dataset) = c("Fecha_hora", "Email", "Descripcion_mia", "Presencial_Hyflex", "Nombre", "Mes_Nacimiento", "Anio_Nacimiento",
                    "Apellido", "Descripcion_Compañero", "Repetidor", "N_expediente", "Usuario_GitHub", "Nivel_Programacion(1=bajo,10=experto)",
                    "Presentado_exposicion", "DigitalBlock")

# 1- Alumno más viejo ####
attach(dataset)
min(Anio_Nacimiento)
a <- which.min(Anio_Nacimiento)
alumnoviejo <- dataset[a,5] #columna 5 da el nombre 
alumnoviejo

# 2- Cuantos alumnos cumplen años este mes? ####
mes_cumple <- sum(dataset$Mes_Nacimiento =="11")
mes_cumple

# 3- Listado alumnos con expediente par/impar ####
exp_par <- subset(dataset, N_expediente%%2 == 0, "Nombre")
exp_impar <- subset(dataset, N_expediente%%2 != 0, "Nombre")

exp_par
exp_impar

# 4- Cual es la palabra más usada? Qué significa? ####
## INSTALL PACK 
pacman::p_load(pacman, tm, SnowballC, tidyverse)
vos_mismos <- readLines('Evercise Files/Ch9/09_03/vos_mismos.txt')
de_otros <- readLines('Evercise Files/Ch9/09_03/de_otros.txt')
?tidyverse
## Corpus 
corpus_vos_mismos <- Corpus(VectorSource(vos_mismos)) %>%
  tm_map(removePuntuaction) %>%
  tm_map(removeNumbers) %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("es")) %>%
  tm_map(stripWhitespace) %>%
  tm_map(stemDocument) %>%
## Term-document matrices y remove separ 
tdm_vos_mismos <- DocumentTermMatrix()
## Calc y sort por frec. (Palabra)
## Tabla de Frec. 
## WORDS DISTINCTIVE 



# 5- Porcentaje de alumnos que ya han hecho la expo ####
Exposicion_si <- subset(dataset, Presentado_exposicion == 0, "Nombre")
Exposicion_si
a<- sum(dataset$Presentado_exposicion == 0)
a
b <- dataset[,14]
length(b)
porcent <- (a/length(b))*100
porcent

# 6- Nº y listado de asistentes tanto Hyflex como presencial. ####
alumnos_presencial <- subset(dataset, Presencial_Hyflex == 0, "Nombre")
alumnos_presencial

total_presencial <- sum(dataset$Presencial_Hyflex == 0)
total_presencial

alumnos_hyflex <- subset(dataset, Presencial_Hyflex == 1, "Nombre")
alumnos_hyflex

total_hyflex <- sum(dataset$Presencial_Hyflex == 1)
total_hyflex

