############################################
## FUNCTION: loadDataTable
## INPUTS: file -> path to data file
## OUTPUTS: data.table filtered to Feb 1-2 2007 dates
### with proper Date and Date/Time columns 
## NOTES: Loads data from specified file path
### Assumes file contains unzipped raw file from:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
############################################
loadDataTable <- function(file) {
  if(!file.exists(file))
  {
    message("Data file was not found. Stopping...")
    return(NULL)
  }
  #read file using grep filter on 2007-Feb 01 & 02 lines
  dt <- fread(
    paste("grep ^[12]/2/2007", file),
    na.strings = c("?", "")
    )
  # "grep" lost the headers, so get them
  setnames(dt, colnames(fread(file, nrows=0)))
  # store date and date/time strings
  strDate <- dt$Date
  strDateTime <- paste(dt$Date, dt$Time)
  # store date/time string converted to POSIXct
  datetimes <- as.POSIXct(strptime(strDateTime,"%d/%m/%Y %H:%M:%S"))
  # convert Date column from string to Date class
  dt[,Date:= as.Date(strDate, "%d/%m/%Y")]
  # add new DateTime column as POSIXct vector
  dt[,DateTime:= datetimes]
  
  return(dt)
}