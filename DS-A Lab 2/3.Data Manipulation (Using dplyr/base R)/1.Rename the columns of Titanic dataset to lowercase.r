df <- read.csv(file.choose())
print(colnames(df))
colnames(df) <- tolower(colnames(df))
print(colnames(df))
