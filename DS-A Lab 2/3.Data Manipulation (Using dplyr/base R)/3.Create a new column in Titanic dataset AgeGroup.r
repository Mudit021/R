df <- read_csv(file.choose())

# Create the new 'AgeGroup' column using mutate() and case_when()
df_with_age_group <- df %>%
  mutate(AgeGroup = case_when(
    Age < 12 ~ "Child",
    Age >= 12 & Age <= 18 ~ "Teen",
    Age >= 19 & Age <= 59 ~ "Adult",
    Age >= 60 ~ "Senior",
    TRUE ~ "Unknown" # for missing age values
  ))

print(df_with_age_group)