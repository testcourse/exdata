library(ggplot2);

library(sqldf);

## Loading data
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

## Select the NEI data for Baltimore City and Los Angeles
data6_1 <- sqldf("select fips, SCC, Emissions, year from NEI where fips='24510' or fips='06037'");


## Replace fips to the City name
data6_1[which(data6_1$fips=="24510"),"fips"] <- "Baltimore City";

data6_1[which(data6_1$fips=="06037"),"fips"] <- "Los Angeles";


## Select the related SCC data that with motor vehicles source
data6_2 <- SCC[grep("Vehicles",SCC$EI.Sector),];


## Merge the eligible NEI and SCC data by "SCC"
data6 <- merge(data6_1,data6_2,by.x="SCC",by.y="SCC",all=FALSE);

## Get the total emissions for the two cities in each year
data <- sqldf("select year, fips, sum(Emissions) as emissions from data6 group by year, fips order by year");

## Rename "fips" to "city" to be more clear
names(data)[2] <- "city";


## Plot the total emissions in these two cities each year. Two be more comparable, the Y axis = log(emissions)
qplot(year,log(emissions),data=data,color=city, geom="line", xlab="Year", ylab="Total Emissions (log(tons)", main="Emissions in Baltimore City vs. Emissions in Los Angeles");

## Export the plot to png file
dev.copy(png,"6.png",width=480, height=480);

dev.off();