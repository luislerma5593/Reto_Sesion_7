
library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")


dbListTables(MyDataBase)

city <- dbGetQuery(MyDataBase, "select * from City")
country <- dbGetQuery(MyDataBase, "select * from Country")
CountryLanguage <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

porcentaje <- filter(CountryLanguage, Language == "Spanish" )

ggplot(porcentaje, aes(x=Percentage, y=CountryCode, col=IsOfficial)) + geom_point()

