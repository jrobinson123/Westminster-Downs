

class Horse{
  //x and y pos of the horse
  int x,y;
  int red,green,blue;
  String direction;
  boolean raceStarted;
  // int[] describing the speeds the horse will travel at and its index
  int[] speeds;
  int speed;
  int speedIndex;
  int lap;
  int horseIndex;
  int controlRotation;
  float degrees;
  String name;
  boolean halfSpeed = false;
  
  int imgIndex;
  int framesCounter;
  String colorHexString;
  int colorHexInt;
  color Color;
  SoundFile audio;
  float audioStartPoint;
  boolean inBottomSection;
  boolean audioStartedPlaying;
  //total number of pixels travelled by the horse in a match
  int distanceTravelled;
  Horse(int horseIndex, String name, color Color, SoundFile audio){
    x = 100;
    y = 100;
    imgIndex = 7;
    
    //Color = color(red,green,blue);
   // Color =   reds[(int)random(20)];
   // Color =   yellows[(int)random(20)];
   // Color =   oranges[(int)random(20)];
   //Color = pinks[(int)random(20)];
  // Color = grays[(int)random(20)];
   this.Color = Color;
   red = (int)red(Color);
    green = (int)green(Color);
    blue = (int)blue(Color);
   //Color = color(255,0,0);
   // colorHexString = hex(c);
  //  colorHexInt = int(colorHexString);
   // println(colorHexInt);
    direction = "right";
    speeds = new int[60];
    speeds[0] = 10;
    distanceTravelled = 0;
    lap = 1;
    raceStarted = false;
    this.horseIndex = horseIndex;
    this.name = name;
    
    this.audio = audio;
    this.audio.amp(0.07);
    audioStartPoint = random(audio.duration());
    audioStartedPlaying = false;
    inBottomSection = false;
    /*images[0] = loadImage("horse-run-00-resized.png");
    images[1] = loadImage("horse-run-01-resized.png");
    images[2] = loadImage("horse-run-02-resized.png");
    images[3] = loadImage("horse-run-03-resized.png");
    images[4] = loadImage("horse-run-04-resized.png");
    images[5] = loadImage("horse-run-05-resized.png");
    images[6] = loadImage("horse-run-06-resized.png");
    images[7] = loadImage("horse-bend-00-resized.png");
    images[8] = loadImage("horse-bend-01-resized.png");
    images[9] = loadImage("horse-bend-02-resized.png");
    images[10] = loadImage("horse-bend-03-resized.png");
    */
    
    
    degrees = 0;
  }
  void display(){
    imageMode(CENTER);
   /* strokeWeight(1);
    stroke(0);
    fill(red,green,blue);
    rect(x,y,35,35);
    textAlign(CENTER,CENTER);
    textSize(30);
    fill(0);
    text(horseIndex,x,y);
    */
  //  pushMatrix();
    //photoshop the horses to center them
   // translate(x ,y);
  //  translate(x,y);
   // if(inBottomSection == true){
  ////    scale(-1,1);
  //  }else{
  //    scale(1,1);
  //  }
    //rotate(radians(degrees));
   // tint(Color);
    tint(Color);
    
    if(direction.equals("right")){
       image(images[imgIndex],x,y,192,144);
    }else if(direction.equals("down")){
       image(imagesDown[imgIndex],x,y,144,192);
    }else if(direction.equals("left")){
       image(imagesLeft[imgIndex],x,y,192,144);
    }else if(direction.equals("up")){
       image(imagesUp[imgIndex],x,y,144,192);
    }
    ///image(images[imgIndex],0,0,178,117);
  // image(images[imgIndex],0,0,50,50);
  //image(images[imgIndex],0,0,100,100);
    //fill(0);
   // rect(x,y,50,50);
    
   // popMatrix();
    //fill(Color);
   // rect(x,y,50,50);
    /*
    if(raceStarted){
      if(imgIndex < 6){
         imgIndex++;
      }else{
         imgIndex = 0;
      }
    }else{
      imgIndex = baseNodIndex;
    }
    */
   
    /*else{
      if(imgIndex < 10){
        if(framesCounter %16 == 0){
          imgIndex++;
        }
      }else{
        imgIndex = 7;
        framesCounter = 0;
      }
      framesCounter++;
    }
    */
    if(raceStarted){
      if(audio.isPlaying() == false){
        audio.jump(0);
        }
      
        if(halfSpeed == true){
          
            if(imgIndex < 6){
              if(framesCounter%2 == 0){
                 imgIndex++;
                }
                framesCounter++;
            }else{
              imgIndex = 0;
              framesCounter = 1;
            }
          
        }else{
            if(imgIndex < 6){
              imgIndex++;
              framesCounter++;
            }else{
              imgIndex = 0;
              framesCounter = 1;
            }
          }
      
    }else{
      imgIndex = nodIndexes[nodIndex];
    }
  }
  void update(){
    //turning up
    
    
    
    if(direction == "right" && raceStarted){
      x += speeds[speedIndex];
    
      distanceTravelled += speeds[speedIndex];
    }else if(direction == "down") {
      y += speeds[speedIndex];
      
      distanceTravelled += speeds[speedIndex];
    }else if(direction == "left"){
      x -= speeds[speedIndex];
      inBottomSection = true;
     // degrees = 0;
      distanceTravelled += speeds[speedIndex];
    }else if(direction == "up"){
      y -= speeds[speedIndex];
      //degrees = 270;
      distanceTravelled += speeds[speedIndex];
      inBottomSection = false;
    }
    
     if(x == 700 || x == 400 || x == 1000|| y == 400){
       speedIndex++;
        horseHasBigSpeed();
      }
    
    if(x == 100 && y == 100 && raceStarted){ // && started == true){
        direction = "right";
        speedIndex++;
        
        lap++;
        if(lap != 5){
          horseHasBigSpeed();
          if(horses[podium.get(0)].horseIndex == this.horseIndex){
            lapShown = 30;
            if(lap == 4){
               applauseIncreasingIndex = 130;
             // auctionAmplitude = 0.12;
              //auction.amp(auctionAmplitude);
             
            }
          }
        }
        //println(lap);
       // if(lap == 6){
       if(lap == 5){
          lap = 1;
          audio.stop();
          if(this.horseIndex == order.get(7)){
            if (applause.isPlaying()){
              applauseDecreasingIndex = 240;
        
            }
          //  if (auction.isPlaying()){
           //   auction.stop();
        
           // }
            horsesStopped = true;
        }
          audioStartPoint = random(audio.duration());
          speedIndex = 0;
          distanceTravelled += setOrder;
         // println(horseIndex,distanceTravelled);
          setOrder--;
          raceStarted = false;
          if(horseIndex == order.get(0)){
            imgIndex = 7;
          }else{
            imgIndex = horses[podium.get(0)].imgIndex;
          }
        }
        
       // index++;
       // laps++;
    }else if(x == 1300 && y == 100){
        //index++;
       // speed = speeds[index];
        speedIndex++;
        horseHasBigSpeed();
        direction = "down";
        
      }else if(x == 1300 && y == 700){
       // index++;
       // speed = speeds[index];
        speedIndex++;
        horseHasBigSpeed();
        direction = "left";
      }else if(x == 100 && y == 700){
        speedIndex++;
        horseHasBigSpeed();
        direction = "up";
       // if(horses[podium.get(0)].horseIndex == this.horseIndex){
       //     if(lap == 5){
       //       auctionAmplitude = 0.12;
       //       auction.amp(auctionAmplitude);
        //    }
        //  }
       // index++;
       // speed = speeds[index];
      }
  }
  void setSpeeds(int[] speeds){
    this.speeds = speeds;
  }
  void startMovement(){
      setOrder = 10;
      distanceTravelled = 0;
      raceStarted = true;
      imgIndex = (int)random(0,7);
      audioStartedPlaying = true;
      audio.jump(audioStartPoint);
      horsesStopped = false;
  }
  void horseHasBigSpeed(){
    if(speeds[speedIndex] == 20 || speeds[speedIndex] == 25 ){
      halfSpeed = false;
    }else{
      halfSpeed = true;
    }
  }
}
