column_finder <- function (column_names, to_find){

    #find <- to_find + "\\."
    
    result <- grep(to_find, column_names, perl=TRUE, value=TRUE)
}