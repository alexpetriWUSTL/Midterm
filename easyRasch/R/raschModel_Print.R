#' Printing the subject and their EAP score
#'
#' This function prints out the result of of raschModel_EAP and the name of the subject
#'
#' @param raschObj An object containing a students name, question item parameters 'a', and answers 'y'
#' @param theta A proposed numeric value for the 'ability' of the respondent
#' @param lower The lower limits of integration (default this to -6)
#' @param upper  The lower limits of integration (default this to 6)
#'
#' @author Alex Petri
#' @examples
#' 
#' raschObj <- new(name = "Jason", a = c(1,3,4,3,2), y = c(3,4,3,5,7))
#' theta <- c(5)
#' result <- raschModel_EAP(raschObj = raschObj, theta = theta, upper = 6, lower = -6)
#' print(result)
#' 
#' 
#' @seealso \code{\link{Rasch}}
#' @rdname raschModel_Print
#' @export
setMethod(f="print",
          definition = function(raschObj, theta, upper = 6, lower = -6){
            EAP <- raschModel_EAP(raschObj, theta, upper, lower) #create the EAP stat
            EAP <- as.character(EAP) #change it to character
            name <- raschObj@name #subset name
            paste(EAP, name, sep = ", ") #paste together
          }
          )



