
##############################################################CA 3 Assignment

# Installing the Deply package and libary needed to run with all steps

install.packages("dplyr")
library(dplyr)
library(readr)

## Question (A)

# setting the path 

setwd('C:\\Users\\pvashisth\\Source\\Repos\\DataScience\\CA3\\Data')

# creating function to combine all 36 files into one and write that into 1 CSV file AllNICrimeData

df <- list.files(full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows
write.csv(df, 'AllNICrimeData.csv', row.names = FALSE)

# reading the newly created csv file combined dataset

AllNICrimeData <- read.csv("c:/Users/pvashisth/Source/Repos/DataScience/CA3/Data/AllNICrimeData.csv", header = T)

# Total number of rows

nrow(AllNICrimeData)

# structure of the dataset

str(AllNICrimeData)

# summary of the dataset

head(AllNICrimeData)
summary(AllNICrimeData)

# 2nd question

# structure of the dataset

str(AllNICrimeData)

# checking the head of the dataset

head(AllNICrimeData)

# removing columns from the dataset (CrimeID, Reported by, Falls within, LSOA code, LSOA name, last outcome and context)

AllNICrimeData <- select(AllNICrimeData, -1, -3, -4, -8, -9, -11, -12)

# structure of the dataset

str(AllNICrimeData)

# varifying the head and summary of the dataset after changes applied

head(AllNICrimeData)
summary(AllNICrimeData)



# Question 3

# finding the total Na in the dataset

sum(is.na(AllNICrimeData))

# sum(is.na(updated_data$Month))

# let's be more precise and find the exact missing values per columns

colSums(is.na(AllNICrimeData))

# We notice Longitude and Latitude have some NA therefore need to get rid of those and its fine because its only 5 and we can't do anything about this, 

AllNICrimeData <- na.omit(AllNICrimeData)

# let's varify if we still have the NA's available

colSums(is.na(AllNICrimeData))

# structure of the new dataset

str(AllNICrimeData)

# Factorise the Crime type attribute
AllNICrimeData$Crime.type <- as.character(AllNICrimeData$Crime.type)

# lets check the updated structure
str(AllNICrimeData)

# summary and head of the dataset

head(AllNICrimeData)

summary(AllNICrimeData)

# question 4

# structure of the dataset

str(AllNICrimeData)

AllNICrimeData$Location <- gsub("On or near", "", AllNICrimeData$Location, ignore.case = T)

# head of the dataset

head(AllNICrimeData)

# structure of the dataset

str(AllNICrimeData)

# summary and head of the dataset

head(AllNICrimeData)

summary(AllNICrimeData)

# Question 5

# structure of the dataset

str(AllNICrimeData)

# Find a postcode function

find_a_postcode <- function(location) {
    print(location)
    if (is.na(location)) {
        print("Location was NULL")
        return;
    }

    lr <- tolower(location)

    lr <- trimws(lr)

    primary_thorfare <- CleanNIPostcodeData$Primary_Thorfare

    matched_index <- 0;
    count <- 1

    for (pt in primary_thorfare) {
        if (!is.na(pt)) {
            pt_lr <- tolower(pt)
            pt_lr <- trimws(pt_lr)

            if (lr == pt_lr) {
                matched_index <- count
                break;
            }
        }

        count <- count + 1
    }

    post_code <- CleanNIPostcodeData$Postcode[matched_index]

    print(post_code)

    return(post_code)
}

# run for all location in data set.
all_locations <- AllNICrimeData$Location

postcode_array <- c()

array_index <- 1
count_try <- 0
for (location in all_locations) {
    if (count_try > 10) {
        break;
    }

    matched_location <- find_a_postcode(location)

    if (!is.integer(matched_location)) {

        tryCatch({
            postcode_array[array_index] <- matched_location
            array_index <- array_index + 1
        }, error = function(error_condition) {
            postcode_array[array_index] <- NA
            array_index <- array_index + 1
        }, warning = function(warning_condition) {
            postcode_array[array_index] <- "error"
            array_index <- array_index + 1
        })

        count_try <- count_try + 1
    }
}

# structure of the dataset
str(AllNICrimeData)

Questoin 6

# add column
AllNICrimeData$PostCode <- NA

index_count <- 1
for (pc_item in postcode_array) {
    if (pc_item != "error") {
        AllNICrimeData$PostCode[index_count] <- pc_item
    }

    index_count <- index_count + 1
}

# structure of the dataset
str(AllNICrimeData)