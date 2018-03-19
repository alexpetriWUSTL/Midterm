#' Computes the height of the specified normal curve evaluated at theta with mu = 0, and theta = 3
#'
#' Uses Object from class Rasch
#'
#' @param theta A proposed numeric value for the 'ability' of the respondent
#'
#' @return A calculated likelihood
#'  \item{object}{An object of class Rasch}
#' @author Alex Petri
#' @examples
#' 
#' theta <- c(5)
#' raschModel_Prior(theta = theta)
#' 
#' 
#' @seealso \code{\link{Rasch}}
#' @rdname raschModel_Prior
#' @export
setGeneric(name="raschModel_Prior",
           def=function(theta)
           {standardGeneric("raschModel_Prior")}
)

#' @export
setMethod(f="raschModel_Prior",
          definition = function(theta){
            return(dnorm(theta, mean = 0, sd = 3))
          }
)