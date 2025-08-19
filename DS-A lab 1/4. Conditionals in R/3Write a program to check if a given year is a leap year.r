n <- readline("Enter the year: ")
year <- as.integer(n)
if (year %% 4 == 0){
    print("The entered year is a leap year.")
} else {
    print("The year is not a leap year.")
}

