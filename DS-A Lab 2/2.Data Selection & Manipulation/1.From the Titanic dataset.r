titanic <- read.csv(file.choose())
View(titanic)

# Select obly the columns Name, Sex, Age and Survived
View(titanic[c("Name", "Sex", "Age", "Survived")])

# Show passengers older than 50
old_people <- titanic[titanic$Age >50,] # "," after the condition allows to return all the columns for rows
View(old_people[c("Name", "Sex", "Age", "Survived")])

#Count the number of survivors in each passenger class (Pclass)
passengers <- titanic[titanic$Pclass]
count.fields(titanic$Pclass)
