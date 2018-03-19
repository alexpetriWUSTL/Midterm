#' Computes e joint probability of all of the observed responses (P for correct and Q for incorrect) given the guess of theta
#'
#' Uses Object from class Rasch
#'
#' @param raschObj An object containing a students name, question item parameters 'a', and answers 'y'
#' @param theta A proposed numeric value for the 'ability' of the respondent
#'
#'
#' @return A calculated likelihood
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
#' @rdname raschModel_Likelihood
#' @export
setGeneric(name="raschModel_Likelihood",
           def=function(raschObj, theta)
           {standardGeneric("raschModel_Likelihood")}
)

#' @export
setMethod(f="raschModel_Likelihood",
          definition = function(raschObj, theta){
            PQ <- raschModel_Probability(raschObj, theta)[[2]]
            L <- prod(PQ)
            return(L)
          }
)

