# ❤️ Heart Disease Prediction with Machine Learning (in R)

Hi! This is a small project I worked on to predict whether a person might have heart disease based on their health data.

I used **machine learning models** like:
- Logistic Regression
- K-Nearest Neighbors (KNN)
- Decision Tree
- Random Forest
- Support Vector Machine (SVM)

It’s all done using **R language** and a public dataset that has information like age, cholesterol, blood pressure, etc.

---

## 🧠 What I Did

- Loaded the dataset and cleaned it up a bit.
- Trained all the models listed above.
- Checked which one performs best (SVM gave the highest accuracy).
- Visualized the accuracy of each model to compare them.

---

## 📊 Dataset Info

The dataset is public and available on sites like **Kaggle** or **UCI ML Repository**. It includes columns like:

- Age
- Sex
- Chest pain type
- Resting blood pressure
- Cholesterol
- Fasting blood sugar
- Max heart rate
- ...and more!

The goal is to predict the `target` column — which is either `0` (no heart disease) or `1` (heart disease present).

---

## 🔧 How to Run It

1. Open the `.R` file in **RStudio** or any R environment.
2. Make sure these packages are installed:
   ```R
   install.packages("caret")
   install.packages("ggplot2")
   install.packages("class")
