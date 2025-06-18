library(caret) library(ggplot2) library(class)
heart_data <- read.csv("C:/Users/keshav	Kumar/OneDrive/Documents/heart.csv")
# Checking the structure and summary of the dataset
str(heart_data)
summary(heart_data)
# Convert target variable to factor
heart_data$target <- factor(heart_data$target, levels = c(0, 1))

# Splitting the data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(heart_data$target, p = 0.7, list = FALSE) trainData <- heart_data[trainIndex, ]
testData <- heart_data[-trainIndex, ]
# Train models
logistic_model <- train(target ~ ., data = trainData, method = "glm", family = "binomial") knn_model <- train(target ~ ., data = trainData, method = "knn")
decision_tree_model <- train(target ~ ., data = trainData, method = "rpart") random_forest_model <- train(target ~ ., data = trainData, method = "rf") svm_model <- train(target ~ ., data = trainData, method = "svmRadial")

# Function to evaluate models and plot confusion matrix evaluate_model <- function(model, testData, model_name) {
predictions <- predict(model, testData)
accuracy <- mean(predictions == testData$target)

# Convert accuracy to percentage accuracy_percent <- round(accuracy * 100, 2)
# Confusion Matrix
conf_matrix <- confusionMatrix(predictions, testData$target) cat("Model:", model_name, "Accuracy:", accuracy_percent, "%\n")
# Plot confusion matrix
conf_matrix_df <- as.data.frame(conf_matrix$table)
p <- ggplot(conf_matrix_df, aes(x = Prediction, y = Reference)) +
  geom_tile(aes(fill = Freq)) +
  geom_text(aes(label = Freq), vjust = 1) + scale_fill_gradient(low = "white", high = "blue") + labs(title = paste("Confusion Matrix -", model_name)) + theme_minimal()
print(p)

return(accuracy_percent)
}

# Evaluate models and get accuracies in percentage
logistic_acc <- evaluate_model(logistic_model, testData, "Logistic Regression") knn_acc <- evaluate_model(knn_model, testData, "KNN")
decision_tree_acc <- evaluate_model(decision_tree_model, testData, "Decision Tree") random_forest_acc <- evaluate_model(random_forest_model, testData, "Random Forest") svm_acc <- evaluate_model(svm_model, testData, "SVM")
# Accuracy comparison accuracy_df <- data.frame(
Model = c("Logistic Regression", "KNN", "Decision Tree", "Random Forest", "SVM"),
Accuracy = c(logistic_acc, knn_acc, decision_tree_acc, random_forest_acc, svm_acc)
)

# Print accuracy comparison print(accuracy_df)

# Plot accuracy comparison with accuracy percentages displayed on bars ggplot(accuracy_df, aes(x = Model, y = Accuracy, fill = Model)) +
geom_bar(stat = "identity") + ylim(0, 100) +
  ggtitle("Model Accuracy Comparison") + xlab("Classification Model") + ylab("Accuracy (%)") +
  geom_text(aes(label = paste(Accuracy, "%")), vjust = -0.5, size = 5) + # Add accuracy labels on bars
  theme_minimal()
