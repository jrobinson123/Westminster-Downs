

int chooseWinner(){
  int randomNum = (int)random(1,501);
  if(randomNum <= horseWinOdds[0]){
    return 0;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1]){
    return 1;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1] + horseWinOdds[2]){
    return 2;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1] + horseWinOdds[2] + 
  horseWinOdds[3]){
    return 3;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1] + horseWinOdds[2] + 
  horseWinOdds[3] + horseWinOdds[4]){
    return 4;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1] + horseWinOdds[2] + 
  horseWinOdds[3] + horseWinOdds[4] + horseWinOdds[5]){
    return 5;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1] + horseWinOdds[2] + 
  horseWinOdds[3] + horseWinOdds[4] + horseWinOdds[5] + horseWinOdds[6]){
    return 6;
  }else if(randomNum <= horseWinOdds[0] + horseWinOdds[1] + horseWinOdds[2] + 
  horseWinOdds[3] + horseWinOdds[4] + horseWinOdds[5] + horseWinOdds[6] + horseWinOdds[7]){
    return 7;
  }else{
    return -1;
  }
}


void chooseOrder(){
  order.clear();
  int selection;
  while(order.size() < 8){
    selection = chooseWinner();
    while(selectionAllowed(selection) == false){
      selection = chooseWinner();
    }
    order.add(selection);
  }
  println(order);
}

boolean selectionAllowed(int selection){
  boolean allowed = true;
  for(int i = 0; i<order.size(); i++){
    if(selection == order.get(i)){
      allowed = false;
    }
  }
  return allowed;
}
