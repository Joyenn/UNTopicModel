class Topic{
  Integer displayX = 60;
  Integer displayY = 700;
  Integer displayGap = 75;
  float topicX1;
  float topicX2;
  float topicY1;
  float topicY2;
  String topicName;
  TableRow rowOfWords;
  ArrayList<String> wordList = new ArrayList<String>();
  boolean over = false;
  int wordCount;
  
  Topic(String tempTopic, TableRow tempRow, float x1, float y1, float x2, float y2){
    topicName = tempTopic;
    rowOfWords = tempRow;
    wordCount = rowOfWords.getColumnCount()-2;
    topicX1 = x1;
    topicY1 = y1;
    topicX2 = x2;
    topicY2 = y2;
    
    for(int i = 0; i < wordCount; i++){
      String word = rowOfWords.getString(i+2);
      wordList.add(word);
    }
  }
  
  void rollover(float px, float py){

    if(topicX1<px && px<topicX2 && topicY1<py && py<topicY2){ //<>//
      over = true; //<>//
    } else{ //<>//
      over = false; //<>//
    }
  
  }
  
  void display(){
    //background(255);

    if (over) {
      fill(0);
      textAlign(CENTER);
      textFont(mono, 12);
      text(topicName, displayX, displayY-20);
      for(int i = 0; i < wordCount; i++){
        fill(0);
        text(wordList.get(i), displayX+i*displayGap, displayY);
      }
    }
  
  }
  
  

}