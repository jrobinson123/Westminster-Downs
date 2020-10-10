

void displayPitch(){
  
  //green pitch
  fill(13, 219, 99);
  noStroke();
  rectMode(CENTER);
  rect(650,400,1200,600);
 // noTint();
  //image(pitch,650,400);
  fill(153, 91, 15);
 // fill(120, 69, 6);
  //brown track
  rect(100,400,130,730,50);
  rect(1300,400,130,730,50);
  rect(700,100,1300,130,50);
  rect(700,700,1300,130,50);
  
  //display horses
  //for(int i = 0; i<horses.length;i++){
  //  horses[i].display();
 // }
 if(horses[order.get(0)].raceStarted == false){
    for(int i = 0; i<horses.length;i++){
      if(i != podium.get(0)){
        horses[i].display();
      }
    }
    horses[podium.get(0)].display();
 }else{
   for(int i = 0; i<horses.length;i++){
     horses[i].display();
    }
 }
 
  for(int i = 0; i<horses.length;i++){
    horses[i].update();
  }
  //vertical track lines
    //stroke(0);
  //  strokeWeight(0);
  //  line(100,100,100,700);
   // line(1300,100,1300,700);
    //horizontal track lines
   // line(100,100,1300,100);
   // line(100,700,1300,700);
}
