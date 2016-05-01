setwd("~/Documents/projects/c4sf/crime")

#### run this section to aggregate by day
rm(list=ls())
# read data
data_file_path = 'data/SFPD_Incidents_-_from_1_January_2003.csv'
df = read.csv(data_file_path)
head(df)

#reformat Date
df$Date = paste(substr(df$Date,7,10),substr(df$Date,0,2),substr(df$Date,4,5),sep='-')

# aggregate count by Date, Category, PdDistrict 
df_agg = aggregate(IncidntNum ~ Date + Category + PdDistrict, data = df, FUN = length)
df_agg = df_agg[order(df_agg$Date, df_agg$PdDistrict, df_agg$Category),]
colnames(df_agg)[colnames(df_agg) == "IncidntNum"] = "Count"

# save data file
write.csv(x=df_agg, file="shinyapp/SFcrime/data/SF_crime_count_date_category_district.csv", row.names = FALSE)

#visual check
head(df_agg,100)


#### run this section to aggregate by month
rm(list=ls())
# read data
data_file_path = 'data/SFPD_Incidents_-_from_1_January_2003.csv'
df = read.csv(data_file_path)
head(df)

#reformat Date
df$DateMonth = paste(substr(df$Date,7,10),substr(df$Date,0,2),sep='-')

# aggregate count by Date, Category, PdDistrict 
df_agg = aggregate(IncidntNum ~ DateMonth + Category + PdDistrict, data = df, FUN = length)
df_agg = df_agg[order(df_agg$DateMonth, df_agg$PdDistrict, df_agg$Category),]
colnames(df_agg)[colnames(df_agg) == "IncidntNum"] = "Count"

# save data file
write.csv(x=df_agg, file="shinyapp/SFcrime/data/SF_crime_count_datemonth_category_district.csv", row.names = FALSE)

#visual check
head(df_agg,1000)


