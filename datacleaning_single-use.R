#### Preamble ####
# Purpose: data cleaning for figure 1
# Author: Myra Li
# Data: 11 April 2023 
# Contact: myra.li@mail.utoronto.ca

# Loading in relevant libraries
library(tidyverse)
library(dplyr, warn.conflicts = FALSE)
library(tidyr)
library(readxl)
library(data.table)
library(lubridate)
library(haven)
library(readxl)
library(ggplot2)
library(reshape2)

## input data
raw_data<-read_xlsx(here::here("inputs/data/Fall 2018.xlsx")) 

# extract the income and race columns
single_use_data <- raw_data[, c("2.1. Disposable Hot To-Go Cups, such as coffee cups", 
                                "2.2. Disposable Cold To-Go Cups, such as pop cups",
                                "2.3. Plastic Bags", "2.4. Paper Bags", 
                                "2.5. Black Plastic Containers",
                                "2.6. White, Clear, or any colour Plastic Containers",
                                "2.7. Disposable Cutlery",
                                "2.8. Plastic Straws", "2.9. Styrofoam Containers")]

# Remove rows with any 'n/a' or NA values
single_use_data_clean<- na.omit(single_use_data)

# Rename
single_use_data_clean$Item <- recode(single_use_data_clean$Item,
                                     "2.1. Disposable Hot To-Go Cups, such as coffee cups" = "Disposable Hot To-Go Cups",
                                     "2.2. Disposable Cold To-Go Cups, such as pop cups" = "Disposable Cold To-Go Cups",
                                     "2.3. Plastic Bags" = "Plastic Bags",
                                     "2.4. Paper Bags" = "Paper Bags",
                                     "2.5. Black Plastic Containers" = "Black Plastic Containers",
                                     "2.6. White, Clear, or any colour Plastic Containers" = "White, Clear, or Any Colour Plastic Containers",
                                     "2.7. Disposable Cutlery" = "Disposable Cutlery",
                                     "2.8. Plastic Straws" = "Plastic Straws",
                                     "2.9. Styrofoam Containers" = "Styrofoam Containers")

# save the data frame as a csv file
write.csv(single_use_data_clean, file = here::here("outputs/data/single-use_data.csv"), row.names = TRUE)
