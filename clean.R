source("init.R")

data <- data.frame()
setClass('toDate')
setAs("character", "toDate", function(from) {
    as.POSIXct(from, format = "%Y:%m:%d %H:%M:%S")
})

for (f in list.files("data", full.names = TRUE)) {
    print(f)
    data <- rbind(data, read.csv(f, 
                                 colClasses = c("character", "factor", "toDate", "factor", "factor", "numeric", "factor"), 
                                 na.strings = c("", " ", "0.0 mm")))
}

data <- data[, 2:ncol(data)]
data <- na.omit(data)
colnames(data) <-  gsub("\\.", "", colnames(data))
print(summary(data))
saveRDS(data, file = "data.rds")
