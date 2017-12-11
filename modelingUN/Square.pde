class Square{
  Integer yPos;
  Integer xPos;
  Float weight; 
  Integer squareWidth = 20;
  Integer squareHeight = 20;
  
  Square(Integer xPos, Integer yPos, Float weight){
    this.xPos = xPos;
    this.yPos = yPos;
    this.weight = weight;
  }
  
  void display(){
    float percent = norm(weight, 0, 1);
    
    LABColor white = new LABColor(color(255, 255, 255));
    LABColor purple = new LABColor(color(0, 0, 255));
    color c = white.lerp(purple, percent).rgb;
    fill(c);
      
    rect(xPos, yPos, squareWidth, squareHeight);
  }
  
  Integer getSquareWidth(){
    return squareWidth;
  }
  
  Integer getSquareHeight(){
    return squareHeight;
  }
}