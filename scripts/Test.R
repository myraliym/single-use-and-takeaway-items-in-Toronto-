#### Preamble ####
# Purpose: Test all cleaned data
# Author: Myra Li
# Data: 15 April 2023 
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
raw_data <- read.csv(here::here("outputs/data/cleaned_data.csv"))


# Check if there are any NA values in the data frame
if (any(is.na(raw_data_2019))) {
  cat("There are missing values (NA) in the data frame.\n")
} else {
  cat("There are no missing values (NA) in the data frame.\n")
}

# Test the gender is female or male
setequal(
  raw_data$gender %>% unique(),
  c("Female", "Male"))

# Test the age data is larger than 16
raw_data$age|> min() >= 16

# Test for education level
setequal(
  raw_data$education %>% unique(),
  c("Graduated from college / CEGEP / Trade School", "Graduated high school", "Primary school or less",
    "Some college / CEGEP / Trade School", "Some high school", "Some university, but did not finish",
    "University graduate degree", "University undergraduate degree")
)

# Test for household income
all(
  raw_data$household_income %>% unique() %in%
    c("Less than $5,000", "$5,000-$9,999", "$10,000-$14,999",
      "$15,000-$19,999", "$20,000-$24,999", "$25,000-$29,999",
      "$30,000-$34,999", "$35,000-$39,999", "$40,000-$44,999",
      "$45,000-$49,999", "$50,000-$54,999", "$55,000-$59,999",
      "$60,000-$64,999", "$65,000-$69,999", "$70,000-$74,999",
      "$75,000-$79,999", "$80,000-$84,999", "$85,000-$89,999",
      "$90,000-$94,999", "$95,000-$99,999", "$100,000-$124,999",
      "$125,000-$149,999", "$150,000-$199,999", "$200,000-$249,999",
      "$250,000 or more", "Prefer not to answer")
)
