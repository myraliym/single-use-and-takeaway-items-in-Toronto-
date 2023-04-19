#### Preamble ####
# Purpose: data cleaning for Usage Patterns
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
## input data
raw_data_2018<-read_xlsx(here::here("inputs/data/Fall 2018.xlsx")) 
raw_data_2019<-read.csv(here::here("inputs/data/Fall 2019.csv"))

# extract the row we need from 2018
single_use_data <- raw_data_2018[, c("2.1. Disposable Hot To-Go Cups, such as coffee cups", 
                                "2.2. Disposable Cold To-Go Cups, such as pop cups",
                                "2.3. Plastic Bags", 
                                "2.4. Paper Bags", 
                                "2.5. Black Plastic Containers",
                                "2.6. White, Clear, or any colour Plastic Containers",
                                "2.7. Disposable Cutlery",
                                "2.8. Plastic Straws", 
                                "2.9. Styrofoam Containers")]
# Rename the columns
single_use_data <- single_use_data %>%
  rename(
    "Hot To-Go Cups" = `2.1. Disposable Hot To-Go Cups, such as coffee cups`,
    "Cold To-Go Cups" = `2.2. Disposable Cold To-Go Cups, such as pop cups`,
    "Plastic Bags" = `2.3. Plastic Bags`,
    "Paper Bags" = `2.4. Paper Bags`,
    "Black Plastic Containers" = `2.5. Black Plastic Containers`,
    "Other Colour Plastic Containers" = `2.6. White, Clear, or any colour Plastic Containers`,
    "Disposable Cutlery" = `2.7. Disposable Cutlery`,
    "Plastic Straws" = `2.8. Plastic Straws`,
    "Styrofoam Containers" = `2.9. Styrofoam Containers`
  )

# Remove rows with any 'n/a' or NA values
single_use_data_clean<- na.omit(single_use_data)


# save the data frame as a csv file
write_xlsx(single_use_data_clean, here::here("outputs/data/Fig00_usage_pattern_data_2018.xlsx"))

# Remove first line
raw_data_2019<- raw_data_2019[-1, ]

# extract the income and race columns from 2019 data
data_2019 <- raw_data_2019[, c("X1..How.frequently.do.you.use.the.following.single.use.and.takeaway.items.", 
                               "X.5",
                               "X.6", 
                               "X.7", 
                               "X.8",
                               "X.9",
                               "X.10",
                               "X.11", 
                               "X.12")]
# Rename the columns
data_2019  <- data_2019  %>%
  rename(
    "Hot To-Go Cups" = `X1..How.frequently.do.you.use.the.following.single.use.and.takeaway.items.`,
    "Cold To-Go Cups" = `X.5`,
    "Plastic Bags" = `X.6`,
    "Paper Bags" = `X.7`,
    "Black Plastic Containers" = `X.8`,
    "Other Colour Plastic Containers" = `X.9`,
    "Disposable Cutlery" = `X.10`,
    "Plastic Straws" = `X.11`,
    "Styrofoam Containers" = `X.12`
  )

# Remove rows with any 'n/a' or NA values
data_2019<- na.omit(data_2019)

# save the data frame as a csv file
write.csv(data_2019, here::here("outputs/data/Fig00_usage_pattern_data_2019.csv"))
