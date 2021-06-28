#' Generate 3 Normal Outcomes
#'
#' This function takes given parameters and generates n Monte Carlo samples of 3 normally distributed outcomes per patient.
#'
#' @param n Sample size
#' @param means A vector of outcome means under the alternative hypothesis
#' @param corr12 Correlation between Normal outcomes 1 and 2, default = 0
#' @param corr13 Correlation between Normal outcomes 1 and 3, default = 0
#' @param corr23 Correlation between Normal outcomes 2 and 3, default = 0
#' @return A nx3 matrix with 3 normally distributed outcome values per row
#' @export

generate_3Dnormal_outcomes <- function(n, means, corr12 = 0, corr13 = 0, corr23 = 0){
  if (!requireNamespace("mvtnorm", quietly = TRUE)) {
    stop("Package \"mvtnorm\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  # Build correlation matrix for 3 normal outcomes
  msigma = matrix(c(  1,     corr12,    corr13,
                    corr12,     1,      corr23,
                    corr13,  corr23,      1   ),
                  nrow = 3, ncol = 3, byrow = TRUE)

  # Means
  mu = matrix(means, nrow = 3, ncol = 1, byrow = FALSE)

  # Generate 3 normal outcomes per patient
  return(mvtnorm::rmvnorm(n, mean = mu, sigma = msigma))
}
