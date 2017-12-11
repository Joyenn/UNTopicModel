ArrayList<Document> documents = new ArrayList<Document>();
ArrayList<Topic> topics = new ArrayList<Topic>();
Integer startingPoint = 100;
Integer displayWidth = 1500;
Integer displayHeight = 800;
float squareWidth = 20;
Integer columnCount;
Integer xPos = 60; //original: yPos=100;
String title;
PFont mono;

void setup() {
  // set up display window
  size(displayWidth, displayHeight);
  background(255, 255, 255);
  pixelDensity(displayDensity());

 

  loadData();
}

void loadData(){
  Table data = loadTable("debates1970v2.csv", "header");
  Table topic_comp = loadTable("topic.csv","header");
  columnCount = data.getColumnCount();

  
  // first you must make a arraylist and fill it in 
  for (int i = 0; i<data.getRowCount(); i++) {
    Integer columnCount = data.getColumnCount();
    // Iterate over all the rows in a table.
    TableRow row = data.getRow(i);
    
    ArrayList<Float> weights = new ArrayList<Float>();

    // Loop over from columns 2 until columnCount add each to weight array
    for (int j = 0; j < columnCount-2; j++){
      // build the string
      String topicName;
      topicName = "Topic" + Integer.toString(j); 
      println(topicName);
      // pass the string to topic
      Float topicWeight = row.getFloat(topicName);
      // add it to weights
      weights.add(topicWeight); 
    }
    
  
       
    // Create new document
    Document document = new Document(row.getString("name"), weights, xPos);
    documents.add(document);
    
    // Update yPos 
    xPos = xPos + 20;
    println(documents.get(i).toString());
  }
  
  int numOfDocs = documents.size();
  
  // Create topic objects and pass them into the array 
  for (int i = 0; i<topic_comp.getRowCount();i++){
    TableRow row = topic_comp.getRow(i);
    float X1 = 60;
    float X2 = 60 + squareWidth*numOfDocs;
    float Y1 = 150 + i * 20;
    float Y2 = 170 + i * 20;
    String topicName = "topic" + (i+1);
    Topic tempTopic = new Topic(topicName, row, X1, Y1, X2, Y2);
    topics.add(tempTopic);
  }
  
  
  
}
  
Integer getColumnCount(){
  return columnCount;
}

void draw(){
   background(255);
   
   // set up Title
   textAlign(CENTER);
   fill(0, 0, 0);
   mono = loadFont("AvenirNext-Regular-32.vlw");
   textFont(mono);
   text("Sample Speeches Heat Map", displayWidth/2, 50);
   
   for(Document doc: documents){
      doc.display();
   }

   // Draw Topics numbered row
   Integer xPosTopic = 30;
   Integer yPosTopic = 165;
   
   for (int i = 1; i < columnCount-1; i++){
      fill(0,0,0);
      textFont(mono, 12);
      String topicNum = Integer.toString(i);
      text("Topic " + topicNum, xPosTopic, yPosTopic);
      yPosTopic = yPosTopic + 20;
   }
   
   // Draws columns and rows 
   for(int i = 0; i < topics.size(); i++){
     topics.get(i).display();
   }
}

void mouseMoved(){
  for(int i=0; i < topics.size(); i++) { //<>//
    topics.get(i).rollover(mouseX, mouseY); //<>//
  }
}

void mousePressed(){
  for(int i = 0; i < documents.size(); i++){
    documents.get(i).showDoc(mouseX, mouseY);  
  }
}