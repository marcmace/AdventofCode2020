library(magrittr)
bp <- readLines(paste(getwd(),"/day05/day05_input.txt", sep=""))

seatid <- list()

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
  seatid <- append(seatid, seatrow*8+seatcol) 
}
filled <- sort(unlist(seatid))

for (i in seq_along(filled)) {
  if (filled[i+1] - filled[i] !=1) {
    print(paste("SeatID:",filled[i]+1))
    for (k in 0:7) {
      if((filled[i]+1 - k) %% 8 == 0) print(paste("Row", (filled[i]+1 - k) / 8, "Seat", k))
    }
    break
  }
}
