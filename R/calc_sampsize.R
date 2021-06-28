#' Calculate sample size for one arm
#'
#' @param alpha The Type I error rate (default = 0.05)
#' @param power The chance of detecting a significant difference when one exists; power = 1 - beta, where beta = Type II error rate (default power = 0.9)
#' @param theta_null The null mean (default = 0.5)
#' @param theta_alt The alternative mean
#' @param sigma_null The null standard deviation
#' @param sigma_alt The alternative standard deviation
#' @return The calculated sample size, via the formula: (z_{1-alpha/2} x sigma_null + z_{1-beta} x sigma_null)^2 / (theta_alt - theta_null)^2

calc_sampsize <- function(alpha = 0.05, power = 0.9, theta_null = 0.5, theta_alt, sigma_null, sigma_alt) {
  return((qnorm(1 - alpha/2) * sigma_null + qnorm(power) * sigma_alt)^2 / (theta_alt - theta_null)^2)
}

