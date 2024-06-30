#'Prepare a dictionary of words to choose from and save it in a txt file (one column) and save it in the project directory
# Created Dictionary.txt file with names of animals/birds from A-Z

# hangman function
hangman <- function() {
  #list of words from txt file, convert it to matrix so each word is indexable
  list <- as.matrix(read.table("/Users/mausamvk/Assignment_3/Dictionary"))
  #randomly select from the list
  secret_word <- sample(list, 1)
  
  #variables 
  guesses <- character(0)
  attempts <- 10
  game_over <- FALSE
  
  #create a function to show word, based on if letter guessed is in the secret word
  show_word <- function(secret_word, guesses) {
    show_letter <- ""
    for (letter in strsplit(secret_word, "") [[1]]) {
      if (letter %in% guesses) {
        show_letter <- paste(show_letter, letter,  sep = " ")
      } else {
        show_letter <- paste(show_letter, "_", sep = " ")
      }
    }
    return(show_letter)
  }
  
  # Repeat these sets of instructions: get user input, check if the character 
  # is a letter and only one letter, and that it has not already been guessed
  user_input <- function() {
    repeat {
      cat("\nPlease enter a letter:")
      guess <- readline(prompt = "")
      if((grep("[A-Za-z]", guess) > 1) | nchar(guess) != 1) { # If user_word is not a letter OR user_word is greater than length 1 OR if guess does not contain any letters (contains numbers or other characters instead) and the length of the grep vector is 0
        cat("\nERROR:", guess,"is not a valid character.") # print error message
      } else if (guess %in% guesses) { #otherwise
        cat("\nThe letter",guess,"has already been guessed. Try again:")
      } else {
        return(guess)
      }
    }
  }
  
  #### game setup
  
  while(!game_over) { #notify the user about the length of secret word, correct letters/wrong letters, remaining tries at all times
    cat("\n------------------------------") #formatting to look nice
    cat("\n") #space
    cat("\n||||||||||||||||||||||||||||||")
    cat("\nLength of Secret Word:", nchar(secret_word))
    cat("\nAttempts remaining:", attempts) 
    cat("\nGuessed letters:", guesses)
    cat("\nCurrent Word:", show_word(secret_word, guesses))
    cat("\n||||||||||||||||||||||||||||||")
    cat("\n")
    cat("\n------------------------------")
    
    #get a guess from user 
    guess <- user_input()
    guesses <- c(guesses, guess)
    
    #check if user guess is correct/incorrect, reduce attempts left by 1
    if (guess %in% strsplit(secret_word, "")[[1]]) {
      cat("\nGood guess! You're right!")
    } else {
      cat("\nBad Guess :( But you can try again!")
      attempts <- attempts - 1
    }
  
   #conditions for game over: either all guesses are found in secret_word, or, attempts == 0 
  
    if (all(strsplit(secret_word, "")[[1]] %in% guesses)) {
      cat("\nCONGRATULATIONS! You guessed the correct word:", secret_word, "WOHOOO!")
      game_over <- TRUE
    } else if (attempts == 0) {
      cat("\nOH NO LOSERRR! The game is over :( You did not guess the word:", secret_word)
      game_over <- TRUE
    }
  }
}

hangman()
