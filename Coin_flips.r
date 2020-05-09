money<-10
guesses<-as.character(sample(c(0,1),2,T))
f = T
while(money>0 &&length(guesses)<=53){
  cat("\ninput 'h' if your guess is heads and 't' if it is tails")
  your_current_guess<- readLines(con = stdin(),n=1)
  
  if(your_current_guess != "h" && your_current_guess!="t"){
    f=F
    break
  }
  
  guesses<-append(guesses,your_current_guess,after = 0)
  
  guesses[guesses=="h"] = 1
  guesses[guesses=="t"] = 0
  guesses <- as.integer(guesses) 
  if (length(guesses)<=5){
    pf=0.7
  }else{
    dife_user <- abs(diff(guesses))
    pf <- sum(dife_user)/length(dife_user)
  }
  if (runif(1) < pf){
    thistoss = guesses[2]
  } else {
    thistoss = 1-guesses[2]
  }
  if (guesses[1]==thistoss){
    money=money+1
    cat("correct, you win $1 your money at the moment is",paste0("$",money))
  }else{
    money=money-1
    cat("incorrect, you lost $1, your money at the moment is",paste0("$",money))
  }
}
if(money == 0){
  cat("\nSorry, you have lost")
}else if(f){
  cat("\ncongratulation, you win $",money)
}else{
  cat("\nyou input a wrong option")
}
