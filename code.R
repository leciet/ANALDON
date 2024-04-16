
# 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

#https://github.com/leciet/analyse-de-donn-es.git

rm(list=ls())

library(tidyverse)
library(Factoshiny)
library(FactoMineR)

library(readr)
data <- read_delim("jeu de données_portugal.csv", 
                                      delim = ";", escape_double = FALSE, trim_ws = TRUE)

data$school=as.factor(data$school)
data$course=as.factor(data$course)
data$sex=as.factor(data$sex)
data$address=as.factor(data$address)
data$famsize=as.factor(data$famsize)
data$Pstatus=as.factor(data$Pstatus)
data$Mjob=as.factor(data$Mjob)
data$Fjob=as.factor(data$Fjob)
data$reason=as.factor(data$reason)
data$guardian=as.factor(data$guardian)

data$Medu=as.factor(data$Medu)
levels(data$Medu)
levels(data$Medu) <- c("MNone","MPrimary_school","M5th_9th_grade","MSecondary_school","MHigh_education")

data$Fedu=as.factor(data$Fedu)
levels(data$Fedu)
levels(data$Fedu) <- c("FNone","FPrimary_school","F5th_9th_grade","FSecondary_school","FHigh_education")

data$traveltime=as.factor(data$traveltime)
levels(data$traveltime)
levels(data$traveltime) <- c("t0-15","t15-30","t30-60","t60+")

data$studytime=as.factor(data$studytime)
levels(data$studytime)
levels(data$studytime) <- c("s0-2","s2-5","s5-10","10+")



Factoshiny(data)
