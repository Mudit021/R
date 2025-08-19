n <- readline("Enter the number: ")
num <- as.integer(n)
for (i in 2 : sqrt(num)){
    if (num %% i == 0){
        print(paste("Not prime...."))
        
    }
    print("Prime number......")
    break()
}

