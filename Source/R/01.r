a <- c(1)
b <- c('a')
R2 <- data.frame(a,b)
R2

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# install.packages("ggplot2")
# install.packages("forecast")
library(ggplot2)
library(forecast)
data("AirPassengers")
air_train <- window(AirPassengers, end = 1956+11/12)
air_test  <- window(AirPassengers, start = 1957)
n_test <- length(air_test)
air_model <- auto.arima(air_train)
air_model
air_multi_forecast <- air_model %>%
  forecast(h = n_test)
air_multi_forecast

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# install.packages("ggplot2")
# install.packages("forecast")
Sys.setenv(TZ = "GMT")
library(ggplot2)
library(forecast)
data("AirPassengers")
air_train <- window(AirPassengers, end = 1956+11/12)
air_test  <- window(AirPassengers, start = 1957)
n_test <- length(air_test)
air_model <- auto.arima(air_train)
air_multi_forecast <- air_model %>%
  forecast(h = n_test)
air_multi_forecast %>%
  autoplot()

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

library(ggplot2)
library(forecast)
Sys.setenv(TZ = "GMT")
data("AirPassengers")
air_train <- window(AirPassengers, end = 1956+11/12)
air_test  <- window(AirPassengers, start = 1957)
n_test <- length(air_test)
air_model <- auto.arima(air_train)
air_multi_forecast <- air_model %>%
  forecast(h = n_test)
air_multi_forecast %>%
  autoplot() +
  geom_line(
    aes(
      x = as.numeric(time(air_test)),
      y = as.numeric(air_test)
    ),
    col = "red"
  )
