
boolean horsesStopped(){
  boolean stopped = true;
  for(int i = 0; i<horses.length; i++){
    if(horses[i].raceStarted == true){
      stopped = false;
    }
  }
  return stopped;
}

String chooseName(){
  String prefix = "";
  if(Math.random() > 0.8){
    prefix = prefixes[(int)random(11)];
  }
  int randStringPick = (int)random(names.length);
  while(pickAllowed(randStringPick, restrictedNameIndexes) == false){
    randStringPick = (int)random(names.length);
  }
  restrictedNameIndexes.add(randStringPick);
  if(prefix.equals("")){
    return names[randStringPick];
  }else{
    return prefix +" "+ names[randStringPick];
  }
}

color chooseColor(){
  color tempColor = color(0,0,0);
  int rand = (int)random(9);
  while(pickAllowed(rand,restrictedColorIndexes) == false){
      rand = (int)random(9);
  }
  restrictedColorIndexes.add(rand);
  if(rand == 0){
    tempColor = grays[(int)random(20)];
  }else if(rand == 1){
    tempColor = greens[(int)random(20)];
  }else if(rand == 2){
    tempColor = blues[(int)random(20)];
  }else if(rand == 3){
    tempColor = violets[(int)random(20)];
  }else if(rand == 4){
    tempColor = pinks[(int)random(20)];
  }else if(rand == 5){
    tempColor = browns[(int)random(20)];
  }else if(rand == 6){
    tempColor = reds[(int)random(20)];
  }else if(rand == 7){
    tempColor = oranges[(int)random(20)];
  }else if(rand == 8){
    tempColor = yellows[(int)random(20)];
  }
  return tempColor;
}

boolean pickAllowed(int pick, ArrayList<Integer> list){
  boolean seen = false;
  for(int i = 0; i < list.size(); i++){
    if(pick == list.get(i)){
      seen = true;
    }
  }

  return !seen;
}


boolean mouseHover(int x,int y,int xSize,int ySize){
  if(mouseX > x - xSize / 2 && 
  mouseX <  x + xSize / 2 &&
  mouseY > y - ySize / 2 &&
  mouseY < y + ySize / 2){
    return true;
  }else{
    return false;
  }
}


void loadSounds(){
  starterPistol = new SoundFile(this,"starterPistol1.wav");
  applause = new SoundFile(this,"crowdApplause.wav");
  commentary = new SoundFile[6];
  commentaryAmps = new float[6];
  commentaryAmps[0] = 0.04;
  commentaryAmps[1] = 0.1;
  commentaryAmps[2] = 0.08;
  commentaryAmps[3] = 0.06;
  commentaryAmps[4] = 0.06;
  commentaryAmps[5] = 0.16;
  
     
  
  commentary[0] = new SoundFile(this,"horseCommentary.wav");
  commentary[0].amp(commentaryAmps[0]);
  commentary[1] = new SoundFile(this,"horseCommentary2.wav");
  commentary[1].amp(commentaryAmps[1]);
  commentary[2] = new SoundFile(this,"horseCommentary3.wav");
  commentary[2].amp(commentaryAmps[2]);
  commentary[3] = new SoundFile(this,"horseCommentary4.wav");
  commentary[3].amp(commentaryAmps[3]);
  commentary[4] = new SoundFile(this,"horseCommentary5.wav");
  commentary[4].amp(commentaryAmps[4]);
  commentary[5] = new SoundFile(this,"horseCommentary6.wav");
  commentary[5].amp(commentaryAmps[5]);
  
  applauseAmplitude = 0.04;
  applause.amp(applauseAmplitude);
  starterPistol.amp(0.1);
}
