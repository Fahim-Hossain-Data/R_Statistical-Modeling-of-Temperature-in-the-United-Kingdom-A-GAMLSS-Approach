## R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach
This project focuses on statistical modeling and prediction of temperature in the United Kingdom using atmospheric and environmental variables.

### (a)	Perform a preliminary analysis on your data, this usually involves exploratory plots.
As the first step in the analysis, a subset of data specific to the United Kingdom was extracted from the “Wthr_data” dataset.  The resulting dataset consists of 358 data points and 18 variables, 
with no missing values. Now, the response variable in this analysis is temperature, measured in Fahrenheit (temperature_fahrenheit). The temperature values in the dataset range from 28.6°F to 91.0°F, 
indicating a broad variation in weather conditions across the recorded observations. All other variables in the dataset, which serve as explanatory variables, are numeric. In the histogram (Figure-3.1), 
the x-axis represents temperature in degrees Fahrenheit (°F), while the y-axis shows the density, interpreted as probability. The distribution exhibits a prominent peak between 50°F and 55°F, indicating 
that most temperature values fall within this range. The black line represents the kernel density estimate, which provides a smoothed version of the data distribution. The red dashed line shows the normal 
distribution curve based on the sample mean and standard deviation, allowing for comparison between the observed and theoretical distributions.

![Histrogram](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/e9e62b7fa22f008540f8cb41fdc3586119e32e1f/histogram.png)

### (b) Find an appropriate statistical model for the response variable in your data using the explanatory variables. This usually involves selecting: 
  1. an appropriate distribution for your response variable and 
  2. a selection of relevant explanatory variables to explain the response.

This section consists of two parts: first, the explanatory variables are selected based on their correlation with the response variable; then, the best model is identified to fit the data.

1. Correlation Analysis between Explanatory Variables and the Response Variable
The dataset contains 18 variables in total, of which 17 are considered explanatory variables. Initially, the correlation between each explanatory variable and the response variable (temperature) will be examined.
To avoid overfitting, three variables with the strongest correlation to temperature, namely uv_index, air_quality_Ozone, and humidity, are selected. Additionally, two variables with the weakest correlation, moon_illumination and cloud, are also chosen to observe their influence on the model. As a result, the new dataset includes five explanatory variables and one response variable, while the number of observations remains unchanged.  
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




	

