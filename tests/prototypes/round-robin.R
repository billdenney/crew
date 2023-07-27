# Replicates the NNG round robin phenomenon mentioned at
# https://github.com/shikokuchuo/mirai/discussions/22#discussioncomment-5121947

# Worker 1 and worker 2:
library(nanonext)
dialer <- socket("rep", dial = "tcp://127.0.0.1:5007")
while (TRUE) {
  raw <- recv(dialer, mode = "raw", block = TRUE)
  seconds <- as.integer(rawToChar(raw))
  print(paste("sleeping for", seconds, "seconds"))
  Sys.sleep(as.integer(seconds))
}

# Client:
library(nanonext)
listener <- socket("req", listen = "tcp://127.0.0.1:5007")
# Send tasks manually to avoid error code 8 (try again)
send(listener, data = charToRaw("3"), mode = "raw")
send(listener, data = charToRaw("10"), mode = "raw")
send(listener, data = charToRaw("3"), mode = "raw")
send(listener, data = charToRaw("10"), mode = "raw")
send(listener, data = charToRaw("3"), mode = "raw")
send(listener, data = charToRaw("10"), mode = "raw")
