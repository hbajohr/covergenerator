/**
 * s                   : save png
 * p                   : save pdf
 * c                   : save color palette
 */
import java.security.*;
import java.math.BigInteger;
String hashtext;
String titel1="Hannes Bajohr Durchschnitt"; // Enter the title of the book whose cover you want to create
import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

int tileCountX = 50;
int tileCountY = 10;

// arrays for color components values
int[] hueValues = new int[tileCountX];
int[] saturationValues = new int[tileCountX];
int[] brightnessValues = new int[tileCountX];


void setup() { 
  size(1300, 2100); 
  colorMode(HSB, 16777215, 16777215, 16777215, 16777215);
  noStroke();
  println(md5hash(titel1));
  // init with random values
  for (int i=0; i<tileCountX; i++) {
    hueValues[0] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    hueValues[1] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    hueValues[2] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    hueValues[3] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    hueValues[4] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    hueValues[5] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    hueValues[6] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    hueValues[7] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    hueValues[8] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    hueValues[9] = (int) Integer.parseInt(md5hash(titel1)[4], 16); 
    hueValues[10] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    hueValues[11] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    hueValues[12] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    hueValues[13] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    hueValues[14] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    hueValues[15] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    hueValues[16] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    hueValues[17] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    hueValues[18] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    hueValues[19] = (int) Integer.parseInt(md5hash(titel1)[4], 16);

    brightnessValues[6] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    brightnessValues[4] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    brightnessValues[1] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    brightnessValues[0] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    brightnessValues[12] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    brightnessValues[2] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    brightnessValues[10] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    brightnessValues[7] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    brightnessValues[13] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    brightnessValues[9] = (int) Integer.parseInt(md5hash(titel1)[0], 16); 
    brightnessValues[3] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    brightnessValues[8] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    brightnessValues[15] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    brightnessValues[11] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    brightnessValues[19] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    brightnessValues[16] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    brightnessValues[18] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    brightnessValues[17] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    brightnessValues[5] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    brightnessValues[14] = (int) Integer.parseInt(md5hash(titel1)[0], 16);

    saturationValues[0] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    saturationValues[1] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    saturationValues[2] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    saturationValues[3] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    saturationValues[4] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    saturationValues[5] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    saturationValues[6] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    saturationValues[7] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    saturationValues[8] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    saturationValues[9] = (int) Integer.parseInt(md5hash(titel1)[0], 16); 
    saturationValues[10] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    saturationValues[11] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    saturationValues[12] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    saturationValues[13] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    saturationValues[14] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
    saturationValues[15] = (int) Integer.parseInt(md5hash(titel1)[4], 16);
    saturationValues[16] = (int) Integer.parseInt(md5hash(titel1)[3], 16);
    saturationValues[17] = (int) Integer.parseInt(md5hash(titel1)[2], 16);
    saturationValues[18] = (int) Integer.parseInt(md5hash(titel1)[1], 16);
    saturationValues[19] = (int) Integer.parseInt(md5hash(titel1)[0], 16);
  }
} 


void draw() { 
  if (savePDF) {
    beginRecord(PDF, timestamp()+".pdf");
    noStroke();
    //colorMode(RGB,16777215,16777215,16777215,16777215);
    colorMode(HSB, 16777215, 16777215, 16777215, 16777215);
  } 
  // white back
  background(0, 0, 100);

  // count every tile
  int counter = 0;

  // map mouse to grid resolution
  int currentTileCountX = 13; //(int) map(mouseX, 0,width, 1,tileCountX);
  int currentTileCountY = 6; //(int) map(mouseY, 0,height, 1,tileCountY);
  float tileWidth = width / (float) currentTileCountX;
  float tileHeight = height / (float) currentTileCountY;

  for (int gridY=0; gridY< tileCountY; gridY++) {
    for (int gridX=0; gridX< tileCountX; gridX++) {  
      float posX = (tileWidth*gridX);
      float posY = (tileHeight*gridY);
      int index = counter % currentTileCountX;

      // get component color values
      fill(hueValues[index], saturationValues[index], brightnessValues[index]);
      rect(posX, posY, tileWidth, tileHeight);
      counter++;
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
} 


void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

String[] md5hash(String titel_string) {
  try { 
    MessageDigest m = MessageDigest.getInstance("MD5");
    m.reset();
    m.update(titel_string.getBytes());
    byte[] digest = m.digest();
    BigInteger bigInt = new BigInteger(1, digest);
    hashtext = bigInt.toString(16);
    while (hashtext.length () < 18 ) {
      hashtext = "0"+hashtext;
    }
  } 
  catch(NoSuchAlgorithmException x) {
  } 
  String[] hash= {
    hashtext.substring(0, 6), hashtext.substring(6, 12), hashtext.substring(12, 18), hashtext.substring(18, 24), hashtext.substring(24, 30) //, hashtext.substring(30, 32)
  };
  return(hash);
}
