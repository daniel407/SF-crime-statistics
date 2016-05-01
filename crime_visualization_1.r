library(ggplot2)


# plot of total incidents by month
rm(list=ls())
setwd("~/Documents/projects/c4sf/crime")
d_agg = read.csv("shinyapp/SFcrime/data/SF_crime_count_datemonth_category_district.csv")
d_agg$DateMonth = as.character(d_agg$DateMonth)
g = ggplot(d_agg, aes(DateMonth, Count))  + xlab("") + ylab("Incident Count")
g + geom_line()




# list of all PdDistricts and Categories
rm(list=ls())
setwd("~/Documents/projects/c4sf/crime")
d_agg = read.csv("shinyapp/SFcrime/data/SF_crime_count_datemonth_category_district.csv")
c = unique(d_agg$Category)
c1 = paste(tolower(c),c,sep="\"=\"")

d_agg = read.csv("shinyapp/SFcrime/data/SF_crime_count_datemonth_category_district.csv")
c = unique(d_agg$PdDistrict)
c1 = paste(tolower(c),c,sep="\"=\"")
