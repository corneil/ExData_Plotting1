if(!require(data.table)) {
    install.packages("data.table")
    library(data.table)
}
if(!require(dplyr)) {
    install.packages("dplyr")
    library(dplyr)
}
if(!require(lubridate)) {
    install.packages("lubridate")
    library(lubridate)
}
if(!file.exists('exdata-data-household_power_consumption.zip')) {
    print('Downloading data')
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'exdata-data-household_power_consumption.zip', method = 'curl')
}
txtfile <- 'household_power_consumption.txt'
if(!file.exists(txtfile)) {
    print('Expanding data')
    unzip('exdata-data-household_power_consumption.zip')
}

limitfile <- 'limited_household_power_consumption.txt'
if(!file.exists(limitfile)) {
    print('Filtering data')
    input <- file(txtfile, "r")
    output <- file(limitfile, "w")
    writeLines(text = readLines(con = input, n = 1), con = output)
    repeat {
        line <- readLines(con = input, n = 1, skipNul = TRUE, warn = FALSE)
        if(!is.null(line) && length(line) > 0 && nchar(line, allowNA = TRUE) > 0) {
            if(grepl("^2/(1|2)/2007;", line)) {
                writeLines(text = line, con = output, useBytes = TRUE)
            }
        } else {
            break
        }
    }
    close(input)
    close(output)
}
print('Loading filtered file')
house <- read.table(limitfile, header = TRUE, sep = ";", na.strings = c("?")) %>% 
    mutate(datetime.str = paste(Date,Time), 
           datetime = mdy_hms(datetime.str))


