## R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach
This project performs statistical modeling and prediction of temperature patterns in the United Kingdom using atmospheric and environmental variables. The analysis identifies key temperature predictors and develops a robust predictive model using Generalized Additive Models for Location, Scale, and Shape (GAMLSS) framework.

### 📊 (a)	Perform a preliminary analysis on your data, this usually involves exploratory plots.

📝 A subset of data specific to the United Kingdom was extracted from the Wthr_data dataset.
The resulting dataset contains:

358 observations

18 variables

No missing values

The response variable is temperature (°F), ranging from 28.6°F to 91.0°F, indicating substantial variability in weather conditions. All explanatory variables are numeric.

Histogram Interpretation

The distribution shows a peak between 50°F and 55°F

Black line → Kernel density estimate (smoothed distribution)

Red dashed line → Normal distribution comparison

![Histrogram](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/e9e62b7fa22f008540f8cb41fdc3586119e32e1f/histogram.png)

### (b) Find an appropriate statistical model for the response variable in your data using the explanatory variables. This usually involves selecting: 
  1. an appropriate distribution for your response variable and 
  2. a selection of relevant explanatory variables to explain the response.

This section consists of two parts: first, the explanatory variables are selected based on their correlation with the response variable; then, the best model is identified to fit the data.

1. Correlation Analysis between Explanatory Variables and the Response Variable
The dataset contains 18 variables in total, of which 17 are considered explanatory variables. Initially, the correlation between each explanatory variable and the response variable (temperature) will be examined.
The dataset contains 17 explanatory variables.
To reduce overfitting:

Strongest correlations selected:

uv_index

air_quality_Ozone

humidity

Weak correlations included for comparison:

moon_illumination

cloud

Final modeling dataset:

5 explanatory variables

1 response variable (temperature)
The correlation between the response variable and all explanatory variables is shown in Figure-3.3.

![Correlation](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/885fdac2e490547adb080a5fff23949279277a54/Correlation.png)

2. Choosing appropriate distribution for the response variable
First, the required libraries (gamlss, gamlss.ggplot, and pacman) are loaded. Then, the chooseDist function is used to determine which distributions can be applied to the data. A total of 23 distributions are found to be suitable for the dataset (Figure-3.10). Based on the AIC value of 2296.227, the exGaus (exponentially modified Gaussian) distribution is selected as the best model (Figure-3.11).

![Model_AIC](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/19381b7126905bda11fb008de64c607dfab7280b/Model_AIC.png)

### (c) Use diagnostics to check the assumptions of the model.
In the worm plot (Figure-3.13), the binned standardized residual points fall mostly within the 95% confidence bands, suggesting no major deviations from normality and confirming that the model provides a good fit to the data. 

![Worm_plot](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/810104434b5491457e24b75f2ad2739787521c14/Worm-Plot_exGAUS.png)


### (d) Use the model for prediction.
To make predictions, a new dataset named newdt was created, containing 7 data points with values for the five selected explanatory variables (Figure-3.15). The predict() function was then used to generate the corresponding temperature predictions, which were stored in a new column titled predicted_temperature (Figure-3.16).

![Create_nw_data](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/810104434b5491457e24b75f2ad2739787521c14/NewDataCreate.png)

![Pred|_nw_data](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/810104434b5491457e24b75f2ad2739787521c14/Pred_nw_data.png)




	

