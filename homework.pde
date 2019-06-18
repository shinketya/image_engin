PImage img; //<>//
void setup() {

  size(500, 500);
  background(255);
  byte b[] = loadBytes("kyuuketuki.pgm");
  String[] lineString = loadStrings("kyuuketuki.pgm");
  String[] s;
  s = lineString[1].split(" ", 2);
  int[] index = new int[256];
  
  float scaleH;
  float scaleW;

  int total = int(s[0]) * int(s[1]);

  // Print each value, from 0 to 255 
  //for (int i = 0; i < b.length; i++) { 
  for (int i = 0; i < total; i++) { 
    // byte型を-128~127から0~255にコンバート 
    int a = b[i] & 0xff;
    index[a]++;
    print(a + " ");
  } 
  // Print a blank line at the end 
  println(); 
  
  int maxValue = 0;
  for(int i = 0; i < index.length; i++) {
    if(maxValue < index[i]){
      maxValue = index[i];
    }
  }
  println(maxValue);
  println(lineString[1]);
  
  scaleH = 450.0 / maxValue;
  scaleW = 1.7;
  
  stroke(0, 0, 255);
  for(int i = 1; i < index.length; i++) {
    
    line(30 + (i * scaleW -1), (height-30) - (index[i-1] * scaleH), 30 + (i * scaleW), (height-30) - (index[i] * scaleH));
  }
  stroke(0);
  line(30, height - 30, 30, 5);
  line(30, height - 30, width - 5, height - 30);
  String value = String.valueOf(maxValue);
  fill(0);
  text(value, 3, 10);
  text("255", 255 * scaleW, height - 10);
}
