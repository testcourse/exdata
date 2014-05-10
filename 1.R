
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

data <- tapply(NEI$Emissions,NEI$year,sum);

plot(as.numeric(names(data)),as.numeric(data), type='l', xlab="Year", ylab="Total Emissions (tons)");

dev.copy(png,"1.png",width=480, height=480);

dev.off();
