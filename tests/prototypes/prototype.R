# Worker 1
library(nanonext)
rep <- socket("rep", dial = "tcp://127.0.0.1:5003")
ctxp <- context(rep)
r <- 0L
task <- function(data) {
  Sys.sleep(16)
  1L # Return worker ID.
}
while (r == 0L) {
  r <- reply(ctxp, execute = task, send_mode = "raw")
  print(r)
}

# Worker 2
library(nanonext)
rep <- socket("rep", dial = "tcp://127.0.0.1:5003")
ctxp <- context(rep)
r <- 0L
task <- function(data) {
  Sys.sleep(16)
  2L # Return worker ID.
}
while (r == 0L) {
  r <- reply(ctxp, execute = task, send_mode = "raw")
  print(r)
}

# Client
library(nanonext)
req <- socket("req", listen = "tcp://127.0.0.1:5004")
ctxq <- context(req)
# Each successive task cancels the previous one
# and I get error 20: operation cancelled
aios <- replicate(8, request(ctxq, data = 1L, recv_mode = "integer"))
results <- NA
index <- 0
while (anyNA(results)) {
  results <- unlist(lapply(aios, function(x) x$data))
  print(paste0(index, "s: ", paste(results, collapse = " ")))
  Sys.sleep(4)
  index <- index + 4
}
