#### Preamble dksbcasvkfvkcssf####
# Purpose: Prepare the 2021 GSS data
# Author: Adam Labas and Krupali Bhavsar
# Data: March 20 2022
# Contact: adam.labas@mail.utoronto.ca and krupali.bhavsar@mail.utoronto.ca
# License: 
# Pre-requisites: 
# - Need to have downloaded the GSS data and saved it to inputs/data


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(janitor)
library(tidyr)
library(dplyr)
library(knitr)
library(patchwork)
# Read in the raw data. 
raw_data <- haven::read_dta("inputs/data/2021_stata/gss2021.dta")

write.csv(x = raw_data,
          file = "inputs/data/raw.csv")

# Just keep some variables that may be of interest (change 
# this depending on your interests)
names(raw_data)


reduced_data <- 
  raw_data %>% 
  select(age, 
         sexnow1,
         born,
         marital,
         educ,
         divorce,
         degree,
         income,
         nathealy,
         cohort,
         agekdbrn,
         income16,
         granborn) %>% 
  rename(sex = sexnow1)

reduced_data$income16_cat <- reduced_data$income16
reduced_data$income_cat <- reduced_data$income

reduced_data <- 
  reduced_data %>%
  mutate(sex = case_when(
    sex == 1 ~ "Male",
    sex == 2 ~ "Female",
    sex == 3 ~ "Transgender",
    sex == 4 ~ "None of These"
  ))

reduced_data <- 
  reduced_data %>% 
  mutate(granborn = case_when(
    granborn == 0 ~ "None",
    granborn == 1 ~ "One",
    granborn == 2 ~ "Two",
    granborn == 3 ~ "Three",
    granborn == 4 ~ "Four"
  ))

reduced_data <- 
  reduced_data %>% 
  mutate(born = case_when(
    born == 1 ~ "Yes",
    born == 2 ~ "No"
  ))

reduced_data <- 
  reduced_data %>%
  mutate(nathealy = case_when(
    nathealy == 1 ~ "Too Little",
    nathealy == 2 ~ "About Right",
    nathealy == 3 ~ "Too Much"
  ))

reduced_data <- 
  reduced_data %>% 
  mutate(income16_cat = case_when(
    income16_cat == 1 ~ "$1,000 AND UNDER",
    income16_cat == 2 ~ "$1,000 TO $2,999",
    income16_cat == 3 ~ "$3,000 TO $3,999",
    income16_cat == 4 ~ "$4,000 TO $4,999",
    income16_cat == 5 ~ "$5,000 TO $5,999",
    income16_cat == 6 ~ "$6,000 TO $6,999",
    income16_cat == 7~ "$7,000 TO $7,999",
    income16_cat == 8 ~ "$8,000 TO $9,999",
    income16_cat == 9 ~ "$10,000 TO $12,499",
    income16_cat == 10 ~ "$12,500 TO $14,999",
    income16_cat == 11 ~ "$15,000 TO $17,499",
    income16_cat == 12 ~ "$17,500 TO $19,999",
    income16_cat == 13 ~ "$20,000 TO $22,499",
    income16_cat == 14 ~ "$22,500 TO $24,999",
    income16_cat == 15 ~ "$25,000 TO $29,999",
    income16_cat == 16 ~ "$30,000 TO $34,999",
    income16_cat == 17 ~ "$35,000 TO $39,999",
    income16_cat == 18 ~ "$40,000 TO $49,999",
    income16_cat == 19 ~ "$50,000 TO $59,999",
    income16_cat == 20 ~ "$60,000 TO $74,999",
    income16_cat == 21 ~ "$75,000 TO $89,999",
    income16_cat == 22 ~ "$90,000 TO $109,999",
    income16_cat == 23 ~ "$110,000 TO $129,999",
    income16_cat == 24 ~ "$130,000 TO $149,999",
    income16_cat == 25 ~ "$150,000 TO $169,999",
    income16_cat == 26 ~ "$170,000 OR OVER",
  ))

reduced_data <- 
  reduced_data %>% 
  mutate(income_cat = case_when(
    income_cat == 1 ~ "$1,000 AND UNDER",
    income_cat == 2 ~ "$1,000 TO $2,999",
    income_cat == 3 ~ "$3,000 TO $3,999",
    income_cat == 4 ~ "$4,000 TO $4,999",
    income_cat == 5 ~ "$5,000 TO $5,999",
    income_cat == 6 ~ "$6,000 TO $6,999",
    income_cat == 7~ "$7,000 TO $7,999",
    income_cat == 8 ~ "$8,000 TO $9,999",
    income_cat == 9 ~ "$10,000 TO $14,999",
    income_cat == 10 ~ "$15,000 TO $19,999",
    income_cat == 11 ~ "$20,000 TO $24,999",
    income_cat == 12 ~ "$25,000 OR MORE"
  ))

write.csv(x = reduced_data,
          file = "inputs/data/reduced_data.csv")

