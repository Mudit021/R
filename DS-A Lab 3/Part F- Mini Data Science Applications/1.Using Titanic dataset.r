titanic <- read.csv(file.choose())
titanic <- na.omit(titanic[, c("Survived", "Age", "Sex", "Pclass")])
titanic$Sex <- factor(titanic$Sex)
titanic$Pclass <- factor(titanic$Pclass)

model <- glm(Survived ~ Age + Sex + Pclass, data = titanic, family = binomial)

summary(model)

exp(coef(model))