# compositeDOOR
Code accompanying composite endpoints x desirability of outcome ranking paper to help calculate sample size and reproduce paper results

## Installation

This GitHub package can be downloaded using the following command in R:

```
install_github("jiyingz/compositeDOOR")
```

## 2 Normal Outcomes

To reproduce Table 4 Column 1 for two normal outcomes with `MID` = 0 for both and P(favor outcome 1) = `p_oc1` = 70%, run the following. 
Parameters may be updated accordingly to reproduce the rest of the columns of Table 4. 

```
# Set parameters
means_alt = c(0.2, 0.2) # Vector of outcome means under the alternative hypothesis
MID = c(0, 0) # Vector with value of minimum important difference per outcome
corr12 = 0.0 # Correlation between outcomes 1 and 2
p_oc1 = 0.7 # Chance of picking outcome 1 as priority over outcome 2

# Run integration to get sample size for one arm
get_sampsize_2Dnormal(means_alt, MID, corr12, p_oc1)
```


## 3 Normal Outcomes

Table 5 presents 24 scenarios in 4 rows and 6 columns. To reproduce the upper left corner scenario (row 1, column 1; p=0, theta = (0.25,0.05,0.05)) in Table 5, run the following. 
Parameters may be updated accordingly to reproduce the rest of the scenarios of Table 5.

```
set.seed(5)

# Set parameters
means_alt = c(0.25, 0.05, 0.05) # Vector of outcome means under the alternative hypothesis
MID = c(0.25, 0.05, 0.05) # Vector with value of minimum important difference per outcome
corr12 = 0 # Correlation between outcomes 1 and 2
corr13 = 0 # Correlation between outcomes 1 and 3
corr23 = 0 # Correlation between outcomes 2 and 3
p123 = 1/6 # Chance of picking outcome 1, then 2, then 3 as preferred priority ordering (aka preference category 1)
p132 = 1/6 # Chance of picking outcome 1, then 3, then 2 as preferred priority ordering (aka preference category 2)
p213 = 1/6 # Chance of picking outcome 2, then 1, then 3 as preferred priority ordering (aka preference category 3)
p231 = 1/6 # Chance of picking outcome 2, then 3, then 1 as preferred priority ordering (aka preference category 4)
p312 = 1/6 # Chance of picking outcome 3, then 1, then 2 as preferred priority ordering (aka preference category 5)
p321 = 1/6 # Chance of picking outcome 3, then 2, then 1 as preferred priority ordering (aka preference category 6)

# Run Monte Carlo simulations to get sample size for one arm
results_table5_cell11 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)
```

Full code to reproduce results in Table 5 can be found in `run_3Dnormal.R`.
