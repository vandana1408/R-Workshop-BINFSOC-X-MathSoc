# Probability and Statistics in R

x = c(70, 74, 81, 60, 91, 80, 55, 89, 86, 62)

print(mean(x))
print(median(x))
print(var(x))                # sample variance
print(sd(x) - sqrt(var(x)))  # either is fine
print(quantile(x, 0.75))
print(max(x))
print(min(x))
print(IQR(x))                # interquartile range
print(summary(x))

# Exercise: Compute the first quartile manually
print(quantile(x, 0.25))

# ==============================================================================

# ========================= Probability distributions ==========================

# Computing the density
dnorm(x=0, sd=1, mean=0)

# Manually:
x = 0
mu = 0
sigma = 1
1/sqrt(2 * pi * sigma) * exp(-(x - mu)^2 / 2 * sigma^2)

# Computing the area under a probability destribution up until a particular point
pnorm(q=0, mean=0, sd=1, lower.tail=TRUE)

# Quantile function to return the pth percentile
qnorm(p=0.975, mean=0, sd=1)

# Randomly draw from a distribution
rnorm(n=100, mean=0, sd=1)

help(distributions)

# Exercises:
# ==========

# Question 1:
# ===========
# In a large restaurant an average of 3 out of every 5 customers ask for water with their meal
# A random sample of 10 customers is selected
# Use the binomial distribution to find the probability that exactly 6 ask for water with their meal

# Solution:
# Here X ~ Bin(10, 3/5)
dbinom(x=6, size=10, prob=3/5)


# Question 2:
# ===========
# The heights of adult females are normally distributed with mean 160cm and 
# variance of 64cm

# Find the probability that a randomly selected adult female has a height greater 
# ...than 170cm

# Solution:
# Here X ~ N(160, 3/5)
pnorm(q=170, mean=160, sd=sqrt(64), lower.tail=FALSE)

# Question 3:
# ===========
# Suppose we have a chi-squared random variable with 1 degree of freedom
# Find the value such that the area up until that particular value is 0.95

# Solution:
qchisq(p=0.95, d=1)


# ============================= Differentiation ================================

# Differentiate the following function: 
f = expression(1 / (1 + exp(-x)))
D(f, 'x')

# The function above is called the sigmoid and is used in machine learning algorithms
# ...such as logistic regression and as activation functions for neural networks
# ...with a bit of algebra it can be shown that the derivative of the sigmoid is proportional 
# ...to the original function such that

# d/dx (sigmoid(x))  = sigmoid(x) * (1 - sigmoid(x))


# =============================== Integration ==================================

# One-dimensional integral over a finite or infinite interval
f = function(x) {
  return(1/sqrt(2 * pi) * exp(-x^2 / 2))
  }

integrate(f, lower=-Inf, upper=Inf)

# Several variable calculus (for this we'll need a package to do the heavy lifting)
# Hopefully this will steer you in the right direction
# install.packages('cubature')
# library(cubature)

# The function is called adaptIntegrate()


      