# Setup
library(tidyverse)
library(readxl)
library(data.table)
library(vroom)


# Directory
mydir <- "data" # Added path for files to be read from


# Download 2024 link from CFTC, unzip, then read
download.file("https://www.cftc.gov/files/dea/history/dea_com_xls_2024.zip", 
              destfile = "data/2024LegFao.zip")
unzip("data/2024LegFao.zip", exdir = "data")


# Create vector of file path names to import CSV files
myfiles <- list.files(path = mydir, pattern = "*.xls", full.names = TRUE) # Creates vector full of complete file names
myfiles


# Use lapply to call all file paths in myfiles vector and apply read_excel function 
dat_csv <- lapply(myfiles, read_excel) 
# This gives me a list of 9 tables


# Combine all 9 tables into 1
LegFaoDF <- rbindlist(dat_csv, fill = FALSE, idcol = NULL) %>% tibble() %>% 
  arrange(Market_and_Exchange_Names, desc(Report_Date_as_MM_DD_YYYY)) 





# I know from experience that the CFTC has changed the names of market contracts throughout the years. 
# Luckily they have a Market_Code for these items so I can match up all of the different names for each ID to clean them into consistent strings.
unique_names_and_id <- select(LegFaoDF, Market_and_Exchange_Names, CFTC_Contract_Market_Code)

unique_names_and_id <- distinct(unique_names_and_id)

#### I want to match all of the name variations with the unique_id's








