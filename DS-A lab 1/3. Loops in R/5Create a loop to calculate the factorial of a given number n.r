input <- readline("Input the factorial number:")
n <- as.integer(input)
sum <- 0
if (n > 1) {
    for (i in n : 1){
        sum <-sum + i
        print (sum) # prints sum after each step
    }
} else if (n == 1 || n == 0 ){
    print("The factorial is 1")
} else{
    print("The inout is invalid")
}