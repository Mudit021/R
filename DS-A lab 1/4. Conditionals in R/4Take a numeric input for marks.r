n <- readlines("Enter total marks: ")
marks <- as.integer(n)

if (marks >= 40){
    print("Pass")#“Pass” if marks >= 40
}else{
    print("failed")
}#“Fail” otherwise