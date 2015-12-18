source("init.R")

data <- readRDS("data.rds")

q <- ggplot(data, aes(FocalLength)) + 
    geom_histogram(aes(fill = LensModel), binwidth = 1) +
    theme(legend.position = "top") +
    labs(title = "Photos by Focal Length")

print(q)
dev.copy(png, width = 800, height = 600, "FocalLength.png")
dev.off()

byYear <- data %>%
    group_by(year = year(CreateDate)) %>%
    summarise(count = n())


q <- ggplot(byYear, aes(x = year, y = count)) +
    geom_bar(stat = "identity") +
    labs(title = "Photos by Year")
print(q)
dev.copy(png, width = 800, height = 600, "Year.png")
dev.off()
