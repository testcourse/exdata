
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

data2 <- NEI[which(NEI$fips==24510),];

data <- tapply(data2$Emissions,data2$year,sum);

plot(as.numeric(names(data)),as.numeric(data), type='l', xlab="Year", ylab="Total Emissions in the Baltimore City (tons)");

dev.copy(png,"2.png",width=480, height=480);

dev.off();
