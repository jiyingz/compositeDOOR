#' Get win/tie/lose indicator per outcome (for normal outcomes)
#' For example, if patient 1 has outcome values c(-1, 0, 2) and patient 2 has outcomes c(1, 0, 0) and the minimum important difference (MID) is 0 for all 3 outcomes, and greater values are better,
#' then this function will return c(1, 0.5, 0) for a win in outcome 1, a tie in outcome 2, and a lose in outcome 3 (patient 2 compared to patient 1).
#' Used in the get_doorz_3Dnormal() function.
#'
#' @param outcomes1 A vector containing outcomes from a patient of group 1
#' @param outcomes2 A vector containing outcomes from a patient of group 2
#' @param MID A vector for minimum important difference values of each outcome
#' @return A vector of length 3, containing 3 indicators: 1 if patient from group 2 wins in that outcome over patient from group 1, 0.5 if tied, and 0 if lose

get_zij_per_outcome_normal <- function(outcomes1, outcomes2, MID) {

  # Get number of outcomes
  n_outcomes = length(outcomes1)

  # Get outcome differences (group 2 - group 1)
  diff = outcomes2 - outcomes1

  # Get win/tie/lose indicators for each outcome
  y = rep(0.5, n_outcomes) # initialize all outcomes as ties
  y[diff > MID] = 1 # change to win if trt outcome - ctrl outcome > mids
  y[-diff > MID] = 0 # change to lose if trt outcome - ctrl outcome < mids

  return(y)
}
