
setwd("./git2/prog_2/")
getwd()

# Check if both data exist. If not, load the data.
if (!"SCCData" %in% ls()) {
  SCCData <- readRDS("../data/summarySCC_PM25.rds")
}

if (!"sccCode" %in% ls()) {
  SCCCode <- readRDS("../data/Source_Classification_Code.rds")
}

subset <- SCCData[SCCData$fips == "24510"|SCCData$fips == "06037", ]

library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./Q6_plot.png", width = 500, height = 500, 
    units = "px", bg = "transparent")

motor <- grep("motor", SCCCode$Short.Name, ignore.case = T)
motor <- SCCCode[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

dev.off()

rm(SCCData)
rm(SCCCode)
rm(subset)
