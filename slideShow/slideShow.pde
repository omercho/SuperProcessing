int maxImages = 11;
int imageIndex = 0;
PImage[] images = new PImage[maxImages];


int savedTime;
int totalTime = 200;


void setup() 
{ size(800,500);
  smooth();
  savedTime = millis();
  
  for(int i = 0; i<images.length; i++)
  { images[i] = loadImage("hand_" + (i+1) +".jpg");   

  } 
  
}
  
    


void draw()
{ int passedTime = millis() - savedTime;
  if (passedTime > totalTime) 
  { imageIndex = (imageIndex+1) % images.length;
    savedTime = millis();
  }
  
image(images[imageIndex],0,0,width,height);
 

}

