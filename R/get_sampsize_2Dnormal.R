#' Get means, SDs, and sample size for 2 normal outcomes
#'
#' @param means_null A vector (d1, d2) of outcome means under the null hypothesis, default = c(0, 0)
#' @param means_alt A vector of outcome means under the alternative hypothesis
#' @param corr12 Correlation between Normal outcomes 1 and 2, default = 0
#' @param p_oc1 Probability of choosing outcome 1 as priority over outcome 2, default = 1/2
#' @param MID A vector for minimum important difference values of each outcome, default = c(0, 0)
#' @param alpha The Type I error rate, default = 0.05
#' @param power The chance of detecting a significant difference when one exists; power = 1 - beta, where beta = Type II error rate, default power = 0.9
#' @return A list containing empirical monte carlo of estimates of (null means, alternative means, null SD, alternative SD, sample size)
#' @export

get_sampsize_2Dnormal <- function(means_null = c(0, 0), means_alt, corr12 = 0, p_oc1 = 1/2, MID = c(0, 0), alpha = 0.05, power = 0.9) {

  if(!(MID[1] == 0 & MID[2] == 0)) {
    return("MID != 0 is currently not supported yet in this version of the package.")
  }

  # E[Z] and SD(Z) under the null
  EZ.n = calc_theta_2Dnormal(d1 = means_null[1], d2 = means_null[2], corr12, p_oc1)
  sigma.n = sqrt(var_Z_2Dnormal(d1 = means_null[1], d2 = means_null[2], corr12, p_oc1)$var)

  ## E[Z] and SD(Z) under the alt
  EZ.a = calc_theta_2Dnormal(d1 = means_alt[1], d2 = means_alt[2], corr12, p_oc1)
  sigma.a = sqrt(var_Z_2Dnormal(d1 = means_alt[1], d2 = means_alt[2], corr12, p_oc1)$var)

  # Calculate sample size (for one arm)
  samp_size = calc_sampsize(alpha, power, theta_null = 0.5, theta_alt = EZ.a, sigma_null = sigma.n, sigma_alt = sigma.a)

  print(paste("The null mean is ", EZ.n, " and SD is ", sigma.n, ". ",
              "The alternative mean is ", EZ.a, " and SD is ", sigma.a, ". ",
              "The sample size required in the control arm is ", samp_size, ".", sep = ""))

  return(list(EZ.n, EZ.a, sigma.n, sigma.a, samp_size))
}
