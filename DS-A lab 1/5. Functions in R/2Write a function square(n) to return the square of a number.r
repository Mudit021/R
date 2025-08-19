sq <- function(a){
    print(a^2) # way 1
    print(a*a) # way 2
    print(a**2) # way 3
}

n <- readline("Enter the number: ")
num <- as.integer(n)
sq(num)
