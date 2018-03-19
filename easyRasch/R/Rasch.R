#' A Rasch Model Object
#' 
#' Object of class \code{Rasch} are created for raschModel functions
#'
#' 
#' An object of the class "Rasch" has the following slots:
#' \itemize{
#' \item \code{name} A vector of the x values of the input
#' \item \code{a} A vector of question-item parameters
#' \item \code{y} A vector of answers for the respondent
#' }
#'
#' @author Alex Petri: \email{alexpetri@@wustl.edu}
#' @rdname Rasch
#' @export
setClass(Class="Rasch", 
         representation = representation(
           name = "character",
           a = "numeric",
           y = "numeric"
         ),
         prototype = prototype(
           name = c(),
           a = c(),
           y = c()
         )
)

#' @export
setMethod("initialize", "Rasch", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
) 


#' @export
setValidity("Rasch", function(object){ 
  if (!identical(length(object@a), length(object@y))){ #so the lengths aren't mismatched!
    return("The a and y arguments must have the same length")
  }
  #next we make sure the Name of the student is character
  else if (!is.character(object@name)){ 
    return("The students name must be of type character")
  }
}
)
