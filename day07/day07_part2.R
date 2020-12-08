library(tidyverse)

input <- tibble(x = readLines("./day07/day07_input.txt"))
imm <- "shiny gold"
total <- 0

rules <- input %>%
  extract(x, into = c("outside", "contents"), regex = "(.*) bags contain (.*)\\.") %>%
  separate_rows(contents, sep = ",",) %>%
  extract(contents, c("number","inside"), "(\\d)+ (.*) bag[s]?", convert=T) %>%
  filter(!is.na(number))

goin <- function(colors, ...) {
  inner <- rules %>%
    filter(outside == colors)
  
  sum(inner$number*(1 + map_dbl(inner$inside, goin)))
}

total <- goin(imm)

