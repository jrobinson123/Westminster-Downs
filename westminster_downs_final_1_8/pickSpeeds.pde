

void pickSpeeds(){
  randomSpeeds.clear();
  randomSpeeds.add(new RandomSpeeds());
  while(randomSpeeds.size() < 8){
    boolean breakLoop = false;
    //does temp like this work or should it be in an ArrayList
    temp = new RandomSpeeds();
    while(tieExists(temp)){
      temp = new RandomSpeeds();
    }
    int j = 0;
    while(j < randomSpeeds.size() && breakLoop == false){
      if(temp.frames < randomSpeeds.get(j).frames){
        randomSpeeds.add(j,temp);
        breakLoop = true;
      }else{
        j++;
      }
    }
    if(breakLoop == false){
      randomSpeeds.add(temp);
    }
  }
 /// for(int i = 0; i<randomSpeeds.size();i++){
 //   println(i,randomSpeeds.get(i).frames);
 // }
}

//checks whether there is a tie
boolean tieExists(RandomSpeeds randomSpeed){
  boolean tie = false;
  for(int i = 0; i<randomSpeeds.size();i++){
    if(randomSpeed.frames == randomSpeeds.get(i).frames){
      tie = true;
    }
  }
  return tie;
}
