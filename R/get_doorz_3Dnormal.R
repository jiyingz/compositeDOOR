#' Determine overall win/tie/lose status (Z) comparing two patients from different groups
#' Outcome preference order categories are: 1 = 123; 2 = 132; 3 = 213; 4 = 231; 5 = 312; 6 = 321
#'
#' @param x A vector containing outcomes from a patient of group 1, preference order category (1-6) of patient of group 1, outcomes from a patient of group 2, and preference order category (1-6) of patient of group 2 (in that order)
#' @param MID A vector for minimum important difference values of each outcome
#' @return The Z indcator for whether patient 2 wins (1), ties (0.5), or loses (0) to patient 1 over all outcomes, given preferences
#'
get_doorz_3Dnormal <- function(x, MID){

  # Extract outcomes
  outcomes1 = x[1:3]
  outcomes2 = x[5:7]

  # Get win/tie/lose indicators for each outcome
  y = get_zij_per_outcome_normal(outcomes1, outcomes2, MID)

  # If ctrl and trt patient has same preference (x[4] == x[8]) and the preference is of category # (x[4] == #):
  if((x[4] == x[8]) & (x[4] == 1)) { # both have pref 123
    if(y[1] != 0.5) {z = y[1]} else {if(y[2] != 0.5){z = y[2]} else{z = y[3]}}} # if z1 not a tie, take that. otherwise, move down the line until get a tie breaker
  if((x[4] == x[8]) & (x[4] == 2)) { # both have pref 132
    if(y[1] != 0.5) {z = y[1]} else {if(y[3] != 0.5){z = y[3]} else {z = y[2]}}}
  if((x[4] == x[8]) & (x[4] == 3)) { # both have pref 213
    if(y[2] != 0.5) {z = y[2]} else {if(y[1] != 0.5){z = y[1]} else {z = y[3]}}}
  if((x[4] == x[8]) & (x[4] == 4)) { # both have pref 231
    if(y[3] != 0.5) {z = y[3]} else {if(y[1] != 0.5){z = y[1]} else {z = y[2]}}}
  if((x[4] == x[8]) & (x[4] == 5)) { # both have pref 312
    if(y[2] != 0.5) {z = y[2]} else {if(y[3] != 0.5){z = y[3]} else {z = y[1]}}}
  if((x[4] == x[8]) & (x[4] == 6)) { # both have pref 321
    if(y[3] != 0.5) {z = y[3]} else {if(y[2] != 0.5){z = y[2]} else {z = y[1]}}}

  # If the patients agree on top 1 priority outcome as first common set:
  if(((x[4] == 1) & (x[8] == 2)) | ((x[4] == 2) & (x[8] == 1))) { # prefs 132 and 123
    if(y[1] != 0.5) {z = y[1]} else {  # if z1 not a tie, take that. otherwise, in 2nd and 3rd outcomes,
      if(max(y[c(2,3)]) == 1 & min(y[c(2,3)]) > 0) {z=1} # if there is >=1 win and no loses, then overall result is win
      if(max(y[c(2,3)]) < 1 & min(y[c(2,3)]) == 0) {z=0} # if there is >=1 lose and no wins, then overall result is lose
      if(max(y[c(2,3)]) == 1 & min(y[c(2,3)]) == 0) {z=0.5}
      if(max(y[c(2,3)]) == 0.5 & min(y[c(2,3)]) == 0.5) {z=0.5}
    }
  }
  if(((x[4] == 3) & (x[8] == 5)) | ((x[4] == 5) & (x[8] == 3))) { # prefs 213 AND 312
    if(y[2] != 0.5) {z = y[2]} else {
      if(max(y[c(1,3)]) == 1 & min(y[c(1,3)]) > 0) {z=1}
      if(max(y[c(1,3)]) < 1 & min(y[c(1,3)]) == 0) {z=0}
      if(max(y[c(1,3)]) == 1 & min(y[c(1,3)]) == 0) {z=0.5}
      if(max(y[c(1,3)]) == 0.5 & min(y[c(1,3)]) == 0.5) {z=0.5}
    }
  }
  if(((x[4] == 4) & (x[8] == 6)) | ((x[4] == 6) & (x[8] == 4))) { # prefs 231 AND 321
    if(y[3] != 0.5) {z = y[3]} else {
      if(max(y[c(1,2)]) == 1 & min(y[c(1,2)]) > 0) {z=1}
      if(max(y[c(1,2)]) < 1 & min(y[c(1,2)]) == 0) {z=0}
      if(max(y[c(1,2)]) == 1 & min(y[c(1,2)]) == 0) {z=0.5}
      if(max(y[c(1,2)]) == 0.5 & min(y[c(1,2)]) == 0.5) {z=0.5}
    }
  }

  # If the patients agree on top 2 priority outcomes as first common set:
  if(((x[4] == 1) & (x[8] == 3)) | ((x[4] == 3) & (x[8] == 1))) { # outcome 1, 2 are prefs in common (123 and 213)
    if(max(y[c(1,2)]) == 1 & min(y[c(1,2)]) > 0) {z=1} # win if at least one win and no loses
    if(max(y[c(1,2)]) < 1 & min(y[c(1,2)]) == 0) {z=0} # lose if at least one lose and no wins
    if(max(y[c(1,2)]) == 1 & min(y[c(1,2)]) == 0) {z=0.5} # tie if one win, one lose
    if(max(y[c(1,2)]) == 0.5 & min(y[c(1,2)]) == 0.5) {z = y[3]} # if both tie, the third outcome gets to determine win status
  }
  if(((x[4] == 2) & (x[8] == 4)) | ((x[4] == 4) & (x[8] == 2))) { # outcomes 1, 3 are prefs in common (132 and 231)
    if(max(y[c(1,3)]) == 1 & min(y[c(1,3)]) > 0) {z=1}
    if(max(y[c(1,3)]) < 1 & min(y[c(1,3)]) == 0) {z=0}
    if(max(y[c(1,3)]) == 1 & min(y[c(1,3)]) == 0) {z=0.5}
    if(max(y[c(1,3)]) == 0.5 & min(y[c(1,3)]) == 0.5) {z = y[2]}
  }
  if(((x[4] == 5) & (x[8] == 6)) | ((x[4] == 6) & (x[8] == 5))) { # outcome 2, 3 are prefs in common (312 and 321)
    if(max(y[c(2,3)]) == 1 & min(y[c(2,3)]) > 0) {z=1}
    if(max(y[c(2,3)]) < 1 & min(y[c(2,3)]) == 0) {z=0}
    if(max(y[c(2,3)]) == 1 & min(y[c(2,3)]) == 0) {z=0.5}
    if(max(y[c(2,3)]) == 0.5 & min(y[c(2,3)]) == 0.5) {z = y[1]}
  }

  # If the patients agree on top 3 priority outcomes as first common set:
  # (Reminder: Outcome categories are: 1 = 123; 2 = 132; 3 = 213; 4 = 231; 5 = 312; 6 = 321)
  # The categories with first common set = all 3 outcomes are:
  # category 1 with 4, 5, 6
  # category 2 with 3, 5, 6
  # category 3 with 2, 4, 6
  # category 4 with 1, 3, 5
  # category 5 with 1, 2, 4
  # category 6 with 1, 2, 3
  # Unique combos are: 1-4, 1-5, 1-6, 2-3, 2-5, 2-6, 3-4, 3-6, 4-5
  if(((x[4] == 1) & (x[8] >= 4)) | ((x[4] >= 4) & (x[8] == 1)) | ((x[4] == 2) & (x[8] == 3)) | ((x[4] == 3) & (x[8] == 2)) |
     ((x[4] == 2) & (x[8] >= 5)) | ((x[4] >= 5) & (x[8] == 2)) |
     ((x[4] == 3) & (x[8] == 4)) | ((x[4] == 4) & (x[8] == 3)) | ((x[4] == 3) & (x[8] == 6)) | ((x[4] == 6) & (x[8] == 3)) |
     ((x[4] == 4) & (x[8] == 5)) | ((x[4] == 5) & (x[8] == 4))) {

    if(max(y[c(1,2,3)]) == 1 & min(y[c(1,2,3)]) > 0) {z=1} # win if at least one win and no loses
    if(max(y[c(1,2,3)]) < 1 & min(y[c(1,2,3)]) == 0) {z=0} # lose if at least one lose and no wins
    if(max(y[c(1,2,3)]) == 1 & min(y[c(1,2,3)]) == 0) {z=0.5} # tie if at least one win, at least one lose
    if(max(y[c(1,2,3)]) == 0.5 & min(y[c(1,2,3)]) == 0.5) {z=0.5} # tie if all outcomes tied
  }

  return(z)
}
