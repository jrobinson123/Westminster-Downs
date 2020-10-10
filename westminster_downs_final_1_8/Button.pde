

class Button{
  int x,y;
  int xSize,ySize;
  String buttonMessage;
  color Color;
  color textColor;
  Button(int x, int y, int xSize, int ySize, String buttonMessage, color Color, color textColor){
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.buttonMessage = buttonMessage;
    this.Color = Color;
    this.textColor = textColor;
  }
  Button(int x, int y, int xSize, int ySize, String buttonMessage){
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.buttonMessage = buttonMessage;
    this.Color = color(255,255,255);
    this.textColor = color(0,0,0);
  }
  void display(){
    rectMode(CENTER);
    if(mouseHover(x,y,xSize,ySize)){
      stroke(255,0,0);
      strokeWeight(2);
    }else{
      noStroke();
    }
    fill(Color);
    rect(x,y,xSize,ySize);
    
    if(mouseHover(x,y,xSize,ySize)){
      fill(255,0,0);
    }else{
      fill(textColor);
    }
    textSize(20);
    textAlign(CENTER,CENTER);
    text(buttonMessage,x,y);
    
  }
  
  boolean clicked(){
    if(mouseHover(x,y,xSize,ySize)){
      return true;
    }else{
      return false;
    }
  }
  
}
