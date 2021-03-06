crime <- readLines("crime.txt")

state <- "Alabama"
c <- strsplit(crime,",")
crimev <- as.numeric(c[[7]])
crimel <- as.list(crimev)
crimel[[length(crimev)+1]] <- state
crimed <- data.frame()
crimed <- rbind(crimed,crimel)
crimenames <- c(c[[6]],"State")
names(crimed) <- crimenames


for(i in 8:2904){
  if(length(c[[i]])>1){
    if(c[[i]][1]!="Year"){
      crimel <- as.list(as.numeric(c[[i]]))
      crimel[[length(crimel)+1]] <- state
      crimed <- rbind(crimed,crimel)
    }
  } else if((length(c[[i]])==1)&grepl("Estimated",c[[i]][1])){
    state <- substr(c[[i]][1],20,nchar(c[[i]][1]))
    levels(crimed$State) <- c(levels(crimed$State),state)
  }
  
  
}