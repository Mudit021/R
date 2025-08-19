rows <- readline("Enter the size of the patter: ")
n1 <- as.integer(rows)

for (i in 1: n1){
    for (j in 1 : i){
        print("* ")
    }
    print("/n")
}
