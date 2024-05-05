#-------------------------------------------------------------------------------
# Leslie CIETERS &  Emma GEORGES &  Mael HOARAU
# 05/05/2024
#
#                           UE Analyse de données
#                       Student alcohol consumption 
#-------------------------------------------------------------------------------

# Nettoyer l'environnement et installation des packages

rm(list=ls())

library(tidyverse)
library(Factoshiny)
library(FactoMineR)
library(readr)


# ------------ Importation du jeu de données et mise en forme ------------------

data <- read_delim("jeu de données_portugal.csv", 
                   delim = ";",
                   escape_double = FALSE, 
                   trim_ws = TRUE)

summary(data)

# % Le jeu de données comprend 1044 observations (étudiants) de 34 variables 
# % 5 variables sont quantitatives (absences, G1, G2, G3 et age), les autres étant qualitatives

# Remise des variables en facteurs
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

# Transformation des modalités de certains facteurs pour mieux comprendre l'analyse

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
levels(data$higher) <- c("highEdu-YES","highEdu-NO")

data$internet=as.factor(data$internet)
levels(data$internet)
levels(data$internet) <- c("int-YES","int-NO")

data$romantic=as.factor(data$romantic)
levels(data$romantic)
levels(data$romantic) <- c("rom-YES","rom-NO")

# pour les variables suivantes :
# 1 : very low
# 2 : low
# 3 : medium
# 4 : high
# 5 : very high 

data$famrel=as.factor(data$famrel)
levels(data$famrel)
levels(data$famrel) <- c("famrel-1","famrel-2","famrel-3","famrel-4","famrel-5")

data$freetime=as.factor(data$freetime)
levels(data$freetime)
levels(data$freetime) <- c("freet-1","freet-2","freet-3","freet-4","freet-5")

data$goout=as.factor(data$goout)
levels(data$goout)
levels(data$goout) <- c("go_out-1","go_out-2","go_out-3","go_out-4","go_out-5")

data$Dalc=as.factor(data$Dalc)
levels(data$Dalc)
levels(data$Dalc) <- c("Dalc-1","Dalc-2","Dalc-3","Dalc-4","Dalc-5")

data$Walc=as.factor(data$Walc)
levels(data$Walc)
levels(data$Walc) <- c("Walc-1","Walc-2","Walc-3","Walc-4","Walc-5")

data$health=as.factor(data$health)
levels(data$health)
levels(data$health) <- c("health-1","health-2","health-3","health-4","health-5")


# --------------- Analyse des correspondances multiples ------------------------

# ACM en mettant certaines variables qualitatives en variables supplémentaires 
res.MCA<-MCA(data,
             quanti.sup=c(4,31,32,33,34),
             quali.sup=c(3,6,7,8,9,10,11,12,13,21,22,24,25,30),
             graph=FALSE)

# résumé des résultats

summary(res.MCA)

# Description des axes 

dimdesc(res.MCA)

barplot(res.MCA$eig[,2],
        main="Décomposition de l'inertie",
        xlab = "Dimension",
        ylab = "Pourcentage d'inertie", 
        names.arg=1:nrow(res.MCA$eig),
        col = 'skyblue3',)

# Graphes pour les dimensions 1 et 2

plot.MCA(res.MCA, 
         choix='var',
         title="Graphe des variables")


plot.MCA(res.MCA,
         invisible= 'quali.sup',
         title="Graphe de l'ACM",
         label =c('ind','var'))


plot.MCA(res.MCA,
         invisible= c('quali.sup','ind'),
         title="Graphe de l'ACM",
         label =c('var'))


plot.MCA(res.MCA, 
         choix='quanti.sup',
         title="Variables quantitatives suplémentaires")


# Graphes pour les dimensions 2 et 3

plot.MCA(res.MCA, 
         choix='var',
         title="Graphe des variables",
         axes = c(2,3))


plot.MCA(res.MCA,
         invisible= 'quali.sup',
         title="Graphe de l'ACM",
         label =c('ind','var'),
         axes = c(2,3))


plot.MCA(res.MCA,
         invisible= c('quali.sup','ind'),
         title="Graphe de l'ACM",
         label =c('var'),
         axes = c(2,3))


plot.MCA(res.MCA, 
         choix='quanti.sup',
         title="Variables quantitatives suplémentaires",
         axes = c(2,3))



# ---------------------------- Classification ----------------------------------

res.MCA<-MCA(data,ncp=3,quanti.sup=c(4,31,32,33,34),quali.sup=c(3,6,7,8,9,10,11,12,13,18,21,22,24,25,30),graph=FALSE)
res.HCPC<-HCPC(res.MCA,nb.clust=2,consol=FALSE,graph=FALSE)
plot.HCPC(res.HCPC,choice='tree',title='Arbre hiérarchique')
plot.HCPC(res.HCPC,choice='map',draw.tree=FALSE,title='Plan factoriel')
plot.HCPC(res.HCPC,choice='3D.map',ind.names=FALSE,centers.plot=FALSE,angle=60,title='Arbre hiérarchique sur le plan factoriel')


classes <- read.csv('HCPCshiny.csv')


Factoshiny(data)
