#step one import the data before the next step.
Data = Titanic.Dataset

# Load the dataset
data <- Data

# Data preprocessing
# Drop irrelevant columns
data <- data[, -c(1, 4, 9, 11)]

# Handle missing values
data$Age[is.na(data$Age)] <- median(data$Age, na.rm = TRUE)
data$Embarked[is.na(data$Embarked)] <- "S"

# Encode categorical variables
data$Sex <- as.factor(data$Sex)
data$Embarked <- as.factor(data$Embarked)
data$Survived <- as.factor(data$Survived)  # Convert Survived to factor

# Split the data into training and testing sets
set.seed(123) # for reproducibility
train_index <- sample(1:nrow(data), 0.7 * nrow(data))
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Model building
model <- randomForest(Survived ~ ., data = train_data)

# Model evaluation
predictions <- predict(model, test_data)
accuracy <- mean(predictions == test_data$Survived)

print(paste("Accuracy:", accuracy))

##The accuracy value printed at the end ("Accuracy: 0.843283582089552") suggests
#that your model achieved an accuracy of approximately 84.33% on the testing data. 
#This means that around 84.33% of the predictions made by your model matched the 
#actual values in the testing dataset.

#**CONCLUSION SUMMARY:
#*Data Prep: We cleaned up the data, making sure it's ready for analysis.
#*Model Build: We trained a model using the cleaned data.
#*Model Eval: The model predicted survival with about 84.33% accuracy.
#*Interpretation: This means our model was right about survival 84.33% of the time.
#* It's a good start, but we might want to dig deeper to improve it further.
#* 
