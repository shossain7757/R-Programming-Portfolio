
library(palmerpenguins)
library(tidyverse)


# General Structure of the Dataset

str(penguins)





# No of rows and columns in the dataset

dim(penguins)





# Name of the columns in the dataset

names(penguins)





# Summary statistics of 'bill_length_mm', 'bill_depth_mm', 'flipper_length_mm',
# & "body_mass_g" 

penguins %>%
  select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>% 
  summary()







# Means of 'bill_length_mm', 'bill_depth_mm', 'flipper_length_mm',
# & "body_mass_g" by Species

penguins %>% 
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  group_by(species) %>% 
  summarise(Mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            Mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE),
            Mean_flipper_length = mean(flipper_length_mm, na.rm = TRUE),
            Mean_body_mass_g = mean(body_mass_g, na.rm = TRUE))
  
  