## R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach
This project focuses on statistical modeling and prediction of temperature in the United Kingdom using atmospheric and environmental variables.

### (a)	Perform a preliminary analysis on your data, this usually involves exploratory plots.
As the first step in the analysis, a subset of data specific to the United Kingdom was extracted from the “Wthr_data” dataset.  The resulting dataset consists of 358 data points and 18 variables, 
with no missing values. Now, the response variable in this analysis is temperature, measured in Fahrenheit (temperature_fahrenheit). The temperature values in the dataset range from 28.6°F to 91.0°F, 
indicating a broad variation in weather conditions across the recorded observations. All other variables in the dataset, which serve as explanatory variables, are numeric. In the histogram (Figure-3.1), 
the x-axis represents temperature in degrees Fahrenheit (°F), while the y-axis shows the density, interpreted as probability. The distribution exhibits a prominent peak between 50°F and 55°F, indicating 
that most temperature values fall within this range. The black line represents the kernel density estimate, which provides a smoothed version of the data distribution. The red dashed line shows the normal 
distribution curve based on the sample mean and standard deviation, allowing for comparison between the observed and theoretical distributions.

![Histrogram](https://github.com/Fahim0729/R_Statistical-Modeling-of-Temperature-in-the-United-Kingdom-A-GAMLSS-Approach/blob/81c13eab0a070b91b1dd55bca06261a9333fb21a/Hist.png)
