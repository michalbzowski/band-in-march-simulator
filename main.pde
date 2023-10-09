import java.util.ArrayList;
import java.util.List;

int FRAME_RATE = 60;
int MARCH_TEMPO = 112;

void setup() {
  size(640, 720);
  colorMode(RGB, 400);
  background(255, 204, 0);
  frameRate(FRAME_RATE);
}

List<Musician> musicians = parseMusiciansInput();


void draw() {
  noStroke();
  background(77);
  for(Musician m : musicians) {
     m.drawMe(); 
  }

  if(frameCount % FRAME_RATE == 0) {//minęla jedna sekunda?
    for(Musician m : musicians) {
      m.nextCommand(); 
    }
  }
}
