# Putting all the pieces together with `make`

- data retrieving
- data cleaning
- analysis
- graphs
- reports
...

# Dependency management

## Simulate data in R

File `simulate_data.R`

```r
N <- 1000 # sample size

X1 <- rpois(n = N, lambda = 50)
head(X1)
X2 <- 10 + rbinom(n = N, prob = 0.8, size = 1)
head(X2)
Y <- 10 + 3 * X1 + -5 * X2 + 3 * rnorm(n = N)
head(Y)

write.csv(data.frame(Y = Y, X1 = X1, X2 = X2), "sample_data.csv", row.names = FALSE)
```

## Create a plot in Python

File `create_graph.py`

```python
import pandas as pd
import matplotlib.pyplot as plt

sim_data = pd.read_csv("sample_data.csv")

sim_data.head()

plt.figure()
sim_data.plot()

plt.savefig("plot.pdf", format = "pdf")
```

## Run statistical model in R

We can print the model output with:

```r
sim_data <- read.csv("sample_data.csv")
summary(lm(Y ~ X1 + X2, data = sim_data))
```

To save the output, we use the `sink` function.

File `estimate_model.R`

```r
sim_data <- read.csv("sample_data.csv")
summary(lm(Y ~ X1 + X2, data = sim_data))

sink("estimation_summary.txt")
summary(lm(Y ~ X1 + X2, data = sim_data))
sink()
```

# Makefile syntax

- `make` is a command that runs on a text file often named Makefile.

- A `Makefile` contains one or several blocks with the following structure:

```
target: sourcefile(s)
[tab] command
```

# Naive version (v1)

File `Makefile`

```
sample: simulate_data.R
	R CMD BATCH simulate_data.R

plot: sample_data.csv create_graph.py
	python create_graph.py

estimate: sample_data.csv estimate_model.R
	R CMD BATCH estimate_model.R
```

A simple call to make only builds the first target (`sample`). To build the other targets, we have to use: `make plot` and `make estimate`.

# Making all targets and dealing with dependencies (v2 and v3)

 `plot.pdf` and `estimation_summary.txt` depend on `sample_data.csv`
 

