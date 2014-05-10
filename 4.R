library(ggplot2);

library(sqldf);

NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

data4 <- SCC[grep("Coal",SCC$EI.Sector),];

data <- merge(NEI,data4,by.x="SCC",by.y="SCC",all=FALSE);

data5 <- sqldf("select year,sum(Emissions) as emissions from data group by year order by year");

qplot(year,emissions,data=data5,geom="line", xlab="Year", ylab="Total Emissions (tons)");

dev.copy(png,"4.png",width=480, height=480);

dev.off();