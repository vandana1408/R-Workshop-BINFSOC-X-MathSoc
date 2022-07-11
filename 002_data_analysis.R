# ================
# Data frames in R
# ================
data = read.csv('/Users/noahrubin/Desktop/R_Workshop/dataset.csv')

# Basics
names(data)              # column names
dim(data)                # rows and columns
head(data)               # display first 6 rows
View(head(data))         # view results in a new tab
str(data)                # tells us the datatype of each column
duplicated(data)         # Indicates duplicates.
is.na(data)              # Missing rows


# What can square brackets do when dealing with dataframes?

# 1. Selecting columns
data[, c('Sales', 'Advertising')]

# 2. Selecting rows
data[c(4, 71, 154), c('Population', 'Age')]

# 3. Filtering data

# Q: Find all all rows ShelveLoc takes on the value `Bad` (or `bad`)
# Answer:
data[tolower(data$ShelveLoc) == 'bad', ]

# Q: Find all values where age = 55 OR education = 10
# Answer:
data[(data$Age == 55) | (data$Education == 10),  c('Age', 'Education')]


# 3. Identifying and dropping duplicated data
data[duplicated(data), ]
data = data[!duplicated(data), ]  # delete duplicates

# 4. Searching and dropping missing values (take a look into complete.cases(data) as well)
data = data[!rowSums(is.na(data)) > 0, ]

# =====
# Dplyr
# =====
install.packages('tidyverse')
library(tidyverse)

data %>% select(Sales, Advertising)                     # selecting columns
data %>% filter(Age < 26) %>% select(Age, Education)    # filter rows and select

data %>% group_by(ShelveLoc) %>% summarise(mean_age = mean(Age))

# Create new columns based off existing ones
data = data %>% mutate(log_sales=log(Sales), sqrt_income=sqrt(Income))  

# ==================
# Data Visualisation
# ==================

# Univariate anlalysis: Categorical (count plot)
barplot(table(data$ShelveLoc), 
        col='green', 
        main='Count Plot', 
        ylab='Count')

# Univariate analysis: Numeric (box plot)
boxplot(data$Population, 
        col='cyan', 
        main='Boxplot of the Population Variable')

# Bivariate analysis: Categorical vs Numeric
boxplot(data$Income ~ data$Urban, 
        main='Boxplot by Category', 
        xlab='Category', 
        ylab='Income', 
        col=c('red', 'green'))

# Bivariate analysis: Numeric vs Numeric

# Import a toy dataset called mtcars
data(mtcars)

# Boring
plot(mtcars$wt, mtcars$disp)

mtcars %>% ggplot(aes(x=wt, y=disp, color=cyl)) + geom_point()
































