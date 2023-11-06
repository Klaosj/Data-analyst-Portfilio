##pao ying chub
#player1_score
 player1_win   <- 0
 player1_draw  <- 0
 player1_lose  <- 0
 print("player1")
 player1_score <- list( Win  = player1_win,
                        draw = player1_draw,
                        lose = player1_lose  
 )
 data.frame(player1_score)
 #player2_score
 player2_win   <- 0
 player2_draw  <- 0
 player2_lose  <- 0
 print("player2")
 player2_score <- list( Win  = player2_win,
                        draw = player2_draw,
                        lose = player2_lose  
 )
 data.frame(player2_score)

 Pao_yang_chub <- function(){
   while(TRUE){
   cat("\n")
   print("Do you want to play")
   playying <- readLines("stdin", n=1)
   if (playying == "yes"){
       playying <- TRUE
       print("OK, let's start ")

     element <- c("rock", "siscross", "paper")
     player1 <- sample(element, size =1)
     player2 <- sample(element, size =1)
     ## win situation
     if (player1  == "rock" & player2 == "siscross"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you win")
     player1_win  <- player1_win +1
     player2_lose <- player2_lose +1
   } else if (player1  == "siscross" & player2 == "paper"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you win")
     player1_win  <- player1_win +1
     player2_lose <- player2_lose +1
   } else if (player1  == "paper" & player2 == "rock"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you win")
     player1_win  <- player1_win +1
     player2_lose <- player2_lose +1
   }
     ## lose situation
     else if (player2  == "rock" & player1 == "siscross"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you lose")
     player2_win  <- player2_win +1
     player1_lose <- player1_lose +1
   } else if (player2  == "siscross" & player1 == "paper"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you lose")
     player2_win  <- player2_win +1
     player1_lose <- player1_lose +1
   } else if (player2  == "paper" & player1 == "rock"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you lose")
     player2_win  <- player2_win +1
     player1_lose <- player1_lose +1
   }
     ## draw situation
     else if (player1  == "rock" & player2 == "rock"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you draw")
     player1_draw <- player1_draw +1
     player2_draw <- player2_draw +1
   } else if (player1  == "siscross" & player2 == "siscross"){
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you draw")
     player1_draw <- player1_draw +1
     player2_draw <- player2_draw +1
   } else if (player1  == "paper" & player2 == "paper") {
     cat("player1 :",player1, "\n")
     cat("player2 :",player2, "\n")
     print("you draw")
     player1_draw <- player1_draw +1
     player2_draw <- player2_draw +1
   }
     data.frame(player1_score)
     data.frame(player2_score)
     } else if (playying == "quit") {
       playying <- FALSE
       print("see you again")
       cat("\n")
       break
     } else {
       print("Please answer with yes or quit")
       cat("\n")
     } 
   }
   player1_score <- list( Win  = player1_win,
                          draw = player1_draw,
                          lose = player1_lose  
    )
   print("player1")
   print(data.frame(player1_score))
   cat("\n")
   
   player2_score <- list( Win  = player2_win,
                          draw = player2_draw,
                          lose = player2_lose  
    )
    print("player2")
    print(data.frame(player2_score))
    cat("\n")
 }

 Pao_yang_chub()
