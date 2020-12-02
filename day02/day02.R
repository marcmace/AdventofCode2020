library(stringr)
library(data.table)

input <- fread("day02_input.txt", header = F)


count <-0


for(row in 1:nrow(input)) {
  times <- unlist(str_split(input[row]$V1, "-"))
  char <- str_sub(input[row]$V2, 1, -2)
  pwd <- input[row]$V3

  num <- str_count(pwd,char)

  min <- as.integer(times[1])
  max <- as.integer(times[2])


  if(min <= num  && num <= max) count <- count + 1
}
count
