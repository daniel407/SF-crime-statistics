#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

setwd("/home/daniel/Documents/projects/c4sf/crime/shinyapp/SFcrime")
df = read.csv("data/SF_crime_count_datemonth_category_district.csv")
df$DateMonth = as.character(df$DateMonth)
df_sub = df

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    range = as.character(input$date_range)
    range_start = substr(range[1],0,7)
    range_end = substr(range[2],0,7)
    df_sub = df[(df$DateMonth > range_start & df$DateMonth < range_end),]
    
    categories = input$Category
    df_sub = df_sub[df_sub$Category %in% categories,]
    
    pddistricts = input$PdDistrict
    df_sub = df_sub[df_sub$PdDistrict %in% pddistricts,]
    
    g = ggplot(df_sub, aes(DateMonth, Count))  + xlab("") + ylab("Incident Count")
    g + geom_line()
    
    
  })
  
  output$text1 <- renderText({ 
    category = input$Category
  })
  
})
