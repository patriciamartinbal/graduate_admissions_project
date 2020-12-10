# OKUPACION 10 DICIEMBRE --------------------------------------------------
# Lenguajes de programacion estadistica 
# 21747742 PATRICIA MARTIN
# coord sitio favorito
coord <- c(40.948136617597825, -4.117766855378762)


# load pack ---------------------------------------------------------------
pacman::p_load(tidyverse,leaflet,leaflet.extras) 

# load data ---------------------------------------------------------------

leaflet() %>% 
  addTiles()

# print names of the map titles available
names(providers)

leaflet() %>% 
  addProviderTiles("Wikimedia") %>% 
  setView(lat=40.948136617597825, lng = -4.117766855378762, zoom = 10)

 
ds <- read_csv("chipotle.csv")
lock <- ds %>% 
  filter(closed==T) %>%
  leaflet()%>% 
  addTiles() %>% 
  addCircles() 
lock

