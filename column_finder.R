column_finder <- function (column_names, toFind){

    #find <- to_find + "\\."
    
    result <- grep(toFind, column_names, perl=TRUE, value=TRUE)
}