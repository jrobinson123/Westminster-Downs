
void setOdds(){
  firstFourOdds = 5 * (int)random(60,96);
  decideZerothHorseOdds();
  decideFirstThroughThirdHorseOdds();
  setFourthThroughSeventhHorse();
  int sum = 0;
  for(int i = 0; i<horseWinOdds.length;i++){
   // println(i + " " + horseWinOdds[i]);
    sum += horseWinOdds[i];
  }
 // println(sum);
//  println();
  
}

void decideZerothHorseOdds(){
  if(Math.random() > 0.7){
    //range of 190 to 250
    horseWinOdds[0] = 5 * (int)random(38,51);
  }else{
    //range of 125 to 185
    horseWinOdds[0] = 5 * (int)random(25,38);
  }
}

void decideFirstThroughThirdHorseOdds(){ 
  int oddsLeft = firstFourOdds - horseWinOdds[0];
  horseWinOdds[1]  =  (int)random(oddsLeft/4, 3 *(oddsLeft/4));
  oddsLeft -= horseWinOdds[1];
  horseWinOdds[2]  =  (int)random(oddsLeft/4, 3 *(oddsLeft/4));
  horseWinOdds[3] = firstFourOdds - horseWinOdds[0]- horseWinOdds[1]- horseWinOdds[2];
}

void setFourthThroughSeventhHorse(){
  int oddsLeft = 500 - firstFourOdds;
  horseWinOdds[4]  =  (int)random(oddsLeft/5, 3 *(oddsLeft/5));
  oddsLeft -= horseWinOdds[4];
  horseWinOdds[5]  =  (int)random(oddsLeft/5, 3 *(oddsLeft/5));
  oddsLeft -= horseWinOdds[5];
  horseWinOdds[6]  =  (int)random(oddsLeft/5, 4 *(oddsLeft/5));
  horseWinOdds[7] = 500 - firstFourOdds - horseWinOdds[4]- horseWinOdds[5]- horseWinOdds[6];
}
