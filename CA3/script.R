# Original data frame description is shown in notes on Blackboard

# Create column names for each attribute in the data frame
colnames <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Enter data into vectors before constructing the data frame
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)

#

# Construct a data frame using the data from all vectors above
my_data <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using colnames vector
colnames(my_data) <- colnames

# Display contents of my_data
my_data

# Show first 5 rows from my_data
head(my_data)

# Show attribute structure of my_data
str(my_data)

# Recode the incorrect 'age' data to NA
my_data$Age[my_data$Age == 99] <- NA
# Examine new data in my_data to confirm substitution
my_data

# Create a new attribute called AgeCat and set valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age 'NA' to Elder

my_data$AgeCat[my_data$Age >= 45] <- "Elder"
my_data$AgeCat[my_data$Age >= 26 & my_data$Age <= 44] <- "Middle Aged"
my_data$AgeCat[my_data$Age <= 25] <- "Young"
my_data$AgeCat[is.na(my_data$Age)] <- "Elder"

# Show contents of data frame
my_data

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll srore the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(my_data$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elder"))

# Show contents of AgeCat
AgeCat

# Replace my_data's AgeCat attribute with newly ordinal foctored data
my_data$AgeCat <- AgeCat
# Show new structure
str(my_data)

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- my_data$Q1 + my_data$Q2 + my_data$Q3 + my_data$Q4 + my_data$Q5
summary_col

# Add summary_col to the end of the data frame
my_data <- data.frame(my_data, summary_col)
my_data

# Convert string to date fields
# Show structure of the data frame
str(my_data)

# Example of as.Date() function
strDates <- c("01/05/1965", "16/08/1975")
dates <- as.Date(strDates, "%d/%m/%Y")
dates

# Convert the date field in my_data to a date
# Original data
my_data$Date

# Convert from string to relevant structure
# In this example, convert date string to yyyy-dd-mm
# as we have to match what is in the original vector
# before we can convert it
date_field <- as.Date(my_data$Date, "%Y-%d-%m")
# Show output
date_field
# Replace the date field in the data frame
my_data$Date <- date_field
str(my_data)
my_data

# Example of changing the output date
date_format <- "%b %d %Y"
today <- Sys.Date()
output_date <- format(today, format = date_format)
output_date

# Display difference between 13th Feb 2004 and 22nd Jan 2018
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2018-01-22")
days <- enddate - startdate
days

? difftime # Show help on difftime() function
# Calaulate how old I am in days
todays_date <- Sys.Date()
my_dob <- as.Date("08-03-1977")
diff_dates <- difftime(today, my_dob, units = "days") # Several unit types available
diff_dates

#Sorting data by age
my_data
new_data <- my_data[order(my_data$Age),]
new_data

# We can use attach command to bypass need for '$' sign 
# to identify variables in the data frame
attach(my_data)
str(my_data$Age)
str(my_data$Gender)
new_data <- my_data[order(decreasing = TRUE, Gender, Age),]

# Sort by AgeCat. This is a factored variable
new_data <- my_data[order(AgeCat),]
new_data


my_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:4, 2), d = 2)

my_list

# mapply function

first_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:16, 2), d = 2)
second_list <- list(a = matrix(1:9, 3), b = 1:7, c = matrix(1:16, 8), d = 2)


simple_function <- function(first_list, second_list) {
    result <- NROW(first_list) + NROW(second_list)
    return(result)

}

mapply(simple_function, first_list, second_list)


a <- matrix(1:10, 2)
a

install.packages("swirl")
library(swirl)
install_course_zip("c:/swirl_courses-master.zip", multi = TRUE, which_course = "R Programming")
swirl()

swirl::install_course()

###############################
###############################
##############################################################CA 3 Assignment

# Installing the Deply package and libary needed to run the 

install.packages("dplyr")
library(dplyr)
library(readr)

# Question (A)

