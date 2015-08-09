plot3 <- function(){
        require(dplyr) # make sure you have 'dplyr' package installed in your system
        
        myfile <- "./data/household_power_consumption.txt"
        if(!file.exists(myfile)) stop("The data file is not located in the ./data directory")
        # make sure your data file is in a "data" directory inside your working directory
        print("Reading the data file, please wait!")
        data <- read.table(myfile, header=TRUE,sep=";")
        
        data <- mutate(data,my_date=as.Date(Date,"%d/%m/%Y"))
        data <- filter(data,(my_date=="2007-02-01" | my_date=="2007-02-02"))
        
        date_time <- paste(data$Date, data$Time)
        date_time <- strptime(date_time,"%d/%m/%Y %H:%M:%S")
             
        sm_1 <- as.vector(data$Sub_metering_1)
        sm_1 <- as.numeric(sm_1)
        
        sm_2 <- as.vector(data$Sub_metering_2)
        sm_2 <- as.numeric(sm_2)
        
        sm_3 <- as.vector(data$Sub_metering_3)
        sm_3 <- as.numeric(sm_3)
        
        plot(date_time,sm_1,xlab="",ylab="Energy sub metering",type="n")
        
        lines(date_time,sm_1,col="black")
        lines(date_time,sm_2,col="red")
        lines(date_time,sm_3,col="blue")
        
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1),col=c("black","red","blue"),cex=0.7)
        
        dev.copy(png,file="plot3.png")
        dev.off()
        print("Your Plot is ready... have a good day!")
        
}