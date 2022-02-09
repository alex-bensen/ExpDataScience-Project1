#Reading txt file
data <- read.table('~/ExpDataScience-Project1/household_power_consumption.txt')

#Creating a dataframe from the textfile
data1 <- data.frame(matrix(ncol = 9, nrow = 0))
colnames(data1) <- unlist(strsplit(data[1,], split = ';'))

for (i in 2:nrow(data)) {
  new <- unlist(strsplit(data[i,], split = ';'))
  data1[nrow(data1) +1, ] <- new
}

#Setting up four plots
par(mfrow = c(2,2))

#Creating a plot chart
date_num <- as.POSIXct(data1$Date, format = '%d/%m/%Y')
with(data1, plot(x = date_num, y = Voltage, xlab = 'Day', ylab = 'Voltage', main = 'Voltage vs. Day', col = 'blue'))
legend('topright', legend = 'Data', pch = 1)

#Creating a second plot chart
with(data1, plot(x = Global_active_power, y = Global_reactive_power, 
                 xlab = 'Active Power', ylab = 'Reactive Power', 
                 main = 'Active vs Reactive Power'))

#Creating a histogram
hist(x = as.numeric(data1$Sub_metering_1), xlab = 'Sub Metering 1 Data ', 
     main = 'Sub Metering 1 Histogram', col = 'purple')

#Creating a boxplot
boxplot(x = as.numeric(data1$Global_intensity), xlab = 'Global Intensity', 
        main = 'Global Intensity Boxplot')