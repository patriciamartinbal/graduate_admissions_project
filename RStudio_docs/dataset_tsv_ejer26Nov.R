# LOAD PACKAGES AND DATA TSV ----------------------------------------------
pacman:::p_load(tm, SnowballC, tidyverse, wordcloud,lubridate)
TSV <- read_tsv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQ73jHbE3MH2hl0ijDi8JlaZ44KQpecp_WuLXpMgedz206as8DKiKm0p0Kri0rbnU5w2YegfkmeF77D/pub?gid=1339989981&single=true&output=tsv")

# ANSWERS -----------------------------------------------------------------
TSV %>% filter(TSV[7]==min(TSV[7]))
TSV %>% filter(TSV[6]==month(today()))
TSV %>% filter(TSV[11]%%2 == 0)

TSV %>% filter(TSV[11]%%2 != 0)
(TSV %>% filter(TSV[11]%%2 == 0))
(100*count(TSV %>% filter(TSV[14]==0)))/count(TSV)
TSV %>% filter(TSV[4]== 0)
count(TSV %>% filter(TSV[4]== 0))
TSV %>% filter(TSV[4]== 1)
count(TSV %>% filter(TSV[4]== 1))

# SOME GRAPHS, SMART DECISIONS --------------------------------------------
g1 <- TSV %>% ggplot(aes(x=`mes que naciste`)) + geom_histogram(bins=10)
g1+labs(title = "Cuando no venir a clase?", subtitle= "How to save $$$$")
TSV %>% ggplot(aes(x=`YEAR EN QUE NACISTE USA 4 DIGITOS POR EJ, 1977 sin  separador de miles`, y=`Sabe programar ? ( 1 =nivel piltrafilla,  10 =nivel dios)`)) + 
  geom_point(aes(colour=`Esta repetiendo la asignatura ? 0= Y; 1=N`))

TSV %>% ggplot(aes(x=`Has hecho el Digital Block ----- 0= Y; 1=N ?`, y=`Sabe programar ? ( 1 =nivel piltrafilla,  10 =nivel dios)`)) +
  geom_point(aes(colour=`Has hecho el Digital Block ----- 0= Y; 1=N ?`))

# CORPUS ------------------------------------------------------------------
vos_mismos <- TSV[3]
de_otros <- TSV[9]
corpus_vos_mismos <- Corpus(VectorSource(vos_mismos)) %>%
  tm_map(removePuntuaction) %>%
  tm_map(removeNumbers) %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("es")) %>%
  tm_map(stripWhitespace) %>%
  tm_map(stemDocument) 
## Term-document matrices y remove separ 
tdm_vos_mismos <- DocumentTermMatrix(corpus_vos_mismos) %>%
removeSparseTerms(1 - (1 / length(corpus_vos_mismos)))  

