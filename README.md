# 📈  Statistical Modeling of Temperature in the United Kingdom: A GAMLSS Approach


## 📋 Project Overview

This project performs **statistical modeling and prediction of temperature patterns** in the United Kingdom using atmospheric and environmental variables. The analysis identifies key temperature predictors and develops a robust predictive model using **Generalized Additive Models for Location, Scale, and Shape (GAMLSS)** framework.

---

## 📊 (a) Perform a preliminary analysis of the dataset, this usually involves exploratory plots.

### 📝 Data Extraction & Summary

A subset of data specific to the United Kingdom was extracted from the **Wthr_data** dataset.

<div align="center">

| 📊 Metric | 🔢 Value |
|-----------|----------|
| **Observations** | 358 |
| **Variables** | 18 |
| **Missing Values** | 0 |
| **Response Variable** | Temperature (°F) |
| **Temperature Range** | 28.6°F - 91.0°F |

</div>

> ℹ️ **Note**: The response variable is temperature (°F), ranging from 28.6°F to 91.0°F, indicating substantial variability in weather conditions. All explanatory variables are numeric.

### 📈 Histogram Interpretation

The distribution shows a prominent peak between **50°F and 55°F**, indicating that most temperature values fall within this range.

- ⚫ **Black line** → Kernel density estimate (smoothed distribution)
- 🔴 **Red dashed line** → Normal distribution comparison

<p align="center">
  <img src="https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/e9e62b7fa22f008540f8cb41fdc3586119e32e1f/histogram.png" alt="Histogram" width="600"/>
  <br>
  <em>Figure: Histogram for Temperature (°F) variable distribution</em>
</p>

---

## 🎯 (b) Find an appropriate statistical model for the response variable in your data using the explanatory variables.


<details>
<summary><b>📋 This section consists of two parts:</b></summary>
<br>

1. **Selecting an appropriate distribution** for the response variable
2. **Selecting relevant explanatory variables** to explain the response

</details>

### 1️⃣ Correlation Analysis between Explanatory Variables and the Response Variable

The dataset contains **18 variables** in total, of which **17 are considered explanatory variables**. Initially, the correlation between each explanatory variable and the response variable (temperature) will be examined.

#### 🎯 Variable Selection Strategy

To reduce overfitting, variables were selected based on correlation strength:

<div align="center">

| 🔥 Strongest Correlations | 🌙 Weakest Correlations |
|---------------------------|------------------------|
| ✅ `uv_index` | ✅ `moon_illumination` |
| ✅ `air_quality_Ozone` | ✅ `cloud` |
| ✅ `humidity` | |

</div>

#### 📦 Final Modeling Dataset:

<div align="center">

| Variable Type | Count |
|---------------|-------|
| **Explanatory Variables** | 5 |
| **Response Variable** | 1 (temperature) |

</div>

The correlation between the response variable and all explanatory variables is shown below:

<p align="center">
  <img src="https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/885fdac2e490547adb080a5fff23949279277a54/Correlation.png" alt="Correlation Analysis" width="600"/>
  <br>
  <em>Figure: Correlation between response variable and all explanatory variables</em>
</p>

### 2️⃣ Choosing appropriate distribution for the response variable

#### 📚 R Libraries Used:
library(gamlss)
library(gamlss.ggplot)
library(pacman)

The chooseDist() function identified 23 candidate distributions.
Based on AIC minimization, the best-fitting model was:

✅ Exponential Gaussian (exGAUS)

AIC: 2296.227

<p align="center">
  <img src="https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/19381b7126905bda11fb008de64c607dfab7280b/Model_AIC.png"  width="600"/>
  <br>
  <em>Figure: AIC values of all Models</em>
</p>


### 🧪 (c) Use diagnostics to check the assumptions of the model.
 Model assumptions were evaluated using a worm plot.

📝 Interpretation

* Residuals lie mostly within the 95% confidence bands

* No major deviations from normality

* Indicates good model fit

<p align="center">
  <img src="https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/810104434b5491457e24b75f2ad2739787521c14/Worm-Plot_exGAUS.png" width="600"/>
  <br>
  <em>Figure: worm plot of exGAUS model</em>
</p>



### 🔮 (d) Use the model for prediction.

📝 Prediction
A new dataset (newdt) containing 7 observations was created using the five selected predictors.

Steps:

* Construct new input data

* Apply predict() using the fitted GAMLSS model

* Store predictions in predicted_temperature

<p align="center">
  <img src="https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/810104434b5491457e24b75f2ad2739787521c14/NewDataCreate.png" width="600"/>
  <br>
  <em>Figure: created new data (newdt) </em>
</p>


<p align="center">
  <img src="https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/810104434b5491457e24b75f2ad2739787521c14/Pred_nw_data.png" width="600"/>
  <br>
  <em>Figure: predicted response values based on new data</em>
</p>


<div align="center">
  
**[⬆ Back to Top](#-supply-chain-insights-product-performance-brand-value-supplier-trends)**

</div>




	

