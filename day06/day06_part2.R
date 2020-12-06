input <- readLines(paste(getwd(),"/day06/day06_input.txt", sep=""),)

customs <- list()
total <- 0
first <- TRUE

for (line in seq_along(input)) {
    if (input[line] != "") {
        qs <- strsplit(input[line],split = "")
        if (first) {
            customs <- append(customs, unlist(qs))
            first <- FALSE
        } else customs <- intersect(customs, unlist(qs))
        if(line == length(input)) total <- total + length(customs)
    }
    else {
        total <- total + length(customs)
        customs <- list()
        first <- TRUE
    }
}

print(total)
