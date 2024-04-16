
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
data$failures=as.factor(data$failures)

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

data$schoolsup=as.factor(data$schoolsup)
levels(data$schoolsup)
levels(data$schoolsup) <- c("schsup-YES","schsup-NO")

data$famsup=as.factor(data$famsup)
levels(data$famsup)
levels(data$famsup) <- c("famsup-YES","famsup-NO")

data$paid=as.factor(data$paid)
levels(data$paid)
levels(data$paid) <- c("paid-YES","paid-NO")

data$activities=as.factor(data$activities)
levels(data$activities)
levels(data$activities) <- c("act-YES","act-NO")

data$nursery=as.factor(data$nursery)
levels(data$nursery)
levels(data$nursery) <- c("nurs-YES","nurs-NO")

data$higher=as.factor(data$higher)
levels(data$higher)
levels(data$higher) <- c("high-YES","high-NO")

data$internet=as.factor(data$internet)
levels(data$internet)
levels(data$internet) <- c("int-YES","int-NO")

data$romantic=as.factor(data$romantic)
levels(data$romantic)
levels(data$romantic) <- c("rom-YES","rom-NO")

data$famrel=as.factor(data$famrel)
levels(data$famrel)
levels(data$famrel) <- c("famrel-vl","famrel-l","famrel-med","famrel-hg","famrel-vhg")

data$freetime=as.factor(data$freetime)
levels(data$freetime)
levels(data$freetime) <- c("freet-vl","freet-l","freet-med","freet-hg","freet-vhg")

data$goout=as.factor(data$goout)
levels(data$goout)
levels(data$goout) <- c("goout-vl","goout-l","goout-med","goout-hg","goout-vhg")

data$Dalc=as.factor(data$Dalc)
levels(data$Dalc)
levels(data$Dalc) <- c("Dalc-vl","Dalc-l","Dalc-med","Dalc-hg","Dalc-vhg")

data$Walc=as.factor(data$Walc)
levels(data$Walc)
levels(data$Walc) <- c("Walc-vl","Walc-l","Walc-med","Walc-hg","Walc-vhg")

data$health=as.factor(data$health)
levels(data$health)
levels(data$health) <- c("health-vl","health-l","health-med","health-hg","health-vhg")



Factoshiny(data)
