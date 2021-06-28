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
get_sampsize_2Dnormal(means_alt = c(0.2,0.2), MID = c(0,0), corr12 = 0.0, p_oc1 = 0.7)
```


## 3 Normal Outcomes

Table 5 presents 24 scenarios in 4 rows and 6 columns. To reproduce the upper left corner scenario (row 1, column 1; p=0, theta = (0.25,0.05,0.05)) in Table 5, run the following. 
Parameters may be updated accordingly to reproduce the rest of the scenarios of Table 5.

```
set.seed(5)

means_alt = c(0.25, 0.05, 0.05)
corr12 = 0
corr13 = 0
corr23 = 0
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.05, 0.05)

results_table5_cell11 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)
```
