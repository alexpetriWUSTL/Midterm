#' Computes the probability for a one parameter item response model, or Rasch Model
#'
#' Uses Object from class Rasch
#'
#' @param raschObj An object containing a students name, question item parameters 'a', and answers 'y'
#' @param theta A proposed numeric value for the 'ability' of the respondent
#'
#'
#' @return A vector of length n that represents P for each question
#' @return . A vector of length n that represents P if they got the question correct and Q if wrong
#'  \item{object}{An object of class Rasch}
#' @author Alex Petri
#' @examples
#' 
#' raschObj <- new(name = "Jason", a = c(1,3,4,3,2), y = c(3,4,3,5,7))
#' theta <- c(5)
#' raschModel_Probability(raschObj = raschObj, theta = theta)
#' 
#' 
#' @seealso \code{\link{print}}
#' @rdname integrateIt
#' @export
setGeneric(name="integrateIt",
           def=function(x, y, from, Rule)
           {standardGeneric("integrateIt")}
           )

#' @export
setMethod(f="raschModel_Probability",
          definition = function(raschObj, theta){
            P <- exp(theta - raschObj@a)/(1 + exp(theta - raschObj@a))
            y <- raschObj@y
            PnQ <- vector(mode = "numeric", length = length(P))
            PQ <- matrix(c(P,y,PnQ), ncol = 3)
            for(i in seq_along(y)){
              if(PQ[i,2] == 0){
                PQ[i,3] <- 1 - PQ[i,1] 
              } else{
                PQ[i,3] <- PQ[i,1]
              }
            }
            return(list(PQ[,1], PQ[,3]))
          }
          
          )


