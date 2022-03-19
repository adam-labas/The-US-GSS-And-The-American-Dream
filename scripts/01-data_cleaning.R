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
# Read in the raw data. 
raw_data <- haven::read_dta("inputs/data/2021_stata/gss2021.dta")

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
         degree)

rm(raw_data)
#over here we have to pic what variables/columns we want to keep

#### What's next? ####

         