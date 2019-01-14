#This is a script to load all of the data into a table for comparison of 
# DRG codes between local hospitals

# Load the BWH data
library(readxl)
bwh_drg_2019 <- read_excel("./data/BWH Standard Charge File.xlsx", sheet = "DRG Median Charges", col_types = c("text","text", "numeric"), skip = 3)
View(bwh_drg_2019)

#change the column named DRG Code to DRG
colnames(bwh_drg_2019)[colnames(bwh_drg_2019)=="DRG Code"] <- "DRG"

#take a substring of the DRG and strip first 2 characters
bwh_drg_2019$DRG <- substr(bwh_drg_2019$DRG,3,5)

# change the DRG <chr> to numeric
bwh_drg_2019$DRG <- as.numeric(bwh_drg_2019$DRG)



