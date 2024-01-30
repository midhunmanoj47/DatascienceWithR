#Question 1
library(ggplot2)
data(iris)
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, color=Species)) +
  geom_point()



#Question 2
data(txhousing)
sum(is.na(txhousing))
txhousing <- txhousing[complete.cases(txhousing), ]
ggplot(txhousing, aes(sales)) +
  geom_histogram()
ggplot(txhousing, aes(median)) +
  geom_histogram()
ggplot(txhousing, aes(sales, median)) +
  geom_point()
ggplot(txhousing, aes(city, sales)) +
  geom_boxplot()
ggplot(txhousing, aes(city, median)) +
  geom_boxplot()

str(txhousing)       
summary(txhousing)   

plot(txhousing$year, txhousing$median, main = "Median House Value over Time", xlab = "Year", ylab = "Median House Value")


barplot(table(txhousing$year), main = "Number of Houses by Year", xlab = "Year", ylab = "Count")


boxplot(median ~ year, data = txhousing, main = "Median House Value by Year", xlab = "Year", ylab = "Median House Value")
hist(txhousing$median, main = "Median House Value Distribution", xlab = "Median House Value")
plot(txhousing$inventory, txhousing$median, main = "Median House Value vs. Square Footage", xlab = "Square Footage", ylab = "Median House Value")
#Question 3
titanic <- read.csv("titanic.csv")
titanic$Survived <- ifelse(titanic$Survived == 0, "dead", "survived")

final_Plot = ggplot(data=titanic,aes(y=Survived ,x=Fare,fill = Sex))+
  geom_boxplot(position = "dodge")+
  facet_grid(Survived ~ ., scales = "free_y", space = "free_y") +
  labs(x = "Fare", y = "", title = "Titanic") +
  theme_minimal()

final_Plot
