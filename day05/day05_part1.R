library(magrittr)
bp <- readLines(paste(getwd(),"/day05/day05_input.txt", sep=""))

seatid <- 0

for (i in seq_along(bp)) {
  pass <- bp[i]
  if (!grepl("^[FB]{7}[LR]{3}$", pass)) next
  seatbin <- pass %>%
    gsub(pattern = "[FL]", replacement = 0) %>%
    gsub(pattern = "[BR]", replacement = 1)
  seatrow <- substr(seatbin,1,7) %>% 
    strtoi(base=2)
  seatcol <- substr(seatbin,8,10) %>%
    strtoi(base=2)
  if (seatrow*8+seatcol > seatid) seatid <- seatrow*8+seatcol
}

print(seatid)