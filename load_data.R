#This is a script to load all of the data into a table for comparison of 

#include libraries you need
library(dplyr)
library(readxl)

# DRG codes between local hospitals

# Load the BWH data

bwh_drg_2019 <- read_excel("./data/BWH Standard Charge File.xlsx", sheet = "DRG Median Charges", col_types = c("text","text", "numeric"), skip = 3)
View(bwh_drg_2019)

#change the column named DRG Code to DRG
colnames(bwh_drg_2019)[colnames(bwh_drg_2019)=="DRG Code"] <- "DRG"

#take a substring of the DRG and strip first 2 characters
bwh_drg_2019$DRG <- substr(bwh_drg_2019$DRG,3,5)

# change the DRG <chr> to numeric
bwh_drg_2019$DRG <- as.numeric(bwh_drg_2019$DRG)

# Load Data from BIDMC
bidmc_drg_2019 <- read.csv("./data/BIDMC DRG Charges 01-01-2019.csv")

# Change the column names
colnames(bidmc_drg_2019)[2] <- "Description"
colnames(bidmc_drg_2019)[3] <- "Median Charge"

# Get rid of the leading $ sign 
bidmc_drg_2019$`Median Charge` <- substring(as.character(bidmc_drg_2019$`Median Charge`),2)
#get rid of the commas
bidmc_drg_2019$`Median Charge` <- as.numeric(gsub(",","",bidmc_drg_2019$`Median Charge`))

# Get BMC data
bumc_drg_2019 <- read.csv("./data/BUMC DRG-Dec2018.csv")

# Change the column names
colnames(bumc_drg_2019)[1] <- "DRG"
colnames(bumc_drg_2019)[2] <- "Description"
colnames(bumc_drg_2019)[3] <- "Median Charge"

#change to numeric
bumc_drg_2019$`Median Charge` <- as.numeric(bumc_drg_2019$`Median Charge`)

combined <- full_join(bwh_drg_2019,bidmc_drg_2019, by = "DRG", suffix = c(".BW",".BI"))
combined2 <- full_join(combined, bumc_drg_2019, by = "DRG")


