#install.packages("data.table")
library(data.table)
library(purrr)


dayone <- fread("day01_input.txt")
product = 0

# Sum of 2 numbers

filter2 <- function(x,y) x+y != 2020
pairs <- cross2(dayone$V1, dayone$V1, .filter = filter2)

for(i in seq_along(pairs)) {
    pro <- pairs[[i]][[1]]*pairs[[i]][[2]];
    if (pro > product) product = pro
}

print(product)

# Sum of 3 numbers

filter3 <- function(x,y,z) x+y+z != 2020
pairs <- cross3(dayone$V1, dayone$V1, dayone$V1,.filter = filter3)

product = 0

for(i in seq_along(pairs)) {
  pro <- pairs[[i]][[1]]*pairs[[i]][[2]]*pairs[[i]][[3]];
  if (pro > product) product = pro
}

print(product)

