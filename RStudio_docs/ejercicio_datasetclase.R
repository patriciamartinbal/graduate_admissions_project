## 21747742 ####
## PATRICIA MARTIN BALLESTEROS #####
# Enunciado:
# Queremos leer un archivo el cual los generaremos en tiempo real, 
# procesaremos el archivo y obtendremos información útil.

#Carga del dataset ####
#dataset <- read.csv("/Users/patrimballesteros/Documents/lpe/graduate_admissions_project/RStudio_docs/datasetclase-2.csv",header = T, sep = ',')
#read_csv es de tidyverse: no se necesita separador, te da los nulos, etc
dataset <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQ73jHbE3MH2hl0ijDi8JlaZ44KQpecp_WuLXpMgedz206as8DKiKm0p0Kri0rbnU5w2YegfkmeF77D/pub?gid=1339989981&single=true&output=csv")
head(dataset)

#Renombrar columnas ####
names (dataset) = c("Fecha_hora", "Email", "Descripcion_mia", "Presencial_Hyflex", "Nombre", "Mes_Nacimiento", "Anio_Nacimiento",
                    "Apellido", "Descripcion_Compañero", "Repetidor", "N_expediente", "Usuario_GitHub", "Nivel_Programacion(1=bajo,10=experto)",
                    "Presentado_exposicion", "DigitalBlock")
attach(dataset)  

# 1- Alumno más viejo ####
min(Anio_Nacimiento)
a <- which.min(Anio_Nacimiento)
alumnoviejo <- dataset[a,"Nombre"] 
alumnoviejo

#otro metodo con tidyverse y pipe (%>%)
#  dataset %>% filter(Anio_Nacimiento == min(Anio_Nacimiento))
#  dataset %>% filter(Mes_Nacimiento == month(today()))
#  dataset %>% filter(Expediente%%2 == 0)
#  dataset %>% filter(Expediente%%2 != 0)
# percent_rank -> te da los acumulados
#  expoy <- dataset %>% filter(resentado_exposicion == 0)
#  expon <- dataset %>% filter(resentado_exposicion == 1)
#  porcentaje <- (count(expoy))*(count(dataset))/100


# 2- Cuantos alumnos cumplen años este mes? ####
mes <- as.numeric(format(Sys.Date(),'%m'))
mes
mes_cumple <- sum(dataset$Mes_Nacimiento ==mes)
mes_cumple

# 3- Listado alumnos con expediente par/impar ####
exp_par <- subset(dataset, N_expediente%%2 == 0, "Nombre")
exp_impar <- subset(dataset, N_expediente%%2 != 0, "Nombre")

exp_par
exp_impar

# 4- Cual es la palabra más usada? Qué significa? ####
## INSTALL PACK 
pacman::p_load(tm, SnowballC, tidyverse, wordcloud) #pacman permite meter los paquetes e instalarlos para que no pete
library(lubridate, warn.conflicts = FALSE) #LUBRIDATE es para las fechas 
vos_mismos <- readLines('Evercise Files/Ch9/09_03/vos_mismos.txt')
de_otros <- readLines('Evercise Files/Ch9/09_03/de_otros.txt')
?tidyverse

## Corpus 
corpus_vos_mismos <- Corpus(VectorSource(vos_mismos)) %>%
  #corpus: el texto limpio ya lematizado, estilizado, quitado el stopword list... 
    
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

