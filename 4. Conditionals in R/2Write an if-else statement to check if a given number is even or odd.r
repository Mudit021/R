n <- readline("Enter the number: ")
num <- as.integer(n)
if(num %% 2 == 0){
    print("The entered number is even.")
}else if (num == 0){
    print("The number is 0.")
}else {
    print("The number is odd.")
}
