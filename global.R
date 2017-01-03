library(ggplot2)
library(reshape2)

# Read in data frames
ids_data <- read.csv("IDS_Data.csv", header = TRUE)
ids_country <- read.csv("IDS_Country.csv", header = TRUE)

## IDS Data requires melting by year - also need to remove 'X' from these year names

ids_data_melted <- melt(ids_data, id.vars = 1:4, variable.name = "Year")

ids_data_melted$Year <- as.numeric(gsub("X", "", ids_data_melted$Year))
