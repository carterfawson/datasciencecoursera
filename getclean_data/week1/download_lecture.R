setwd("/Users/cfaw/datasciencecoursera/getclean_data")

#this is how you check for files and directories existing. If you want to look for a file then change "dir" to "file"
if(!dir.exists("data")){
  dir.create("data")
}


fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile="./data/cameras.csv", method="curl")
list.files("./data")

dateDownloaded <- date()
dateDownloaded