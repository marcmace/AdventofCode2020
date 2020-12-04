library(dplyr)

input <- readLines(paste(getwd(),"/day03/day03_input.txt",sep=""))
geo <- transpose(as.data.frame(strsplit(x = input, split = "")))

day3 <- function(colmove, rowmove) {

    trees <- 0
    i <- 1
    j <- 1

    while (i <= nrow(geo)) {
        if (geo[i,j]== "#") {
            trees <- trees + 1
#            geo[i,j] <- "X"
        }
#        else geo[i,j] <- "O"
        i <- i + rowmove
        j <- (j + colmove - 1) %% ncol(geo) + 1
    }

    return (trees)
}
