# A file to run all the Monte Carlo simulations for 3D normal outcomes (Table 5)

# Common parameters
n = 1000000
alpha = 0.05
power = 0.9
means_null = c(0, 0, 0)

# Example 1 ---------------------------------------------
set.seed(5)

means_alt = c(1, 1, 1)
corr12 = 0.5
corr13 = 0.55
corr23 = 0.5
p123 = 0.42 #category 1
p132 = 0.17 #category 2
p213 = 0.24 #category 3
p231 = 0.05 #category 4
p312 = 0.08 #category 5
p321 = 0.04 #category 6
MID = c(0.67, 0.63, 0.54)

#start_time <- Sys.time()
results_ex1 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)
#end_time <- Sys.time()
#print(paste("Function took ", end_time - start_time, " minutes.", sep = ""))


# Table 5: p=0, theta = (0.25,0.05,0.05) ---------------------------------------------
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

# Table 5: p=0.1, theta = (0.25,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.05, 0.05)
corr12 = 0.1
corr13 = 0.1
corr23 = 0.1
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.05, 0.05)

results_table5_cell21 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.5, theta = (0.25,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.05, 0.05)
corr12 = 0.5
corr13 = 0.5
corr23 = 0.5
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.05, 0.05)

results_table5_cell31 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.9, theta = (0.25,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.05, 0.05)
corr12 = 0.9
corr13 = 0.9
corr23 = 0.9
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.05, 0.05)

results_table5_cell41 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)


### ------------------------------------------------------------------------------------------

# Table 5: p=0, theta = (0.25,0.25,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.05)
corr12 = 0
corr13 = 0
corr23 = 0
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.05)

results_table5_cell12 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.1, theta = (0.25,0.25,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.05)
corr12 = 0.1
corr13 = 0.1
corr23 = 0.1
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.05)

results_table5_cell22 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.5, theta = (0.25,0.25,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.05)
corr12 = 0.5
corr13 = 0.5
corr23 = 0.5
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.05)

results_table5_cell32 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.9, theta = (0.25,0.25,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.05)
corr12 = 0.9
corr13 = 0.9
corr23 = 0.9
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.05)

results_table5_cell42 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)


### ------------------------------------------------------------------------------------------

# Table 5: p=0, theta = (0.25,0.25,0.25) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.25)
corr12 = 0
corr13 = 0
corr23 = 0
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.25)

results_table5_cell13 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.1, theta = (0.25,0.25,0.25) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.25)
corr12 = 0.1
corr13 = 0.1
corr23 = 0.1
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.25)

results_table5_cell23 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.5, theta = (0.25,0.25,0.25) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.25)
corr12 = 0.5
corr13 = 0.5
corr23 = 0.5
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.25)

results_table5_cell33 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.9, theta = (0.25,0.25,0.25) ---------------------------------------------
set.seed(5)

means_alt = c(0.25, 0.25, 0.25)
corr12 = 0.9
corr13 = 0.9
corr23 = 0.9
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.25, 0.25, 0.25)

results_table5_cell43 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)


### ------------------------------------------------------------------------------------------

# Table 5: p=0, theta = (0.5,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.05 ,0.05)
corr12 = 0
corr13 = 0
corr23 = 0
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.05 ,0.05)

results_table5_cell14 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.1, theta = (0.5,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.05 ,0.05)
corr12 = 0.1
corr13 = 0.1
corr23 = 0.1
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.05 ,0.05)

results_table5_cell24 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.5, theta = (0.5,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.05 ,0.05)
corr12 = 0.5
corr13 = 0.5
corr23 = 0.5
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.05 ,0.05)

results_table5_cell34 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.9, theta = (0.5,0.05,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.05 ,0.05)
corr12 = 0.9
corr13 = 0.9
corr23 = 0.9
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.05 ,0.05)

results_table5_cell44 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)


### ------------------------------------------------------------------------------------------

# Table 5: p=0, theta = (0.5,0.5,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.05)
corr12 = 0
corr13 = 0
corr23 = 0
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.05)

results_table5_cell15 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.1, theta = (0.5,0.5,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.05)
corr12 = 0.1
corr13 = 0.1
corr23 = 0.1
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.05)

results_table5_cell25 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.5, theta = (0.5,0.5,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.05)
corr12 = 0.5
corr13 = 0.5
corr23 = 0.5
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.05)

results_table5_cell35 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.9, theta = (0.5,0.5,0.05) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.05)
corr12 = 0.9
corr13 = 0.9
corr23 = 0.9
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.05)

results_table5_cell45 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)


### ------------------------------------------------------------------------------------------

# Table 5: p=0, theta = (0.5,0.5,0.5) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.5)
corr12 = 0
corr13 = 0
corr23 = 0
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.5)

results_table5_cell16 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.1, theta = (0.5,0.5,0.5) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.5)
corr12 = 0.1
corr13 = 0.1
corr23 = 0.1
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.5)

results_table5_cell26 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.5, theta = (0.5,0.5,0.5) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.5)
corr12 = 0.5
corr13 = 0.5
corr23 = 0.5
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.5)

results_table5_cell36 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)

# Table 5: p=0.9, theta = (0.5,0.5,0.5) ---------------------------------------------
set.seed(5)

means_alt = c(0.5, 0.5 ,0.5)
corr12 = 0.9
corr13 = 0.9
corr23 = 0.9
p123 = 1/6 #category 1
p132 = 1/6 #category 2
p213 = 1/6 #category 3
p231 = 1/6 #category 4
p312 = 1/6 #category 5
p321 = 1/6 #category 6
MID = c(0.5, 0.5 ,0.5)

results_table5_cell46 = get_sampsize_3Dnormal(n, means_null, means_alt, corr12, corr13, corr23, p123, p132, p213, p231, p312, p321, MID, alpha, power)


### ------------------------------------------------------------------------------------------
