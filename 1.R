
## Loading data
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

## Get the total emissions for each year
data <- tapply(NEI$Emissions,NEI$year,sum);

## Plot with type equals to "line"
plot(as.numeric(names(data)),as.numeric(data), type='l', xlab="Year", ylab="Total Emissions (tons)");

## Export the plot to png file
dev.copy(png,"1.png",width=480, height=480);

dev.off();
