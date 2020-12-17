# DONDE INVERTIR 17 DIC CASO USO ------------------------------------------
## 21747742 Patricia Martin
## LPE - UEM 2020-2021
# load lib ----------------------------------------------------------------
pacman::p_load(tidyverse, leaflet, leaflet.extras)

# File-> importdataset -> From Excel...
ds <- read_excel("https://geoportalgasolineras.es/resources/files/preciosEESS_es.xls")

pinte <-
  ds %>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircles()
pinte

en_mad <-
  ds %>% 
  filter(Municipio=="MADRID") %>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers()
en_mad

en_CAM <-
  ds %>% 
  filter(Provincia=="MADRID") %>% 
  leaflet() %>% 
  addTiles() %>% 
  addCircles()
en_CAM



