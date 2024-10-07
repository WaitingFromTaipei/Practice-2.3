rairuoho<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt',header=T, sep="\t", dec='.')
library("dplyr")
library("tidyr")
# Remove 'row' and 'column'.

rairuoho1 <- dplyr::select(rairuoho, -row, -column)

# Replace nutrient with enriched in the dataset.
rairuoho1$treatment<-ifelse(rairuoho1$treatment=='nutrient', 'enriched', 'water')


# Reformat the table so that the day is as a single variable (factor).
# Create 'length' to get the length of the grass on the given day
rairuoho2 <- rairuoho1 %>%
  pivot_longer(day3:day8, names_to='day', values_to='length')

# Merge variables Spatial1 and Spatial2 
rairuoho3 <- rairuoho2 %>%
  unite('Spatial', spatial1:spatial2, sep = '_')
