library(readxl)
library(dplyr)
library(ggplot2)
library(caret)
db1 <- read_excel("House Price India.xlsx")

##Cleaning Data
db1%>%
  complete.cases()%>%
  mean()

pre_data <- db1%>%
  select(Price, "grade of the house", "number of bedrooms", "number of views")
pre_data$Price <- log(pre_data$Price)

## plot histogram
ggplot(pre_data, aes(Price))+
  geom_histogram(bins = 15)

##1.splite data 80/20
split_data <- function(pre_data) {
  set.seed(2)
  n <- nrow(pre_data)
  train_id <- sample(1:n, size = 0.8*n)
  train_df <- pre_data[train_id, ]
  test_df <- pre_data[-train_id, ]
  # return
  list(training = train_df, 
       testing = test_df) 
}

prep_data <- split_data(pre_data)
train_df <- prep_data[[1]]
test_df <- prep_data[[2]]

# 2. train model
set.seed(23)
lm_model <- train(Price ~ .,
                  data = train_df,
                  # ML algorithm
                  method = "lm")

lm_model
varImp(lm_model)

# 3. score model
p <- predict(lm_model, newdata=test_df)
head(p, 10)
# 4. evaluate model
# mean absolute error
(mae <- mean(abs(p - test_df$Price)))

# root mean square error
(rmse <- sqrt(mean((p - test_df$Price)**2)))
