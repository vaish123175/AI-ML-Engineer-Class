# Exploratory Data Analysis (EDA)

## What is EDA?

**Exploratory Data Analysis (EDA)** is the process of understanding, exploring, and analyzing a dataset before building a Machine Learning model.

The main goal of EDA is to:
- Understand the dataset.
- Identify patterns and relationships.
- Detect missing values and outliers.
- Understand the features.
- Prepare the data for model building.

A well-performed EDA improves the accuracy and performance of Machine Learning models.

---

# Steps in Exploratory Data Analysis (EDA)

## Step 1: Load the Dataset

The first step is to load the dataset into Python using libraries such as **Pandas**.

Common file formats include:
- CSV
- Excel
- SQL Database
- JSON

After loading the dataset, verify that it has been imported correctly.

---

## Step 2: View the Dataset

Use the following functions to inspect the dataset.

### `head()`

Displays the first five rows of the dataset by default.

Purpose:
- View the input features.
- View the output (target) variable.
- Understand the structure of the dataset.
- Verify that the data has loaded correctly.

Example:

```python
df.head()
```

---

### `tail()`

Displays the last five rows of the dataset.

Example:

```python
df.tail()
```

---

## Step 3: Understand the Features

Features are the input variables used to train a Machine Learning model.

Example:

| Age | Salary | Experience | Purchased |
|------|---------|------------|------------|
|25|50000|2|Yes|

Features:
- Age
- Salary
- Experience

Target Variable:
- Purchased

Understanding the features helps determine:
- Which variables are useful.
- Which variables should be removed.
- Which variables need preprocessing.

---

## Step 4: Identify Patterns in the Data

Analyze the dataset to identify:
- Trends
- Relationships
- Correlations
- Unusual values
- Outliers

Pattern identification helps improve feature selection and model performance.

Example:
- Higher salary may be associated with more years of experience.
- Sales may increase during holiday seasons.

---

## Step 5: Check for Multicollinearity

### What is Multicollinearity?

Multicollinearity occurs when two or more independent variables are highly correlated with each other.

Highly correlated features provide nearly the same information to the model.

Example:

| Height (cm) | Height (inches) |
|-------------|-----------------|
|170|66.9|
|180|70.9|

Both columns represent the same information.

Problems caused by multicollinearity:
- Reduces model interpretability.
- Makes coefficient estimates unstable.
- Can decrease model performance.

Common methods to detect multicollinearity:
- Correlation Matrix
- Variance Inflation Factor (VIF)

---

## Step 6: Check for Missing (Null) Values

Missing values are represented as:

- NaN (Not a Number)
- Null
- None

Before training a model, identify how many missing values exist in each column.

Example:

| Name | Age |
|------|-----|
|John|25|
|Sara|NaN|
|Mike|30|

Missing values can affect model accuracy.

---

## Step 7: Handle Missing Values

Several techniques can be used to replace missing values.

### Replace with Mean

Best for:
- Numerical data
- Normally distributed data

Example:

Original values:

```text
10 20 NaN 40 50
```

Mean:

```text
(10 + 20 + 40 + 50) / 4 = 30
```

Replace NaN with:

```text
30
```

---

### Replace with Median

Best for:
- Numerical data containing outliers.
- Skewed distributions.

Example:

```text
10 15 NaN 20 500
```

Median:

```text
17.5
```

Replace NaN with:

```text
17.5
```

---

### Replace with Mode

Best for:
- Categorical data.

Example:

| Color |
|--------|
|Red|
|Blue|
|Red|
|NaN|

Mode:

```text
Red
```

Replace NaN with:

```text
Red
```

---

## Step 8: Check the Skewness of the Data

### What is Skewness?

Skewness measures how symmetrical or asymmetrical a dataset is.

Types:

### Symmetrical Distribution

- Mean = Median = Mode
- Skewness = 0

---

### Positive Skew

The tail extends toward the right.

Mean > Median

---

### Negative Skew

The tail extends toward the left.

Mean < Median

---

## Why is Skewness Important?

Skewness helps determine which method should be used to replace missing values.

| Distribution | Recommended Replacement |
|--------------|-------------------------|
| Symmetrical | Mean |
| Skewed | Median |

Reason:

The mean is heavily affected by outliers, whereas the median is more robust.

---

# Data Cleaning Before Model Building

Before training a Machine Learning model, perform the following steps:

- Load the dataset.
- Understand the features.
- Explore the data.
- Detect patterns.
- Check for multicollinearity.
- Find missing values.
- Replace missing values.
- Handle outliers.
- Check skewness.
- Prepare the cleaned dataset.

Once these preprocessing steps are complete, the dataset is ready for **feature engineering** and **model building**.
