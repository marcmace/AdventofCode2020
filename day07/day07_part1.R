library(tidyverse)

input <- tibble(x = readLines("./day07/day07_input.txt"))
imm <- "shiny gold"
total <- 0

rules <- input %>%
  extract(x, into = c("outside", "contents"), regex = "(.*) bags contain (.*)\\.") %>%
  separate_rows(contents, sep = ",",) %>%
  extract(contents, c("number","inside"), "(\\d)+ (.*) bag[s]?", convert=T) %>%
  filter(!is.na(number)) # drop the bags which don't contain any other bags

bags <- function(colors, ...) {
  rules %>%
    filter(inside %in% colors) %>%
    pull(outside)
}

track <- list()

while(length(imm)!=0) {
  track <- append(track,bags(imm))
  imm <- bags(imm)
}
print(length(unique(track)))



