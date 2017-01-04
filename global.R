library(ggplot2)
library(reshape2)
library(shiny)

## Read in data frames
ids_data <- read.csv("IDS_Data.csv", header = TRUE)
ids_country <- read.csv("IDS_Country.csv", header = TRUE)


## Pick out 'interesting' debt indicators
# int_factors <- c("GNI (current US$)", )


## IDS Data requires melting by year - also need to remove 'X' from these year names
ids_data_melted <- melt(ids_data, id.vars = 1:4, variable.name = "Year")

ids_data_melted$Year <- as.numeric(gsub("X", "", ids_data_melted$Year))


## Lookup region from country data
ids_data_melted <- merge(ids_data_melted, ids_country[, c("Table.Name", "Region")], all.x = TRUE,
                         by.x = "ï..Country.Name", by.y = "Table.Name")


## Define vars for UI
min_year <- min(ids_data_melted$Year, na.rm = T)
max_year <- max(ids_data_melted$Year, na.rm = T)

regions <- levels(ids_data_melted$Region)[which(levels(ids_data_melted$Region)!="")] # Remove empty region vals

indicators <- levels(ids_data$Indicator.Name)
