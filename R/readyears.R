#' Reading the txt file
#'
#' Takes in the William's Geographical Distribution data and returns a
#' clean format (Area, Number) that can be read into a data frame.
#'
#' @param dataset A Geographical Distribution dataset
#' @param name The name the cleaned dataset is saved to
#' @return A cleaned dataset
#'
#function to reformat majority of the text into a csv format
readYears <- function(dataset, name){
  input <- readLines(dataset, warn = FALSE)
  #takes out all of the excess periods in every dataset
  input <- gsub("[.]","",input)
  #takes out all of the spaces in each dataset
  input <- gsub(" ","",input)
  #Inserts a comma between the country and its value
  input <- gsub("([a-z])([0-9])", "\\1, \\2", input)
  #Puts spaces between every start of a new word
  input <- gsub("([a-z])([A-Z])", "\\1 \\2", input)
  #Puts spaces in between the values in the words
  input <- gsub("([0-9])([A-Z])", "\\1 \\2", input)
  write(input, file = name)
}

