
## Loading data
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

## Select the NEI data for Baltimore City
data2 <- NEI[which(NEI$fips==24510),];

## Get the total emissions for each year in Baltimore City
data <- tapply(data2$Emissions,data2$year,sum);

## Plot with type equals to "line"
plot(as.numeric(names(data)),as.numeric(data), type='l', xlab="Year", ylab="Total Emissions in the Baltimore City (tons)");


## Export the plot to png file
dev.copy(png,"2.png",width=480, height=480);

dev.off();
