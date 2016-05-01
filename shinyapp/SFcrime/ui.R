#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("SF Crime, incident statistics"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       checkboxGroupInput("Category", 
                          label = h3("Category"), 
                          choices = list( "arson"="ARSON","assault"="ASSAULT",                     
                                          "burglary"="BURGLARY","disorderly conduct"="DISORDERLY CONDUCT",
                                          "driving under the influence"="DRIVING UNDER THE INFLUENCE","drug/narcotic"="DRUG/NARCOTIC",                        
                                          "drunkenness"="DRUNKENNESS","embezzlement"="EMBEZZLEMENT",               
                                          "family offenses"="FAMILY OFFENSES","forgery/counterfeiting"="FORGERY/COUNTERFEITING",
                                          "fraud"="FRAUD","kidnapping"="KIDNAPPING",                
                                          "larceny/theft"="LARCENY/THEFT","liquor laws"="LIQUOR LAWS",  
                                          "loitering"="LOITERING","missing person"="MISSING PERSON",
                                          "non-criminal"="NON-CRIMINAL","other offenses"="OTHER OFFENSES",
                                          "robbery"="ROBBERY","runaway"="RUNAWAY",
                                          "secondary codes"="SECONDARY CODES","sex offenses, forcible"="SEX OFFENSES, FORCIBLE",
                                          "stolen property"="STOLEN PROPERTY","suicide"="SUICIDE",
                                          "suspicious occ"="SUSPICIOUS OCC","trespass"="TRESPASS",
                                          "vandalism"="VANDALISM","vehicle theft"="VEHICLE THEFT",
                                          "warrants"="WARRANTS","weapon laws"="WEAPON LAWS",
                                          "bad checks"="BAD CHECKS","gambling"="GAMBLING",
                                          "prostitution"="PROSTITUTION","bribery"="BRIBERY",
                                          "sex offenses, non forcible"="SEX OFFENSES, NON FORCIBLE","extortion"="EXTORTION",
                                          "pornography/obscene mat"="PORNOGRAPHY/OBSCENE MAT","recovered vehicle"="RECOVERED VEHICLE" ),
                          selected = c("ARSON","ASSAULT",                     
                                       "BURGLARY","DISORDERLY CONDUCT",
                                       "DRIVING UNDER THE INFLUENCE","DRUG/NARCOTIC","DRUNKENNESS","EMBEZZLEMENT",               
                                       "FAMILY OFFENSES","FORGERY/COUNTERFEITING","FRAUD","KIDNAPPING","LARCENY/THEFT","LIQUOR LAWS",  
                                       "LOITERING","MISSING PERSON","NON-CRIMINAL","OTHER OFFENSES","ROBBERY","RUNAWAY","SECONDARY CODES","SEX OFFENSES, FORCIBLE",
                                       "STOLEN PROPERTY","SUICIDE","SUSPICIOUS OCC","TRESPASS","VANDALISM","VEHICLE THEFT","WARRANTS","WEAPON LAWS","BAD CHECKS","GAMBLING",
                                       "PROSTITUTION","BRIBERY","SEX OFFENSES, NON FORCIBLE","EXTORTION","PORNOGRAPHY/OBSCENE MAT","RECOVERED VEHICLE" ))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       dateRangeInput("date_range", label = h3("Date range"), start = "2003-01-01", end = "2016-01-01", format = "yyyy-mm", startview = "year"),
       checkboxGroupInput("PdDistrict", 
                          label = h3("PD district"), 
                          choices = list("Bayview"="BAYVIEW","Central"="CENTRAL","Ingleside"="INGLESIDE","Mission"="MISSION",
                                         "Northern"="NORTHERN","Park"="PARK" ,"Richmond"="RICHMOND","Southern"="SOUTHERN","Taraval"="TARAVAL",
                                         "Tenderloin"="TENDERLOIN"),
                          selected = c("BAYVIEW","CENTRAL","INGLESIDE","MISSION","NORTHERN","PARK","RICHMOND","SOUTHERN","TARAVAL","TENDERLOIN"))
    )
  )
))
