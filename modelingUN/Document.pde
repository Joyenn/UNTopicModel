class Document {
  String name;
  ArrayList<Float> weights;
  Integer yPos = 150; //original yPos;
  Integer xPos; //original xPos = 150;
  Float percent;
  PFont mono;
  String path;

  Document(String name, ArrayList<Float> weights, Integer xPos){
    this.name = name;
    this.weights = weights;
    this.xPos = xPos;
    //path = "C:\\Users\\ldeng\\Desktop\\modelingUN\\data\\debates1970\\" + name+".txt";
    path = dataPath("debates1970/"+name+".txt");
   
  }
  
 void display(){
    
    // Text File name
    fill(0,0,0);
    textAlign(LEFT);
    mono = loadFont("AvenirNext-Regular-32.vlw");
    textFont(mono, 12);
    
    pushMatrix();
    translate(xPos + 7,150);

    rotate(radians(-45));
    text(name, 0, 0);
    popMatrix();
    
    yPos = 150;
    // Draw the column of squares
    for (int i = 0; i < weights.size(); i++){
      float weight = weights.get(i);
      Square square = new Square(xPos, yPos, weight); //yPos+50?
      square.display();
      yPos = yPos + square.getSquareHeight();
    }
    
    //TODO: rotate the column labels
    // Text File name 
    fill(0,0,0);
    mono = loadFont("AvenirNext-Regular-32.vlw");
    textFont(mono, 12);
    //pushMatrix();
    //translate(100, 0);
    //rotate(PI/3);
    text(name, xPos, 0);
    //popMatrix(); 
    
  }
  
  String toString() {      
    return name + weights.toString() + weights.size();
  }
  
  String getName(){
    return name;
  }
  
  void showDoc(float mousePosX, float mousePosY){
    if (mousePosX >= xPos && mousePosX<=xPos+20 && mousePosY >= 150 && mousePosY<=550){
      println(path);
      launch(path);
     
    }  
  }
}