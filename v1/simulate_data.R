N <- 1000 # sample size

X1 <- rpois(n = N, lambda = 50)
head(X1)
X2 <- 10 + rbinom(n = N, prob = 0.8, size = 1)
head(X2)
Y <- 10 + 3 * X1 + -5 * X2 + 3 * rnorm(n = N)
head(Y)

write.csv(data.frame(Y = Y, X1 = X1, X2 = X2), "sample_data.csv", row.names = FALSE)

