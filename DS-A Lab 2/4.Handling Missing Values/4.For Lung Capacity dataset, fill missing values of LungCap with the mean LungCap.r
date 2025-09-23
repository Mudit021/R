library(dplyr)
library(readr)
library(tidyr)

df <- read_csv(file.choose())

df_imputed <- df %>%
  mutate(across(where(is.numeric), ~replace_na(., mean(., na.rm = TRUE))))

summary(df_imputed)
