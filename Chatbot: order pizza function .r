##Chatbot order pizza function
pizza_name <- c("hawaii", "chicken", "ham&cheese", "seafood")
price <- c(299,199,359,459)
pizza_list <- list(Name_pizza = pizza_name,
                   price = price                
)
data.frame(pizza_list)
  
topping_name <- c("extra cheese", "extra sauce", "extra meat", "extra fries")
topping_price <- c(29,29,49,59)
topping_list <- list(Name_topping = topping_name,
                     price = topping_price                
)
data.frame(topping_list)

chatbot <- function(){ 
  cat(" \n")
  print("Hi")
  print("What's your name?")
  userinput <- readLines("stdin", n=1)
  print(userinput)
  
  print("What do you want to order pizza")
  print("We have hawaii, chicken, ham&cheese and seafood pizza")    
  orderinput <- readLines("stdin", n=1)
  if(orderinput == "hawaii"){
      print(orderinput)
      ordervalue <- 299
      cat("the price is", ordervalue, "Bath")
      cat(" ", sep = "\n")
    } else if(orderinput == "chicken"){
      print(orderinput)
      ordervalue <- 199
          cat("the price is", ordervalue, "Bath")
          cat(" ", sep = "\n")
    } else if(orderinput == "ham&cheese"){
      print(orderinput)
      ordervalue <- 359
          cat("the price is", ordervalue, "Bath")
          cat(" ", sep = "\n")
    } else if(orderinput == "seafood"){
      print(orderinput)
      ordervalue <- 459
          cat("the price is", ordervalue, "Bath")
          cat(" ", sep = "\n")
    } else {
      print("OK, sir")
    }
    
  cat(" \n")
  while (TRUE) {
    print("Do you want to add some more topping?")
    toppinginput <- readLines("stdin", n=1)
    if (toppinginput == "yes") {
      toppinginput <- TRUE
      print("OK, what do you want ?")
      addtoppinginput <- readLines("stdin", n=1)
      if(addtoppinginput == "extra cheese") {
          print(addtoppinginput)
          toppingvalue <- 29
            cat("the price is",toppingvalue, "Bath")
            cat(" ", sep = "\n")
        } else if(addtoppinginput == "extra sauce") {
          print(addtoppinginput)
          toppingvalue <- 29
            cat("the price is",toppingvalue, "Bath")
            cat(" ", sep = "\n")
        } else if(addtoppinginput == "extra meat") {
          print(addtoppinginput)
          toppingvalue <- 49
            cat("the price is",toppingvalue, "Bath")
            cat(" ", sep = "\n")
        } else if(addtoppinginput == "extra fries") {
          print(addtoppinginput)
          toppingvalue <- 59
            cat("the price is",toppingvalue, "Bath")
            cat(" ", sep = "\n")
        } else {
        print ("go to check bill")
	      }
      break
    } else if (toppinginput == "no") {
      toppinginput <- FALSE
      print("go to check bill")
      toppingvalue <- 0
      break
    } else {
      print("Please answer with yes or no")
    }
  }
  cat("Total of bill is ", ordervalue + toppingvalue, "bath")
  cat(" \n")
}
chatbot()
