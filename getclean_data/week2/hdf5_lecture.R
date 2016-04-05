#This is the HDF5 lecture. The interesting thing is that this is a data format that I have never even heard of before
#I wonder what it is like? It will be good to learn a new form of data storage. Also I feel like I need to 
#learn some NoSQL skills like MongoDB. But that will be for another time.


#here is the layout of the basics for HDF5 data
#- It is a heirarchical data format that consists of groups of one or more datasets and their metadata
#    - there is a group header, with the group name and the list of attributes
#    - there is a group symbol table with a list of objects in a group
#- The datasets themselves are kind of like dataframes. It's an array of data with metadata associated with it

#IMPORTANT! HDF5 can be used to optimize reading and writing from disk in R. So that is the real benefit here of this format. I can see that being very useful too.

#In order to load the functions to deal with this type of data you have to use load in a file on bioconductor using this command
setwd("/Users/cfaw/datasciencecoursera/getclean_data/week2")
#source("http://bioconductor.org/biocLite.R")
#biocLite("rhdf5")

library(rhdf5)

created = h5createFile("data/example.h5")
created

#As you can probably tell below this is where we are creating groups for our data. Then on the last row we are creating a sub group within the "foo" group
created = h5createGroup("data/example.h5", "foo")
created = h5createGroup("data/example.h5", "baa")
created = h5createGroup("data/example.h5", "foo/foobaa")

h5ls("data/example.h5")

#Now we are going to write data out to these groups. This honestly does remind me a bit of the HDFS file structure
A = matrix(1:10, nrow = 5, ncol = 2)
h5write(A, "data/example.h5", "foo/A")
B = array(seq(0.1, 2.0, by = 0.1), dim = c(5, 2, 2))
attr(B, "scale") <- "liter"
h5write(B, "data/example.h5", "foo/foobaa/B")
h5ls("data/example.h5")


