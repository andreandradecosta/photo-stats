source("init.R")

data <- data.frame()
setClass('toDate')
setAs("character", "toDate", function(from) {
     as.POSIXct(from, format = "%Y:%m:%d %H:%M:%S")
})

for (f in list.files("data", full.names = TRUE)) {
    print(f)
    data <- rbind(data, read.csv(f, 
                                 colClasses = c("character", "factor", "toDate", "factor", "factor", "factor", "factor"), 
                                 na.strings = c("", " ", "0.0 mm")))
}

print(summary(data))

q <- ggplot(data, aes(FocalLength))
q <- q + geom_histogram()
print(q)

