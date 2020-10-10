

class RandomSpeeds{
 // int[] possibleSpeeds = {10,12,14,15};
 //int[] possibleSpeeds = {20,30,40,50};
  int[] possibleSpeeds = {10,12,15,20};
  int[] speeds;
  int frames;
  double rand;
  
  RandomSpeeds(){
    speeds = new int[60];
    for(int i = 0; i<speeds.length; i++){
        rand = Math.random();
        if(rand< 0.3){
          speeds[i] = 12;
        }else if(rand< 0.6){
          speeds[i] = 15;
        }else if(rand < 0.9){
          speeds[i] = 20;
        }else{
          speeds[i] = 25;
         // speeds[i] = 50;
        }
        //speeds[i] = possibleSpeeds[(int)random(4)];
      }
      frames = 0;
      for(int i = 0; i<speeds.length; i++){
        frames += (300/speeds[i]);
      }
  }
}
