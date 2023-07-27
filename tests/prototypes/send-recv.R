# Worker 1
library(nanonext)
dialer <- socket("rep", dial = "tcp://127.0.0.1:5007")
while (TRUE) {
  recv(dialer, mode = "character", block = TRUE)
  Sys.sleep(16)
  print("worker 1 got message")
  send(dialer, "1")
}

# Worker 2
library(nanonext)
dialer <- socket("rep", dial = "tcp://127.0.0.1:5007")
while (TRUE) {
  recv(dialer, mode = "character", block = TRUE)
  Sys.sleep(16)
  print("worker 2 got message")
  send(dialer, "2")
}

# Client: lots of error 8 (try again) and error 11 (incorrect state)
library(nanonext)
listener <- socket("req", listen = "tcp://127.0.0.1:5007")
codes <- replicate(8, send(listener, data = "x", mode = "serial")) # codes all 8 (try again)

# Submit tasks manually with send(listener, data = "x", mode = "serial")

while(TRUE) {
  value <- recv(listener) # Can only receive 1 value and then I get error 11 (incorrect state)
  if (is.character(value)) {
    print(value)
  }
  Sys.sleep(1)
}
