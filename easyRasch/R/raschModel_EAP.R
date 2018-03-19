#' Uses the base function integrate() in r to compute the expected a posteriori value for Theta
#'
#' Uses Object from class Rasch
#'
#' @param raschObj An object containing a students name, question item parameters 'a', and answers 'y'
#' @param theta A proposed numeric value for the 'ability' of the respondent
#' @param lower The lower limits of integration (default this to -6)
#' @param upper  The lower limits of integration (default this to 6)
#'
#'
#' @return A estimated value for theta
#'  \item{object}{An object of class Rasch}
#' @author Alex Petri
#' @examples
#' 
#' raschObj <- new(name = "Jason", a = c(1,3,4,3,2), y = c(3,4,3,5,7))
#' theta <- c(5)
#' raschModel_Likelihood(raschObj = raschObj, theta = theta)
#' 
#' 
#' @seealso \code{\link{Rasch}}
#' @rdname raschModel_EAP
#' @export
setGeneric(name="raschModel_EAP",
           def=function(raschObj, theta, upper, lower)
           {standardGeneric("raschModel_EAP")}
)

#' @export
setMethod(f="raschModel_EAP",
          definition = function(raschObj, theta, upper = 6, lower = -6){ #default upper and lower values
              L <- raschModel_Likelihood(raschObjJason, the) #subset L to take on the Likelihood value
              pi <- raschModel_Prior(theta) #subset pi to take on Prior value
              numerator <- function(theta){ #create a function for the numerator of the equation
                theta*L*pi
              }
              denominator <- function(theta){ #create a function for the denominator of the equation
                (theta-theta) + L*pi
              }
              num <- integrate(numerator, lower = lower, upper = upper) #utilize numerator function to compute integral
              den <- integrate(denominator, lower = lower, upper = upper) #utilize denominator function to compute integral
              return(num$value/den$value) #return the division of the two integrals
          }
)
