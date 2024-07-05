#Mausam Vadakkayil 
#BTC1855H: Assignment 3 - HANGMAN

#'Prepare a dictionary of words to choose from and save it in a txt file (one column) and save it in the project directory
# Manually created Dictionary.txt file with names of animals/birds from A-Z

#' Plan:
#' Create a hangman function which when called runs the hangman game with these actions:

#' First select the random word from a list

#' Then initialize counter (guesses of letter, # of attempts)

#' Create a function to show the secret word as the user correctly guesses letter
#####' If letters in secret word is present in guess
#####' show letter
#####' otherwise show _

#'Create a repeating function to get user input(guess) - check if the character is a letter and only one letter, and that it has not already been guessed
#####' if guess is not "[A-za-z]" or nchar is not equal to 1,
#####' print error
#####' else if guess is in guesses
#####' print you have already guessed letter
#####' or return guess 

#'Create a while function of things to do while the game is not over, or active 
#####' show length of secret word
#####' show attempts remaining 
#####' show letters guessed
#####' show correct letter guessed in the secret word 

#Get user.input using readline function save to guess and guesses (keep tracks of old letters guessed)

#Check if user guess is correct/incorrect and reduce attempts left by 1
#####' if guess is in secret word
#####' print good guess
#####' otherwise 
#####' print bad guess
#####' reduce attempt by 1 after each iteration 

#Create conditions that dictate when game is over
#####' if all the letter in the secret word are in guesses
#####' print congrats the word is: secret_word
#####' and game will be over
#####' otherwise if attempets become 0
#####' print sorry you ran out of attempts, the word to guess was: secret_word
#####' and game will end 
#conditions for game over: either all guesses are found in secret_word, or, attempts == 0 

# Hangman 
# build hangman function
hangman <- function() {
  #list of words from txt file, convert it to matrix so each word is indexable
  list <- as.matrix(read.table("/Users/vv/Library/CloudStorage/OneDrive-UniversityofToronto/Summer 2024/BTC1855/Assignment_3Review/Dictionary"))
  #randomly select from the list
  secret_word <- sample(list, 1)
  
  #variables 
  guesses <- character(0) #keep track of guesses from user
  attempts <- 10 #total attempts allowed = 10
  game_over <- FALSE #set game_over to FALSE, until conditions are met for game_over
  
  #create a function to show word, based on if letter guessed is in the secret word
  show_word <- function(secret_word, guesses) { #create function acting on secret_word and guesses variables 
    show_letter <- ""
    for (letter in strsplit(secret_word, "") [[1]]) { #for every letter in secret_word
      if (letter %in% guesses) { #if the letter of a secret_word is in guesses 
        show_letter <- paste(show_letter, letter,  sep = " ") # show the letter
      } else {
        show_letter <- paste(show_letter, "_", sep = " ") #if not show _ in place of the letter
      }
    }
    return(show_letter)
  }
  
  # Repeat these sets of instructions: get user input, check if the character 
  # is a letter and only one letter, and that it has not already been guessed
  user_input <- function() {
    repeat { #repeat steps everytime user_input is called
      cat("\nPlease enter a letter:")
      guess <- readline(prompt = "")
      if((!grepl("[A-Za-z]", guess)) | nchar(guess) != 1) { # If guess is not a letter OR length of guess is greater than 1 (i.e. more than one letter)
        cat("\nERROR:", guess,"is not a valid character.") # print error message
      } else if (guess %in% guesses) { #otherwise check if guess has already been guessed (letter is already in guessed letters vector)
        cat("\nThe letter",guess,"has already been guessed. Try again:") #print message stating letter has already been guessed
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
    cat("\nLength of Secret Word (Hint: it's an animal/bird):", nchar(secret_word))
    cat("\nAttempts remaining:", attempts) 
    cat("\nGuessed letters:", guesses)
    cat("\nCurrent Word:", show_word(secret_word, guesses))
    cat("\n||||||||||||||||||||||||||||||")
    cat("\n")
    cat("\n------------------------------")
    
    #get a guess from user 
    guess <- user_input()
    guesses <- c(guesses, guess) #concatenate old guesses with the new guess
    
    #check if user guess is correct/incorrect, reduce attempts left by 1
    if (guess %in% strsplit(secret_word, "")[[1]]) { #use strsplit to split secret_word to indivdiual letters and compare with letter in guess, if guess is in secret word
      cat("\nGood guess! You're right!") #print good guess
    } else {
      cat("\nBad Guess :( But you can try again!") #if not, print bad guess and...
      attempts <- attempts - 1 #reduce attempts left by 1
    }
  
   #conditions for game over: either all guesses are found in secret_word, or, attempts == 0 
  
    if (all(strsplit(secret_word, "")[[1]] %in% guesses)) { #condition 1 for game over, characters in secret_word are in guesses
      cat("\nCONGRATULATIONS! You guessed the correct word:", secret_word, "WOHOOO!") 
      game_over <- TRUE 
    } else if (attempts == 0) { #condition 2 for game over, run out of attempts 
      cat("\nOH NO LOSERRR! The game is over :( You did not guess the word:", secret_word)
      game_over <- TRUE 
    }
  }
}

hangman() #call hangman function to run the game

#####################################
#Code Review from Mingwei 
#Your plan is very elaborate and I like how you decided what you want your script to do before execution. 
#The show_word function is smart. I didnt use a loop when trying to displaying my words which made things a bit difficult. 
#
