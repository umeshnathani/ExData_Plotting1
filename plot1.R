# Download data from URL and unzip. This requires internet connection!
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",stringsAsFactors = FALSE,header=TRUE,na.strings = "?")
unlink(temp)

#Convert to date
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- data[(data[,1] >= as.Date('2007-02-01',format="%Y-%m-%d")),]

#Create PNG
png(filename = "Plot1.png",width=480,height=480)
hist(data[,3],col="red",main="Global Active Power",xlim=c(0,6),xlab="Global Active Power(Kilowatts)")
dev.off()
