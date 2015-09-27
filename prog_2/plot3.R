
setwd("./git2/prog_2/")
getwd()

# Check if both data exist. If not, load the data.
if (!"SCCData" %in% ls()) {
  SCCData <- readRDS("../data/summarySCC_PM25.rds")
}

if (!"sccCode" %in% ls()) {
  SCCCode <- readRDS("../data/Source_Classification_Code.rds")
}

subset <- SCCData[SCCData$fips == "24510", ] 

library(ggplot2)

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot3.png", width = 500, height = 500, units = "px")

g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()

rm(SCCData)
rm(SCCCode)

