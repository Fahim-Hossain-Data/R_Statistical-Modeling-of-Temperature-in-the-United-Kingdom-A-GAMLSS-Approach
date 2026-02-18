

                    ###### ) Data loading
getwd()
setwd("E:/Statistical Modelling and Forecasting/CODE & Outputs")

dta1 <- read.csv("Wthr_Data.csv")
colnames(dta1)
head(dta1)
dim(dta1)



################ (a)	Perform a preliminary analysis on dataset, this usually involves exploratory plots.

dta2 <- subset(dta1, country == "United Kingdom")
dim(dta2)                                
range(dta2$temperature_fahrenheit)

cat("Positive values:", sum(dta2$temperature_fahrenheit > 0), "\n")
cat("Negative values:", sum(dta2$temperature_fahrenheit < 0), "\n")
cat("Zero values    :", sum(dta2$temperature_fahrenheit == 0), "\n")


# Remove rows where temperature_fahrenheit is negative & 0 - those cant predict by numerous models
dta3 <- dta2[dta2$temperature_fahrenheit > 1.0, ]
range(dta3$temperature_fahrenheit)

dta3$country <- NULL
dim(dta3)
head(dta3)

#Missing values
df3 <- na.omit(dta3)
dim(df3)

Row_deleted_missig_values = nrow(df3) - nrow(dta3)
Row_deleted_missig_values

dim(dta1)
dim(dta2)
dim(dta3)
dim(df3)

## Histrogram__ 
hist(df3$temperature_fahrenheit, probability = TRUE, main = "Histogram")
lines(density(df3$temperature_fahrenheit), col = "blue", lwd = 2)


                    

########## (b) Find an appropriate statistical model for the response variable in your data using the explanatory variables. This usually involves selecting: 
	##  1. an appropriate distribution for your response variable and 
	##  2. a selection of relevant explanatory variables to explain the response. 

colnames(df3)
dim(df3)
# Compute Pearson correlation between all explanatory variables and 'temperature_fahrenheit'
correlations <- cor(df3, use = "complete.obs", method = "pearson")[ , "temperature_fahrenheit"]
# Sort by absolute correlation strength (highest first)
sorted_cor <- sort(abs(correlations), decreasing = TRUE)

# Display the sorted correlations
sorted_cor

####  Create df4 with Best 3 and Lowest 2 Correlated Variables:
# Select the best 3 and lowest 2 correlations (excluding 'temperature_celsius' itself)
best_3 <- names(sorted_cor[2:4])  # Best 3
best_3
lowest_2 <- names(sorted_cor[(length(sorted_cor)-1):length(sorted_cor)])  # Lowest 2
lowest_2

# Combine the selected variables with the response variable 'temperature_celsius'
selected_vars <- c("temperature_fahrenheit", best_3, lowest_2)

# Create new dataframe df5
df4 <- df3[ , selected_vars]
head(df4)
dim(df4)
colnames(df4)

# Write to CSV file
write.csv(df4, file = "Weather_3+2var.csv", row.names = FALSE)

colnames(df4)

### check data is normal or not ? 
hist(df4$temperature_fahrenheit, probability = TRUE, main = "Histogram with Normal Curve")
lines(density(df4$temperature_fahrenheit), col = "blue", lwd = 2)


 
                                                                        ############# MODEL ##########

                  #========== the chooseDist function =============#

# Load required libraries
library(gamlss)
library(gamlss.dist)
library(gamlss.ggplots)

# Define response and predictors
# Response: temperature_fahrenheit
# Predictors: uv_index, air_quality_Ozone, humidity, moon_illumination, cloud

# Histogram and distribution check
histDist(df5$temperature_fahrenheit)

# Fit a Normal distribution model
mNO <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, 
              data = df5, family = NO)
plot(mNO)
wp(mNO)

# Fit a Gamma distribution model
mGA <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, 
              data = df5, family = GA)

# Compare models using GAIC
GAIC(mNO, mGA)

# Residual and worm plots
resid_plots(mNO)
wp(mNO)

# Try selecting best distribution
install.packages("pacman")
library(pacman)
D1 <- chooseDist(mNO, type = "realplus", parallel = "snow", ncpus = 9)
print(D1)
dim(D1)

# Fit various distributions
mEXP      <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = EXP)
mGA       <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = GA)
mIG       <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = IG)
mLOGNO    <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = LOGNO)
mLOGNO2   <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = LOGNO2)
mWEI      <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = WEI)
mWEI2     <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = WEI2)
mWEI3     <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = WEI3)
mIGAMMA   <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = IGAMMA)
mPARETO2  <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = PARETO2)
mPARETO2o <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = PARETO2o)
mGP       <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = GP)
mBCCG     <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = BCCG)
mBCCGo    <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = BCCGo)
mexGAUS   <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = exGAUS)
mGG       <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = GG)
mGIG      <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = GIG)
mLNO      <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = LNO)
mBCTo     <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = BCTo)
mBCT      <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = BCT)
mBCPEo    <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = BCPEo)
mBCPE     <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = BCPE)
mGB2      <- gamlss(temperature_fahrenheit ~ uv_index + air_quality_Ozone + humidity + moon_illumination + cloud, data = df5, family = GB2)



# Extract AIC for each model
aic_values <- c(
  AIC(mEXP), AIC(mGA), AIC(mIG), AIC(mLOGNO), AIC(mLOGNO2), AIC(mWEI),
  AIC(mWEI2), AIC(mWEI3), AIC(mIGAMMA), AIC(mPARETO2), AIC(mPARETO2o),
  AIC(mGP), AIC(mBCCG), AIC(mBCCGo), AIC(mexGAUS), AIC(mGG), AIC(mGIG),
  AIC(mLNO), AIC(mBCTo), AIC(mBCT), AIC(mBCPEo), AIC(mBCPE), AIC(mGB2)
)
# Store the model names
model_names <- c(
  "EXP", "GA", "IG", "LOGNO", "LOGNO2", "WEI", "WEI2", "WEI3", "IGAMMA",
  "PARETO2", "PARETO2o", "GP", "BCCG", "BCCGo", "exGAUS", "GG", "GIG", "LNO",
  "BCTo", "BCT", "BCPEo", "BCPE", "GB2"
)
# Create a data frame to compare AIC values
aic_comparison <- data.frame(Model = model_names, AIC = aic_values)
# Find the best model (lowest AIC)
best_model <- aic_comparison[which.min(aic_comparison$AIC), ]
# Display the results
print(aic_comparison)
print(paste("Best model based on minimum AIC:", best_model$Model, "with AIC =", best_model$AIC))


################ (c) Use diagnostics to check the assumptions of the model.
plot(mexGAUS)
wp(mexGAUS)
resid_plots(mexGAUS)


                                              ################ MODEL PREDICTION #############

###################  	(d) Use the model for prediction.
colnames(df5)
dim(df5)

newdt <- data.frame(
  uv_index = c(5.0, 6.0, 0.4, 0.3, 0.4, 1.3, 2.9),
  air_quality_Ozone = c(78.7, 93.0, 6.0, 6.0, 30.0, 49.0, 69.0),
  humidity = c(42, 53, 88, 87, 100, 93, 59),
  moon_illumination = c(5, 54, 91, 8, 39, 100, 33),
  cloud = c(0, 50, 100, 50, 50, 75, 25)
)

# Predict mean temperature
predictions <- predict(mexGAUS, newdata = newdt, type = "response")

# Convert to data frame with predictions
results <- data.frame(
  newdt,
  predicted_temperature = predictions
)

# View results
print(results)

##########################################





