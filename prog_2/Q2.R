
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

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./Q2_plot.png", width = 500, height = 500, units = "px")

ttlEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

plot(ttlEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

rm(SCCData)
rm(SCCCode)

