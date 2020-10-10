
import processing.sound.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
//note use big decimal instead of double

//multiples of 300 will worlk
//use several different cheers
color backgroundColor;
Horse[] horses;
int[] horseWinOdds;
//prob that horse 0-3 will win
int firstFourOdds;
LeaderBoard leaderBoard;
int setOrder;
ArrayList<RandomSpeeds> randomSpeeds;
ArrayList<Integer> order;
ArrayList<Integer> podium;
ArrayList<Integer> restrictedNameIndexes;
ArrayList<Integer> restrictedColorIndexes;
Button startRace;
Button changeBet;
RandomSpeeds temp;
String[] prefixes;
String[] names;
PFont roboto;

PImage[] images;
PImage[] imagesDown;
PImage[] imagesLeft;
PImage[] imagesUp;
int chosenSound;

boolean horsesStopped;

color[] reds;
color[] yellows;
color[] oranges;
color[] pinks;
color[] violets;
color[] blues;
color[] greens;
color[] browns;
color[] grays;
float applauseAmplitude;
float auctionAmplitude;
int applauseDecreasingIndex;
int applauseIncreasingIndex;


PImage pitch;
int baseNodIndex;
boolean nodGoingDown;
int[] nodIndexes = {7,8,9,10,9,8};
int nodIndex;
int framesCounterGlobal;
int lapShown;

SoundFile starterPistol;
SoundFile applause;
SoundFile callToPost;
//SoundFile auction;
SoundFile[] commentary;
float[] commentaryAmps;


void setup(){
  size(1400,800);
  rectMode(CENTER);
  //frameRate consitentley lags
  frameRate(30);
  loadImages();
  framesCounterGlobal = 0;
  prefixes = new String[12];
  
  names = new String[81];
  horsesStopped = true;
  roboto = createFont("Roboto-Condensed.ttf",100);
  textFont(roboto);
  initializeNames();
  initializeColors();
    
  leaderBoard = new LeaderBoard();
  randomSpeeds = new ArrayList<RandomSpeeds>();
  setOrder = 10;
  order = new ArrayList<Integer>();
  for(int i= 0; i<8; i++){
    order.add(i);
  }
  podium = new ArrayList<Integer>();
  restrictedNameIndexes = new ArrayList<Integer>();
  restrictedColorIndexes = new ArrayList<Integer>();
  horseWinOdds = new int[8];
  startRace = new Button(1000,400,200,50,"start the race")  ;
  changeBet = new Button(1000,450,200,50,"change your bet",color(0,0,0),color(255,255,255));
  backgroundColor = color(200,200,200);
  horses = new Horse[8];
  for(int i = 0; i<horses.length;i++){
    horses[i] = new Horse(i,chooseName(),chooseColor(),new SoundFile(this,"horseRunningLoop.wav"));
  }
  setOdds();
  computeLeaderBoard();
  baseNodIndex = 8;
   pitch = loadImage("horsePitch.png");
   nodGoingDown = true;
   nodIndex = 0;
   loadSounds();
   
   chosenSound = 0;
   applauseDecreasingIndex = 0;
   applauseIncreasingIndex = 0;
   lapShown = 0;
   
}

void draw(){
  background(backgroundColor);
 // println(frameRate);
  
  if(applauseDecreasingIndex > 0){
      applauseAmplitude *= 0.98;
      applause.amp(applauseAmplitude);
      commentaryAmps[chosenSound] *= 0.97;
      commentary[chosenSound].amp(commentaryAmps[chosenSound]);
      if(applauseDecreasingIndex == 120){
        commentary[chosenSound].stop();
      }
      if(applauseDecreasingIndex == 1){
        applause.stop();
        commentary[chosenSound].stop();
      }
      applauseDecreasingIndex--;
    }
    
    if(applauseIncreasingIndex > 0){
      applauseAmplitude *= 1.007;
      applause.amp(applauseAmplitude);
      applauseIncreasingIndex--;
    }
  displayPitch();
  if(horsesStopped == false){
    computeLeaderBoard();
  }else{
    startRace.display();
    changeBet.display();
  }
  
  
  leaderBoard.display();
  
  if(nodIndex < 5){
    if(framesCounterGlobal %10 == 0){
          nodIndex++;
     }
  }else{
    nodIndex = 0;
    framesCounterGlobal = 0;
  }
   framesCounterGlobal++;
  
  /*if(baseNodIndex < 10){
        if(framesCounterGlobal %16 == 0){
          baseNodIndex++;
        }
      }else{
        baseNodIndex = 7;
        framesCounterGlobal = 0;
      }
      framesCounterGlobal++;
      */
      
      if(lapShown > 0){
        fill(0);
        textSize(80);
        text("LAP "+horses[podium.get(0)].lap,300,310);
        lapShown--;
    }
      


  
    
}

void mousePressed(){
  if(horsesStopped){
    if(startRace.clicked()){
      chosenSound = (int)random(6);
      //chosenSound = 5;
      println(chosenSound);
      applauseAmplitude = 0.04;
      auctionAmplitude = 0.04;
      commentaryAmps[0] = 0.04;
      commentaryAmps[1] = 0.1;
      commentaryAmps[2] = 0.08;
      commentaryAmps[3] = 0.06;
      commentaryAmps[4] = 0.06;
      commentaryAmps[5] = 0.16;
      commentary[chosenSound].amp(commentaryAmps[chosenSound]);
      commentary[chosenSound].jump(random(0,commentary[chosenSound].duration() - 40));
      applause.amp(auctionAmplitude);
      applauseDecreasingIndex = 0;
      applause.jump(random(0,applause.duration() - 40));
      setOrder = 10;
      starterPistol.play();
      chooseOrder();
      pickSpeeds();
       for(int i = 0; i<order.size(); i++){
         horses[order.get(i)].setSpeeds(randomSpeeds.get(i).speeds);
       }
      for(int i = 0; i<horses.length;i++){
        horses[i].startMovement();
      }
    }
  }
  
}
