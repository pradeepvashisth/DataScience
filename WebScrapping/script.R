##########################################################

install.packages("rvest")
library(rvest)

# link url
url <- 'https://twitter.com/iwcare?lang=en'

# reading file
web_page <- read_html(url)

# head and str of the tweet data
head(web_page)
str(web_page)

# ranking tweet data
irish_water_html <- html_nodes(web_page, '.tweet-text')
head(irish_water_html, 10)

# let's find out the lengh of the tweet data
length(irish_water_html)

# Ranking the tweet data
tweet_ranking <- html_text(irish_water_html)

# head of the data without html at front
head(tweet_ranking, 10)


# Tidy the decription data to remove the "\n" control character
# using gsub() function. Replaces all matches of a string
# with a string vector of same length

tweet_ranking <- gsub(" #"," :",tweet_ranking)
head(tweet_ranking, 10)

#############



# ranking follower tweet data
follower_name_html <- html_nodes(web_page, '.js-action-profile-avatar')
head(follower_name_html, 10)

# let's find out the lengh of the tweet data
length(follower_name_html)

# Ranking the tweet data
follower_ranking <- html_text(follower_name_html)

# head of the data without html at front
head(follower_ranking, 10)