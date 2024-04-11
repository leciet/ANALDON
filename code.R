
# 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

#https://github.com/leciet/analyse-de-donn-es.git

rm(list=ls())

library(tidyverse)
library(Factoshiny)
library(FactoMineR)

library(readr)
data <- read_delim("jeu de données_portugal.csv", 
                                      delim = ";", escape_double = FALSE, trim_ws = TRUE)



data$Medu=as.factor(data$Medu)
levels(data$Medu)
levels(data$Medu) <- c("MNone","MPrimary_school","M5th_9th_grade","MSecondary_school","MHigh_education")

data$Fedu=as.factor(data$Fedu)
levels(data$Fedu)
levels(data$Fedu) <- c("FNone","FPrimary_school","F5th_9th_grade","FSecondary_school","FHigh_education")

Factoshiny(data)