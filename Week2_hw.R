set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
hw2[!is.na(hw2)]
hw2[complete.cases(hw2)]
hw2[hw2>=14 & hw2<=38]
prob1 <- hw2[hw2>14 & hw2<38]
prob1*c(3)
prob1[!is.na(prob1)]
plus10<-prob1+c(10)
final <- plus10[c(T,F)]
