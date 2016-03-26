#This script is about reading XML files into R for analysis
#XML is the basis for most web scraping.
#First we are going to load in the XML package. If you do not already have this package installed then 
#you first need to do that by entering install.packages("XML")
library(XML)

fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

#rootNode, in this instance, is actually the data structure holding all of the xml information. It's really handy!
#So you can basically access the parts of the XML in the same way that you would access elements of a list in R

rootNode[[1]]

#That will show you the first <food> element. You can dig deeper into that like this:

rootNode[[1]][[1]]

#or like this

rootNode[[1]][[2]]

#You can also programmatically apply functions to the document. Almost like the Map function in Python
#You do that for example like this:

xmlSApply(rootNode, xmlValue)

#This is applying the xmlValue function to every element in the rootNode data structure, recursively.

#So, this is something that I should learn sometime in the near future. In order to really work well with XML you have to learn the XPath language.
#XPath is a whole new language that allows you to access the data within XML. Here is a link to a lecture that explains this in much greater detail.
#www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf

#So there is some information in the lecture on how to write in XPath, and how to use it to access specific elements of the XML doc.
#THIS IS PRETTY DOPE!
#Here is some basic information:
#/node -- Top level node of doc
#//node -- Node at any level
#node[@attr-name] -- Node with an attribute name
#node[@attr-name='bob'] -- Node with attribute name = 'bob'

#EXAMPLES:
xpathSApply(rootNode, "//name", xmlValue)

#Now we are going to parse through the Baltimore Ravens webpage. Maybe I will change up the sports team though...
#I chose to parse through the Cleveland Cavaliers website. The HTML is pretty messy but I was able to get a list of all
#The NBA teams in the league. Here it is.
#It's important that you use the HTML parser instead of the XML one when parsing HTML.

fileURL <- "http://www.nba.com/cavaliers/"
doc <- htmlTreeParse(fileURL, useInternal=TRUE)
teams <- xpathSApply(doc, "//a[@class='global-nav__menu-item__sub-menu__sub-item']",xmlValue)
teams