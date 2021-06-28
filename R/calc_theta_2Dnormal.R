#' Calculate Probability of Winning for 2D Normal Outcomes
#'
#' Uses exact integration to calculate theta = P(treatment patient wins over control patient) for 2D normal outcomes.
#' Sanity check: This should be 0.5 under the null
#'
#' @param d1 "True" difference (trt - ctrl) in outcome 1
#' @param d1 "True" difference (trt - ctrl) in outcome 2
#' @param corr12 Correlation between first and second outcomes
#' @param p_oc1 Probability of choosing outcome 1 as priority over outcome 2
#' @return Numerical value of theta = E(Z | 2D normal outcomes & input params) = P(trt patient wins over ctrl patient | 2D normal outcomes & input params)
calc_theta_2Dnormal <- function(d1, d2, corr12, p_oc1) {
  if (!requireNamespace("mvtnorm", quietly = TRUE)) {
    stop("Package \"mvtnorm\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  theta = mvtnorm::pmvnorm(lower = c(0, 0), upper = c(Inf, Inf), mean = c(d1, d2), sigma = 2 * matrix(c(1, corr12, corr12, 1), 2, 2)) +
          p_oc1 * mvtnorm::pmvnorm(lower = c(0, -Inf), upper = c(Inf, 0), mean = c(d1, d2), sigma = 2 * matrix(c(1, corr12, corr12, 1), 2, 2)) +
          (1 - p_oc1) * mvtnorm::pmvnorm(lower = c( -Inf, 0), upper = c(0, Inf), mean = c(d1, d2), sigma = 2 * matrix(c(1, corr12, corr12, 1), 2, 2))

  return(theta[1])
}
