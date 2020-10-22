## 21747742 PATRICIA MARTIN BALLESTEROS #####
# Title: Navigating the RStudio UI (user interface) ####
# File: Navigating through R UI 
# Proyect: R_EssT_1; R Essential Training, Part 1:
#         Wrangling and visualizing data

# INSTALL AND LOAD PACKAGES ############################

#cambio de hoy

# Load base packages 
library(datasets) # importing datasets

# LOAD AND PREPARE DATA ###############################
?iris # help about iris dataset
df <- iris # create var called df and assign iris dataset
head(df) # print first elements
df
 num1 <- 10
 

# ANALIZE DATA #########################################
hist(df$Petal.Width,
     main = "European university - Histogram of petal width",
     xlab = "Petal width (in cm)")

# Plot 1
plot(iris$Sepal.Length, iris$Petal.Length,        # x variable, y variable
     col = iris$Species,                          # colour by species
     pch = 16,                                    # type of point to use
     cex = 2,                                     # size of point to use
     xlab = "Sepal Length",                       # x axis label
     ylab = "Petal Length",                       # y axis label
     main = "Flower Characteristics in Iris")     # plot title

legend (x = 4.5, y = 7, legend = levels(iris$Species), col = c(1:3), pch = 16)

#Plot 2

# EXERCISE (Petal length) and (species)



# CLEAN UP ##########################################

# Clean the environment
rm(list = ls())

# Clear plots
graphics.off() # clears plots, closes all grapthics devices

# Clear packages
detach("packages:datasets", unload = TRUE) # For base

# Clear plots
graphics.off() # Clear plots, closes all graphics devices

#Clear console
cat("\014") # ctrl+L
