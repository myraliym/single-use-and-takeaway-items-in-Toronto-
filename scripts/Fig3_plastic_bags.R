#### Preamble ####
# Purpose: data cleaning for Usage Patterns of Disposable Cold To-Go Cups in 2018 and 2019
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
single_use_data <- read_xlsx(here::here("outputs/data/Fig00_usage_pattern_data_2018.xlsx"))
single_use_data_2019 <- read.csv(here::here("outputs/data/Fig00_usage_pattern_data_2019.csv"))


# Calculate frequency and percentage for 2018 data
frequency_table_plastic_2018 <- single_use_data %>%
  group_by(`Plastic Bags`) %>%
  summarise(Freq = n()) %>%
  mutate(Year = 2018) %>%
  as.data.frame()

total_count_2018 <- sum(frequency_table_plastic_2018$Freq)
frequency_table_plastic_2018$Percentage <- (frequency_table_plastic_2018$Freq / total_count_2018) * 100

# Calculate frequency and percentage for 2019 data
frequency_table_plastic_2019 <- single_use_data_2019 %>%
  group_by(`Plastic.Bags`) %>%
  summarise(Freq = n()) %>%
  mutate(Year = 2019) %>%
  as.data.frame()

total_count_2019 <- sum(frequency_table_plastic_2019$Freq)
frequency_table_plastic_2019$Percentage <- (frequency_table_plastic_2019$Freq / total_count_2019) * 100

# Rename columns to be consistent
colnames(frequency_table_plastic_2018) <- c("Plastic_Bags", "Freq", "Year", "Percentage")
colnames(frequency_table_plastic_2019) <- c("Plastic_Bags", "Freq", "Year", "Percentage")

# Combine 2018 and 2019 data into one data frame
combined_data <- dplyr::bind_rows(frequency_table_plastic_2018, frequency_table_plastic_2019)

write.csv(combined_data, here::here("outputs/data/Fig3_plastics_bags.csv"))