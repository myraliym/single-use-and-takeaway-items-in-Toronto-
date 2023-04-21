#### Preamble ####
# Purpose: Simulates raw data
# Author: Myra Li
# Data: 11 April 2023 
# Contact: myra.li@mail.utoronto.ca
# Load required libraries
library(dplyr)

# Set the number of samples
n <- 1000

# Simulate the data frame
set.seed(123)
simulated_data <- data.frame(
  single_use_utensil_bylaw_opinion = sample(
    c("Strongly support", "Somewhat support", "Neither support nor oppose", "Somewhat oppose", "Strongly oppose", "Don't know"),
    n, replace = TRUE
  ),
  age = sample(16:99, n, replace = TRUE),
  education = sample(
    c("Graduated from college / CEGEP / Trade School", "Graduated high school", "Primary school or less", "Some college / CEGEP / Trade School", "Some high school", "Some university, but did not finish", "University graduate degree", "University undergraduate degree"),
    n, replace = TRUE
  ),
  gender = sample(c("Male", "Female"), n, replace = TRUE),
  household_income = sample(
    c("Less than $5000", "$5,000-$9,999", "$10,000-$14,999", "$15,000-$19,999", "$20,000-$24,999", "$25,000-$29,999", "$30,000-$34,999", "$35,000-$39,999", "$40,000-$44,999", "$45,000-$49,999", "$50,000-$54,999", "$55,000-$59,999", "$60,000-$64,999", "$65,000-$69,999", "$70,000-$74,999", "$75,000-$79,999", "$80,000-$84,999", "$85,000-$89,999", "$90,000-$94,999", "$95,000-$99,999", "$100,000-$124,999", "$125,000-$149,999", "$150,000-$199,999", "$200,000-$249,000", "$250,000 or more", "Prefer not to answer"),
    n, replace = TRUE
  )
)

# View the simulated data frame
head(simulated_data)
