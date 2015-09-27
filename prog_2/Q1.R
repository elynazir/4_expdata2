
setwd("./git2/prog_2/")
getwd()
unzip("../data/exdata-data-NEI_data.zip", exdir = "../data/")

# Check if both data exist. If not, load the data.
if (!"SCCData" %in% ls()) {
  SCCData <- readRDS("../data/summarySCC_PM25.rds")
}

if (!"sccCode" %in% ls()) {
  SCCCode <- readRDS("../data/Source_Classification_Code.rds")
}

head(SCCData)
head(SCCCode)

dim(SCCData) # 6497651   6
dim(SCCCode) # 11717    15

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./Q1_plot.png", width = 500, height = 500, units = "px")

ttlEmissions <- aggregate(SCCData$Emissions, list(SCCData$year), FUN = "sum")

plot(ttlEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the USA from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

rm(SCCData)
rm(SCCCode)

