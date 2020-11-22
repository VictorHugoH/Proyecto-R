

#GLOBAL
#ShinyApp elaborado por: Victor Hinojosa, Aldair Alexander

#Librerias
library(shiny)
library(shinythemes)
library(shinydashboard)
library(plotly)
library(ggplot2)
library(leaflet)
library(raster)
library(tmap)
library(readxl)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(xtable)
library(tmap)


#---------------------------LECTURA DE BASES DE DATOS


unificado<-read_excel("BASE DEUDA.xlsx", sheet = 1, col_names = TRUE, na=c(""))
pais<-read_excel("BASE DEUDA.xlsx", sheet = 2, col_names = TRUE, na=c(""))
moneda<-read_excel("BASE DEUDA.xlsx", sheet = 3, col_names = TRUE, na=c(""))
acreedor<-read_excel("BASE DEUDA.xlsx", sheet = 4, col_names = TRUE, na=c(""))
tasas<-read_excel("BASE DEUDA.xlsx", sheet = 5, col_names = TRUE, na=c(""))


#--------------------------- SELECCION DE DATOS NECESARIOS



tab1<-data.frame(unificado$AÑO,unificado$MES, unificado$PIB)
tab2<-data.frame(unificado$AÑO,unificado$MES, unificado$`TOTAL SALDO DEUDA EXTERNA`)
tab3<-data.frame(unificado$AÑO,unificado$MES, unificado$`TOTAL SALDO DEUDA INTERNA`)
tab4<-data.frame(unificado$AÑO,unificado$MES, unificado$`TOTAL SALDO DEUDA PÚBLICA`)
tab5<-data.frame(unificado$AÑO,unificado$MES, unificado$`RELACIÓN DEUDA/PIB`)
tab6<-data.frame(unificado)

#--------------------------- TRATAMIENTO DE DATOS



unificado$AÑO <- as.factor(unificado$AÑO)





pais$PAÍS <- as.factor(pais$PAÍS)
pais$MES <- as.factor(pais$MES)
pais$AÑO <- as.factor(pais$AÑO)
pais$`tipo deuda` <- as.factor(pais$`tipo deuda`)


moneda$MES <- as.factor(moneda$MES)
moneda$AÑO <- as.factor(moneda$AÑO)
moneda$`tipo deuda` <- as.factor(moneda$`tipo deuda`)
moneda$MONEDA <- as.factor(moneda$MONEDA)

levels(acreedor$ACREEDOR)


acreedor$Mes <- as.factor(acreedor$Mes)
acreedor$Año <- as.factor(acreedor$Año)
acreedor$`tipo deuda` <- as.factor(acreedor$`tipo deuda`)
acreedor$ACREEDOR <- as.factor(acreedor$ACREEDOR)


tasas$MES <- as.factor(tasas$MES)
tasas$AÑO <- as.factor(tasas$AÑO)
tasas$tipotasa <- as.factor(tasas$tipotasa)
tasas$tasa <- as.factor(tasas$tasa)



