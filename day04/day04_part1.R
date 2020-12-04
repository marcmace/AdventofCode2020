input <- readLines(paste(getwd(),"/day04_input.txt", sep=""))

#byr (Birth Year)
#iyr (Issue Year)
#eyr (Expiration Year)
#hgt (Height)
#hcl (Hair Color)
#ecl (Eye Color)
#pid (Passport ID)
#cid (Country ID)
fields <- c("byr","iyr","eyr","hgt","hcl","ecl","pid","cid")

passport <- list("cid" = "")
valid <- 0

for (line in seq_along(input)) {
    if (input[line] != "") {
        parts <- strsplit(input[line],split = " ",)
        for(each in 1:length(unlist(parts))){
            n <- strsplit(unlist(parts)[each],split = ":")
            passport[n[[1]][1]] <- n[[1]][2]
        }
    }
    else {
        if (setequal(names(passport),fields)) valid <- valid + 1
        passport <- list("cid" = "")
    }

}
print(valid)
