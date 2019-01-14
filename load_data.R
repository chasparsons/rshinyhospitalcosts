

library(readxl)
bwh_drg_2019 <- read_excel("~/development/rshiny hospital costs/data/BWH Standard Charge File.xlsx", 
                             + sheet = "DRG Median Charges", col_types = c("text","text", "numeric"), skip = 3)
View(bwh_drg_2019)
colnames(bwh_drg_2019)[colnames(bwh_drg_2019)=="DRG Code"] <- "DRG"
bwh_drg_2019$DRG <- substr(bwh_drg_2019$DRG,3,5)
