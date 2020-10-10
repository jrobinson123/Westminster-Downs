

class LeaderBoard{
  
  LeaderBoardIcon[] icons;
  int x,y;
  LeaderBoard(){
    icons = new LeaderBoardIcon[8];
    y = 220;
    x = 700;
    for(int i = 0; i<icons.length;i++){
      icons[i] = new LeaderBoardIcon(i,x,y + i * 50);
    }
  }
  void display(){
    for(int i = 0; i<icons.length;i++){
      icons[i].display();
    }
    
  }
}

class LeaderBoardIcon{
  int podiumIndex;
  int x,y;
  color rectColor;
  color textColor;
  LeaderBoardIcon(int podiumIndex, int x, int y){
    this.podiumIndex = podiumIndex;
    this.x = x;
    this.y = y;
  }
  void display(){
    textSize(20);
    textAlign(LEFT);
    noStroke();
    strokeWeight(1);
    stroke(0);
  
  
   // fill(horses[podium.get(podiumIndex)].red,horses[podium.get(podiumIndex)].green,horses[podium.get(podiumIndex)].blue);
    fill(horses[podium.get(podiumIndex)].Color);
    rect(x,y,200,50);
    showCorrectTextColor();
    text(podiumIndex + 1 + ": " + horses[podium.get(podiumIndex)].name,x - 80,y);
  }
  void showCorrectTextColor(){
    float average = (horses[podium.get(podiumIndex)].red 
    + horses[podium.get(podiumIndex)].green
    + horses[podium.get(podiumIndex)].blue) / 3;
    if(average < 128){
      fill(255);
    }else{
      fill(0);
    }
  }
}


void computeLeaderBoard(){
  podium.clear();
  boolean breakAway = false;
  podium.add(0);
  for(int i = 1; i<horses.length; i++){
    int j = 0;
    breakAway = false;
    while(j < podium.size() && breakAway == false){
      if(horses[i].distanceTravelled > horses[podium.get(j)].distanceTravelled){
        podium.add(j,i);
        breakAway = true;
      }else{
        j++;
      }
    }
    if(breakAway == false){
      podium.add(i);
    }
  }
}