# setting the path 
setwd('C:\\Users\\pvashisth\\Source\\Repos\\DataScience\\CA3\\Data')
getwd()

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

# 2nd question

# structure of the dataset

str(AllNICrimeData)

# checking the head of the dataset

head(AllNICrimeData)

# removing columns from the dataset (CrimeID, Reported by, Falls within, LSOA code, LSOA name, last outcome and context)

AllNICrimeData <- select(AllNICrimeData, -1, -3, -4, -8, -9, -11, -12)

# structure of the dataset

str(AllNICrimeData)

# columns number in index 1, 3, 4, 8, 9, 11, 12

#########################################################################################
####################################### Data Cleaning before further processing

# summary of the dataset to see how dataset looks like

summary(AllNICrimeData)

# finding the total Na in the dataset

sum(is.na(AllNICrimeData))

# sum(is.na(updated_data$Month))

# let's be more precise and find the exact missing values per columns

colSums(is.na(AllNICrimeData))

# We notice Longitude and Latitude have some NA therefore need to get rid of those and its fine because its only 5 and we can't do anything about this, 

AllNICrimeData <- na.omit(AllNICrimeData)

# let's varify if we still have the NA's available

colSums(is.na(AllNICrimeData))

# updating the column name Crime type to Crime_type

#AllNICrimeData <- colnames(AllNICrimeData)[which(colnames(AllNICrimeData) == 'Crime type')] <- 'Crime_type'

# structure of the new dataset

str(AllNICrimeData)


# Question 3

# structure of the dataset

str(AllNICrimeData)

# Factorise the Crime type attribute
AllNICrimeData$Crime.type <- as.character(AllNICrimeData$Crime.type)

# lets check the updated structure
str(AllNICrimeData)

# question 4

# structure of the dataset

str(AllNICrimeData)

AllNICrimeData$Location <- gsub("On or near", "", AllNICrimeData$Location, ignore.case = T)

# head of the dataset

head(AllNICrimeData)

# structure of the dataset

str(AllNICrimeData)

# Question 5

# structure of the dataset

str(AllNICrimeData)

postcode <- names(which.max(table(postcodes)))

CleanNIPostcodeData <- read.csv("c:/Users/pvashisth/Source/Repos/DataScience/CA3/Data/CleanNIPostcodeData.csv", header = T)


str(CleanNIPostcodeData)
head(CleanNIPostcodeData)

a <- "A"
b <- "a"

if (tolower(a) == b) {
    print("Wow")
} else {
    print("Meoh")
}

pcarray <- c()
i <- 0
find_a_postcode <- function(location) {
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

    pcarray[i] <- post_code
    i <- i + 1
    print("Post Code")
    print(post_code)
    print("Post code type")
    print(typeof(post_code))

    return(post_code)
}

pc <- find_a_postcode("salisbury place")

ar <- c()
ar[1] <- 1
ar[1]

# run for all location in data set.
all_locations <- AllNICrimeData$Location

postcode_array <- c()

array_index <- 1
count_try <- 0
for (location in all_locations) {
    if (count_try > 1) {
        break;
    }

    matched_location <- find_a_postcode(location)

    if (!is.integer(matched_location)) {
        print(matched_location)
        print(typeof(matched_location))

        tryCatch({
            postcode_array[array_index] <- matched_location
            array_index <- array_index + 1
        }, error = function(error_condition) {
            print("Error")
            postcode_array[array_index] <- NA
            array_index <- array_index + 1
        }, warning = function(warning_condition) {
            print("Warning")
            postcode_array[array_index] <- "error"
            array_index <- array_index + 1
        })

        count_try <- count_try + 1
    }
}

# add column
AllNICrimeData$PostCode <- NA

index_count <- 1
for (pc_item in postcode_array) {
    if (pc_item != "error") {
        AllNICrimeData$PostCode[index_count] <- pc_item
    }

    index_count <- index_count + 1
}

write.csv(AllNICrimeData, )