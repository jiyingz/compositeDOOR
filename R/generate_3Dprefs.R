#' Generate the endpoint ordering preferences for patients
#'
#' @param n Sample size
#' @param p123 Probability of choosing endpoint order 1, 2, 3 (Category 1)
#' @param p132 Probability of choosing endpoint order 1, 3, 2 (Category 2)
#' @param p213 Probability of choosing endpoint order 2, 1, 3 (Category 3)
#' @param p231 Probability of choosing endpoint order 2, 3, 1 (Category 4)
#' @param p312 Probability of choosing endpoint order 3, 1, 2 (Category 5)
#' @param p321 Probability of choosing endpoint order 3, 2, 1 (Category 6)
#' @return A vector of length n containing preference categories sampled using given probabilities
#' @export

generate_3Dprefs <- function(n, p123 = 1/6, p132 = 1/6, p213 = 1/6, p231 = 1/6, p312 = 1/6, p321 = 1/6) {

  probpref = c(p123, p132, p213, p231, p312, p321)

  return(sample(c(1:6), n, replace = T, prob = probpref))
}

