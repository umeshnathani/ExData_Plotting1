# Download data from URL and unzip. This requires internet connection!
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",stringsAsFactors = FALSE,header=TRUE,na.strings = "?")
unlink(temp)
#Convert to date
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- data[(data[,1] >= as.Date('2007-02-01',format="%Y-%m-%d"))&(data[,1] <= as.Date('2007-02-02',format="%Y-%m-%d")),]

# Use strptime to conver to POSIXT
var <- strptime(paste(data[,1],data[,2]),format="%Y-%m-%d %H:%M:%S")

# Create PNG
png(filename = "Plot3.png",width=480,height=480)
plot(var,data[,7],type="line",ylab="Energy sub metering",xlab='')
lines(var,data[,8],col="red")
lines(var,data[,9],col="blue")
legend('topright',names(data[,c(7,8,9)]),lty=1,col=c('black','red','blue'))
dev.off()
