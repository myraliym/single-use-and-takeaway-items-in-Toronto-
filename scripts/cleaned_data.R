#### Preamble ####
# Purpose: data cleaning for the model
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
library(writexl)
# input data
raw_data_2019<-read.csv(here::here("inputs/data/Fall 2019.csv"))

# extract the row we need from 2019
cleaned_data<- raw_data_2019[, c("X.24", 
                                 "X",
                                 "X.1", 
                                 "X.2", 
                                 "X.3",
                                 "X.4")]

# rename the columns
cleaned_data  <- cleaned_data  %>%
  rename(
    "single_use_utensil_bylaw_opinion" = `X.24`,
    "gender" = `X`,
    "age" = `X.1`,
    "education" = `X.2`,
    "household_income" = `X.3`,
    "location" = `X.4`)

# remove rows with any 'n/a' or NA values
cleaned_data<- na.omit(cleaned_data)
cleaned_data<- cleaned_data[-1, ]

# change the value "Don?t know" to "Don't know"
cleaned_data$single_use_utensil_bylaw_opinion <- ifelse(
  cleaned_data$single_use_utensil_bylaw_opinion == "Don?t know", 
  "Don't know", 
  cleaned_data$single_use_utensil_bylaw_opinion)

write.csv(cleaned_data, here::here("outputs/data/cleaned_data.csv"))