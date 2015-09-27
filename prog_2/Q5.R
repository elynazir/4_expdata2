
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

head(SCCCode$Short.Name)

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./Q5_plot.png", width = 500, height = 500, units = "px")

motor <- grep("motor", SCCCode$Short.Name, ignore.case = T)
motor <- SCCCode[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

rm(SCCData)
rm(SCCCode)
rm(subset)
