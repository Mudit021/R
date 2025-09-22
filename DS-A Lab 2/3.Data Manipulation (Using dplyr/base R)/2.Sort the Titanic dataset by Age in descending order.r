df <- read.csv(file.choose())

df_sorted <- df %>% arrange(desc(Age))

print(head(df_sorted))
