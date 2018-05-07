

##############################################################CA 2 Assignment


# setting the path 

setwd('C:\\Users\\pvashisth\\Source\\Repos\\DataScience\\CA2_data_analysis')

# reading the file

gas_data <- read.csv("c:/Users/pvashisth/Source/Repos/DataScience/CA2_data_analysis/air_gas.csv", header = T)

# Total number of rows

nrow(gas_data)

# structure of the dataset

str(gas_data)

# summary of the dataset

head(gas_data)
summary(gas_data)

# let's visualize the data with boxplots

boxplot(gas_data)

# Check headers in CSV file

names(gas_data)

# Stacking vectors concatenates multiple vectors into
# a single vector along with a factor indicating where each observation originated. 

gasdata_anova <- stack(gas_data)

# let's varify the new data factor

head(gasdata_anova, n=10)

# Anova single factor test in R

gasdata_model <- aov(values ~ ind, data = gasdata_anova)

summary(gasdata_model)


# Let's do the Turkey HSD to find where the difference are with in the group

TukeyHSD(gasdata_model)


# sample size determination, since we have all info I just want to varify what will be the power

pwr.anova.test(k = 4, n = 104, sig.level = 0.05, f = 0.25)
