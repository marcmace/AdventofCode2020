input <- readLines(paste(getwd(),"/day06/day06_input.txt", sep=""),)


customs <- list()
total <- 0

for (line in 1:length(input)) {
    if (input[line] != "") {
        qs <- strsplit(input[line],split = "")
        customs <- append(customs, unlist(qs))
        if(line == length(input)) total <- total + length(unique(customs))
    }
    else {

        total <- total + length(unique(customs))
        customs <- list()
    }
    
}

print(total)
