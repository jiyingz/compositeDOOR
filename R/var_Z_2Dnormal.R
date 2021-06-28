p2function <- function(x, d1, d2, corr12, p_oc1) {
  # Helper function -- d1, d2, corr12, p_oc1 params should be defined in var_Z_2Dnormal (parent) function below
  # pointwise probability under the alternative distn, times density under the null distn
  if (!requireNamespace("mvtnorm", quietly = TRUE)) {
    stop("Package \"mvtnorm\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  (
    pmvnorm(lower = c(x[1], x[2]), upper = c(Inf, Inf), mean = c(d1, d2), sigma = matrix(c(1, corr12, corr12, 1), 2, 2)) +
    p_oc1 * pmvnorm(lower = c(x[1], -Inf), upper = c(Inf, x[2]), mean = c(d1, d2), sigma = matrix(c(1, corr12, corr12, 1), 2, 2)) +
    (1 - p_oc1) * pmvnorm(lower = c( -Inf, x[2]), upper = c(x[1], Inf), mean = c(d1, d2), sigma = matrix(c(1, corr12, corr12, 1), 2, 2))
  ) ^ 2 *
    dmvnorm(x, mean = c(0, 0), sigma = matrix(c(1, corr12, corr12, 1), 2, 2))
}

p3function <- function(y, d1, d2, corr12, p_oc1) {
  # Helper function -- d1, d2, corr12, p_oc1 params should be defined in var_Z_2Dnormal (parent) function below
  # pointwise probability under the null, times density under the alt distn
  if (!requireNamespace("mvtnorm", quietly = TRUE)) {
    stop("Package \"mvtnorm\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  (
    mvtnorm::pmvnorm(lower = c( -Inf, -Inf), upper = c(y[1], y[2]), mean = c(0, 0), sigma = matrix(c(1, corr12, corr12, 1), 2, 2)) +
    p_oc1 * mvtnorm::pmvnorm(lower = c( -Inf, y[2]), upper = c(y[1], Inf), mean = c(0, 0), sigma = matrix(c(1, corr12, corr12, 1), 2, 2)) +
    (1 - p_oc1) * mvtnorm::pmvnorm(lower = c(y[1], -Inf), upper = c(Inf, y[2]),  mean = c(0, 0), sigma = matrix(c(1, corr12, corr12, 1), 2, 2))
  ) ^ 2 *
    dmvnorm(y, mean = c(d1, d2), sigma = matrix(c(1, corr12, corr12, 1), 2, 2))
}


#' Calculate Var(Z) for 2D Normal Outcomes
#'
#' Calculates the variance for Z under the null (d1=d2=0) or alternative (d1, d2 =/= 0) hypothesis under the assumption of equal sample sizes between treatment and control arms.
#'
#' @param d1 "True" difference (trt - ctrl) in outcome 1
#' @param d1 "True" difference (trt - ctrl) in outcome 2
#' @param corr12 Correlation between first and second outcomes
#' @param p_oc1 Probability of choosing outcome 1 as priority over outcome 2
#' @return A list containing 1) var = The numerical value of sigma^2 = Var(Z | 2D normal outcomes & input params) and 2) ps = A vector of (theta, p2, p3) used in calculation
var_Z_2Dnormal <- function(d1, d2, corr12, p_oc1) {

  if (!requireNamespace("mvtnorm", quietly = TRUE)) {
    stop("Package \"mvtnorm\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (!requireNamespace("cubature", quietly = TRUE)) {
    stop("Package \"cubature\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  theta = calc_theta_2Dnormal(d1, d2, corr12, p_oc1)
  p2 = cubature::adaptIntegrate(function(x, D1 = d1, D2 = d2, rho = corr12, pc = p_oc1) {p2function(x, d1, d2, corr12, p_oc1)}, lowerLimit = c( -Inf, -Inf), upperLimit = c(Inf, Inf))$integral
  p3 = cubature::adaptIntegrate(function(y, D1 = d1, D2 = d2, rho = corr12, pc = p_oc1) {p3function(y, d1, d2, corr12, p_oc1)}, lowerLimit = c( -Inf, -Inf), upperLimit = c(Inf, Inf))$integral

  sigma2 =  p2 + p3 - 2 * theta^2

  return(list(var = sigma2, ps = c(theta, p2, p3)))
}
