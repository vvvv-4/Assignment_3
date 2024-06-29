#'Prepare a dictionary of words to choose from and save it in a txt file (one column) and save it in the project directory
# Created Dictionary.txt fils with names of animals/birds from A-Z

#'Read the word list from your program.
#'convert it to matrix so each word is indexable
list <- as.matrix(read.table("/Users/mausamvk/Assignment_3/Dictionary"))

#Choose a random element from the list. 
secret_word <- sample(list, 1)

#Inform the user on the length of the secret word. Hint: You may test nchar()
print(paste("The length of the secret word is",nchar(secret_word)))

#Inform the user about the number of wrong guesses/tries allowed. You decide on the rule here and implement it. Please comment your code appropriately.
print("Remember, you are allowed 15 guesses in total.")

#Ask for user input. The user is expected to enter one character only, check for this.
#Optional; check if the character is a letter
#Optional: make sure that both lower and upper case letters are acceptable and treated as equivalent
user_word <- readline(prompt = "Ready? Stready? GO! Input one character that may be in the secret word:")

if((grep("[A-Za-z]", user_word) > 1) | nchar(user_word) > 1) { # If user_word is not a letter OR user_word is greater than length 1
  print(paste("ERROR:", user_word,"is not a valid character.")) # print error message
} else { #otherwise
  input <- user_word #assign user_input variable to new variable input for downstream use
}

#Check to see if the user input is in the secret word.
#If yes, notify user and ask for next letter
#If not, notify user.

#If user has not exhausted the available tries, ask for the next letter.

#If tries are exhausted, notify user that they’ve lost. Reveal secret and exit.

#Make sure that your code never goes into an infinite loop, and always manages to exit gracefully (ie without throwing an error)

#Always notify the user about the correct letters/wrong letters, remaining tries.
