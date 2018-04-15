
# Setting the country path

#Read in data file and load onto Data_Post data frame

Data_Post <- read.csv("c:/Users/pvashisth/Documents/NIPostcodes.csv", sep = ",", header = T)

# 1. Show the structure and first 10 rows of the dataframe containing all of the NIPostcode data. 
str(Data_Post)

# Show First 10 rows of the data frame
head(Data_Post, n = 10)

# 2. Add a suitable title to each attribute of the data

# data before adding the columns name

summary(Data_Post)

# Create column names for each attribute in the data frame
names(Data_Post) <- c("Organisation_Name", "Sub_building_Name", "Building_Name", "Number", "Primary_Thorfare", "Alt_Thorfare", "Secondary_Thorfare",
    "Locality", "Townland", "Town", "County", "Postcode", "X_Coordinates", "Y_Coordinates", "Primary_Key")

# confirm the change on data frame

head(Data_Post)

# 3. Show the total number and mean missing values of the NIPostcode data. 

# data summary and str of the data frame

summary(Data_Post)

str(Data_Post)

# Total number of records
nrow(Data_Post)

# convert missing values (Blank) to NA

Data_Post[Data_Post == ''] <- NA

# mean missing values of rows

mean(!complete.cases(Data_Post))

# str of the data frame after changes applied

str(Data_Post)


# 4.Remove or replace missing entries with a suitable identifier. 
#Decide whether it is best to remove missing data or to recode it. 


# summary & str of the data frame before changes

summary(Data_Post)
str(Data_Post)

# Missing value sum
data_missing <- Data_Post[!complete.cases(Data_Post),]

nrow(data_missing)

sum(is.na(data_missing))

sapply(data_missing, function(value) sum(is.na(value)))

# str of the data frame after changes applied
str(Data_Post)


# 5. Modify the County attribute to a categorising factor

# summary & str of the data frame before changes

summary(Data_Post)

str(Data_Post)

# using attach function in order to avoid repeating adding the data frame and $
attach(Data_Post)

Data_Post <- Data_Post[order(decreasing = FALSE, County),]

# confirm the change in the dataset

head(Data_Post, n = 10)

# varify how it effect in the strucutre of the data frame
str(Data_Post)


# 6. Align all attributes and relevant data. #

# summary & str of the data frame before changes

summary(Data_Post)

str(Data_Post)

# align all attribute data through sapply function

Data_Post <- rapply(Data_Post, as.character, classes = "factor", how = "replace")
sapply(Data_Post, mode)

# varify how it effect in the strucutre of the data frame
str(Data_Post)

# 7. Move the primary key identifier to the start of the dataset

# summary & str of the data frame before changes

summary(Data_Post)

str(Data_Post)

# load the upated data on to new new_data frame

Data_Post <- subset(Data_Post, select = c(15, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14))

head(Data_Post)

# str of new data

str(Data_Post)

# 8. Create a new dataset called Limavady_data. Store within it only information that has locality, townland and town containing the name “Limavady”. Store this information in an external csv file called Limavady

# summary & str of the data frame before changes

summary(Data_Post)

str(Data_Post)

attach(Data_Post)

Limavady_data <- subset(Data_Post, grepl('LIMAVADY', Locality) & grepl('LIMAVADY', Townland) & grepl('LIMAVADY', Town))

head(Limavady_data)
str(Limavady_data)

write.csv(Limavady_data, file = "Limavady_test.csv", row.names = FALSE)

# reading the file

Limavady <- read.csv("c:/Users/pvashisth/Source/Repos/DataScience/Lab_CA2/Limavady_test.csv", sep = ",", header = T)

# str of the data frame after changes applied

str(Limavady)
head(Limavady)

# 9. Save the modified dataset in a csv file called CleanNIPostcodeData


# summary & str of the data frame before changes

summary(Limavady)

st(Limavady)

#Save the contents of new_data to a csv file called "CleanNIPostcodeData.csv"
write.csv(Limavady, file = "CleanNIPostcodeData.csv", row.names = FALSE)

# reading the file

CleanNIPostcodeData <- read.csv("c:/Users/pvashisth/Source/Repos/DataScience/Lab_CA2/CleanNIPostcodeData.csv", sep = ",", header = T)

# summary & str of the data frame before changes

summary(CleanNIPostcodeData)

str(CleanNIPostcodeData)
