#' Get means, SDs, and sample size for 3 normal outcomes
#'
#' @param n Number of Monte Carlo samples to generate
#' @param means_null A vector of outcome means under the null hypothesis, default = c(0, 0, 0)
#' @param means_alt A vector of outcome means under the alternative hypothesis
#' @param corr12 Correlation between Normal outcomes 1 and 2, default = 0
#' @param corr13 Correlation between Normal outcomes 1 and 3, default = 0
#' @param corr23 Correlation between Normal outcomes 2 and 3, default = 0
#' @param p123 Probability of choosing endpoint order 1, 2, 3 (Category 1)
#' @param p132 Probability of choosing endpoint order 1, 3, 2 (Category 2)
#' @param p213 Probability of choosing endpoint order 2, 1, 3 (Category 3)
#' @param p231 Probability of choosing endpoint order 2, 3, 1 (Category 4)
#' @param p312 Probability of choosing endpoint order 3, 1, 2 (Category 5)
#' @param p321 Probability of choosing endpoint order 3, 2, 1 (Category 6)
#' @param MID A vector for minimum important difference values of each outcome, default = c(0, 0, 0)
#' @param alpha The Type I error rate, default = 0.05
#' @param power The chance of detecting a significant difference when one exists; power = 1 - beta, where beta = Type II error rate, default power = 0.9
#' @return A list containing empirical monte carlo of estimates of (null means, alternative means, null SD, alternative SD, sample size)
#' @export

get_sampsize_3Dnormal <- function(n, means_null = c(0, 0, 0), means_alt, corr12 = 0, corr13 = 0, corr23 = 0, p123 = 1/6, p132 = 1/6, p213 = 1/6, p231 = 1/6, p312 = 1/6, p321 = 1/6, MID = c(0, 0, 0), alpha = 0.05, power = 0.9) {

  # Generate outcomes for control samples
  ctrl_samp1 = generate_3Dnormal_outcomes(n, means_null, corr12, corr13, corr23)
  ctrl_prefs1 = generate_3Dprefs(n, p123, p132, p213, p231, p312, p321)
  ctrl_samp2 = generate_3Dnormal_outcomes(n, means_null, corr12, corr13, corr23)
  ctrl_prefs2 = generate_3Dprefs(n, p123, p132, p213, p231, p312, p321)
  ctrl_samp3 = generate_3Dnormal_outcomes(n, means_null, corr12, corr13, corr23)
  ctrl_prefs3 = generate_3Dprefs(n, p123, p132, p213, p231, p312, p321)

  # Generate outcomes for treatment samples
  trt_samp1 = generate_3Dnormal_outcomes(n, means_alt, corr12, corr13, corr23)
  trt_prefs1 = generate_3Dprefs(n, p123, p132, p213, p231, p312, p321)
  trt_samp2 = generate_3Dnormal_outcomes(n, means_alt, corr12, corr13, corr23)
  trt_prefs2 = generate_3Dprefs(n, p123, p132, p213, p231, p312, p321)

  # Compare control to control to get empirical null mean and variance
  zout12.n = apply(cbind(ctrl_samp1, ctrl_prefs1, ctrl_samp2, ctrl_prefs2), 1, get_doorz_3Dnormal, MID)
  zout13.n = apply(cbind(ctrl_samp1, ctrl_prefs1, ctrl_samp3, ctrl_prefs3), 1, get_doorz_3Dnormal, MID)
  zout23.n = apply(cbind(ctrl_samp2, ctrl_prefs2, ctrl_samp3, ctrl_prefs3), 1, get_doorz_3Dnormal, MID)

  # Compare control to treatment to get empirical alternative mean and variance
  zout14.a = apply(cbind(ctrl_samp1, ctrl_prefs1, trt_samp1, trt_prefs1), 1, get_doorz_3Dnormal, MID)
  zout15.a = apply(cbind(ctrl_samp1, ctrl_prefs1, trt_samp2, trt_prefs2), 1, get_doorz_3Dnormal, MID)
  zout24.a = apply(cbind(ctrl_samp2, ctrl_prefs2, trt_samp1, trt_prefs1), 1, get_doorz_3Dnormal, MID)


  # E[Z] under the null and alternative hypotheses
  EZ.n = mean(c(zout12.n, zout13.n, zout23.n))
  EZ.a = mean(c(zout14.a, zout15.a, zout24.a))

  # Var(Z) under the null and alternative hypotheses
  p12.n = mean(c(zout12.n * zout13.n, zout23.n * zout13.n)) #correlation
  sigma.n = sqrt(2 * (p12.n - 0.5^2))

  p12.a = mean(zout14.a * zout15.a) #correlation
  p21.a = mean(zout14.a * zout24.a)
  sigma.a = sqrt(p12.a + p21.a - 2 * EZ.a^2)

  # Calculate sample size (for one arm)
  samp_size = calc_sampsize(alpha, power, theta_null = 0.5, theta_alt = EZ.a, sigma_null = sigma.n, sigma_alt = sigma.a)

  print(paste("The null mean is ", EZ.n, " and SD is ", sigma.n, ". ",
              "The alternative mean is ", EZ.a, " and SD is ", sigma.a, ". ",
              "The sample size required in the control arm is ", samp_size, ".", sep = ""))

  return(list(EZ.n, EZ.a, sigma.n, sigma.a, samp_size))
}
