import java.util.Map;
import controlP5.*;

ControlP5 cp5;
Knob fpsKnob;
boolean playing = false;
HashMap<Integer, Integer> events = new HashMap<Integer, Integer>();
int currentFrame = 0;

float textX = 25;

void setup()
{
  size(600, 800);
  frameRate(24);
  cp5 = new ControlP5(this);
  fpsKnob = cp5.addKnob("Frame_Rate").
  setRange(1,140).setValue(24).
  setPosition(width-120,30).
  setRadius(50).
  setDecimalPrecision(1);
}

void draw()
{
  background(20);
  
  pushMatrix();
  // draw a little spinning tick
  noFill();
  strokeWeight(2);
  stroke((playing)? #A1CE9E : #CE969D);
  translate(width-20,height-20);
  ellipse(0,0,22,22);
  
  rotate(millis()*0.01f);
  fill(100);
  rect(-1,0,2,10);
  
  popMatrix();
  
  if (playing) {
    currentFrame++;
  }
  textSize(14);
  text("Hit SPACE to start/stop. Any other key to add an event :)", textX, 30);
  
  textSize(50);
  text("frame: "+currentFrame, textX, 100);

  textSize(20);
  for (int i = 0; i<events.size(); i++) {
    textSize(14);
    float y = 150 + (20*i);
    fill(100);
    text(i + "  -  -  -  -  -  -  -  -",textX,y);
    textSize(20);
    fill(255);
    text(events.get(i), textX+200, y);
  }
}

void keyPressed()
{
  println(keyCode);
  switch(keyCode) {
  default:
    addEvent();
    break;
  case 32:
    togglePlay();
    break;
  }
}

void togglePlay()
{
  if(!playing && currentFrame>0){
   reset();
  }
  playing = !playing;
}

void reset()
{
 events = new HashMap<Integer, Integer>();
 currentFrame = 0;
}
void addEvent()
{
  if (playing) {
    events.put(events.size(), currentFrame);
  }
}

void Frame_Rate(int n)
{
 frameRate(n); 
}