library(tidyverse)

input <- tibble(action = readLines("./day08/day08_input.txt"))

code <- input %>%
  extract(action, c("action", "val"), regex = "(.*) ([+-]\\d*)", remove = T, convert = T) %>%
  add_column("been" = 0)

here <- 1
counter <- 0
# 
# 0) if we haven't been to row i, then keep going
# 1) go to row i in code
#1b) set been flag
# 2) read the action
# 3) do the action
# 4) go to the action of next location

game <- function(c, i, z, ...) {
  act = slice(c,i)$action
  if (act == "nop") i <- i + 1
  else if (act == "acc") {z = z + slice(c,i)$val
                   i <- i + 1}
  else i <- i + slice(c,i)$val
  
  c(z, i)
}


while(slice(code,here)$been == 0) {
  code$been[here] <- 1
  run = game(code, here, counter)
  here <- run[2]
  counter <- run[1]
}

print(counter)