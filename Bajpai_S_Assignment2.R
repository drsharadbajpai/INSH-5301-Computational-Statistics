
1.
# a. Write a function that calculates the mean of any numeric vector you give it, without using the built-in mean() or sum() functions.

mynum <-seq(from=1, to=100,by=5)
mynum

mymean<- function(mynum){
  num<-0 
  for (i in mynum){
    num<- num + i}
return(num/length(mynum))
}
mymean(mynum)


# b. Write a function that takes as its input a vector with four elements. If the sum of the first two elements is greater than the sum of the second two, the function returns the vector; otherwise it returns 0.

v1<- c(10,8,4,2)
v1

b <- function(v1){
  if ((v1[1] + v1[2])> (v1[3] + v1[4])) 
  { return (v1) 
  } else { return (0) } 
  }

b(v1)

#c. Write a function that calculates the Fibonacci sequence up to the nth element, 
#where n is any number input into your function (its argument). The Fibonacci sequence is: 1, 1, 2, 3, 5, 8, 13, 21. . . , ie, each
#element is the sum of the previous two elements. One way to do this is to start off with the first two
#elements, c(1,1) and set an internal variable to this sequence. Then write a loop that counts up ton, where for each new element, you first calculate it by adding the last two elements of the growing
#sequence, and then stick that new number onto the growing sequence using c(). When the loop is
#finished, the function should return the final vector of Fibonacci numbers.

fibonacci <- function(n){
  x=c(1,1)
  for(i in 3:n){
    x[i]=(x[i-1]+x[i-2])
  }
  return(x)
}
fibonacci(12)


#d. Create a 4x4 matrix of the numbers 1 through 16. Use apply to apply you function from (a) to each of the rows in your matrix.
d<- matrix(1:16, nrow=4, ncol=4)
d
d1<- apply(d,1,mymean)
d1



#2.
# a. Using the airquality dataset, constuct an aggregated dataset which shows the maximum wind and ozone by month.
head(airquality)
WO_byMo<-aggregate(
  cbind(Wind,Ozone) ~ Month,data=airquality,max)
WO_byMo


# b. Create the authors and books datasets following the example and data in the lecture, and then create a new data set by merging these two datasets by author, preserving all rows.
authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  stringsAsFactors=FALSE)
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney",
           "Ripley", "Ripley", "McNeil", "R Core"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  stringsAsFactors=FALSE)
merged_books <- merge.data.frame(authors, books, by.x="surname", by.y="name")
merged_books



# c. Take the following string and replace every instance of "to" or "To" with "2" :
to_TO<-"To be, or not to be -- that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles,
And by opposing end them. To die -- to sleep --
No more..."
New_2 <- gsub("To|to", 2, to_TO)
New_2

#3.
#1

# a. Create a histogram using the base R graphics using some dataset or variable other than the one in the lessons. Always make sure your graph has well-labeled x and y axes and an explanatory title.
library(help = "datasets")
library(tidyverse)
library(ggplot2)
head(quakes)
hist(quakes$mag, main="Magnitude Histogram of Earthquakes", xlab = "Magnitude")
# b. Create a scatter plot using the base R graphics, again with some variable other than the one in the lessons.
head(Orange)
plot(Orange$age, y= Orange$circumference, 
     main="Relationship between Age & Circumference of Orange Trees",
     xlab="Age", ylab="Circumference")
# c. Create a histogram using ggplot, using some new data. In this and the later plots, please tinker with the settings using the examples in http://www.cookbook-r.com/Graphs/ to make it prettier.

library("ggplot2")
ggplot(data = cars, aes(x=(dist), y= speed))+
geom_histogram(color="black", fill="red",width=3, stat = "identity")+
guides(fill=F)+
xlab("Stopping distance of cars")+
ylab("Speed of cars")+
ggtitle("Speed and Stopping distances of cars")

# d. Create a box plot (with multiple categories) using ggplot, using some new data.

ggplot(data=iris, aes(x=Species, y=Sepal.Length))+
  geom_boxplot( color= "#009E73", fill="#CC79A7")+
  xlab("Species of iris")+
  ylab("Sepal Length")+
  ggtitle("Sepal Length based on the Species of Iris")

# e. Create a scatter plot using ggplot, using some new data
ggplot(data=pressure, aes(x=temperature, y=pressure))+
  geom_point( color= "darkred", fill="#A4A4A4")+
  xlab("Temperature")+
  ylab("Pressure")+
  ggtitle("Vapor pressure of Mercury as a Function of Temperature")
