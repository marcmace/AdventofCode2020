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
            curr <- n[[1]][1]
            val <- n[[1]][2]
            result <- switch(curr,
                "byr" = grepl("^[[:digit:]]{4}$",val) && val >= 1920 && val <= 2002,
                "iyr" = grepl("^[[:digit:]]{4}$",val) && val >= 2010 && val <= 2020,
                "eyr" = grepl("^[[:digit:]]{4}$",val) && val >= 2020 && val <= 2030,
                "hgt" = (grepl("^([[:digit:]]{3})cm$",val) && (substr(val,1,3) >= 150 || substr(val,1,3) >= 193)) ||
                            (grepl("^([[:digit:]]{2})in$",val) && (substr(val,1,2) >= 59 || substr(val,1,2) >= 76)),
                "hcl" = grepl("^#[0-9a-f]{6}$",val),
                "ecl" = val %in% c("amb","blu","brn","gry","grn","hzl","oth"),
                "pid" = grepl("^[[:digit:]]{9}$", val),
                "cid" = TRUE)
            if(result) passport[curr] <- val
        }
    }
    else {
        if (setequal(names(passport),fields)) valid <- valid + 1
        passport <- list("cid" = "")
    }

}

print(valid)
