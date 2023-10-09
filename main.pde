import java.util.ArrayList;
import java.util.List;

int FRAME_RATE = 60;
int MARCH_TEMPO = 112;

void setup() {
  size(640, 720, P3D);
  colorMode(RGB, 400);

  frameRate(FRAME_RATE);
}

abstract class Command {
  protected Musician musician;
  
  abstract void execute();
  public void assignMusician(Musician musician) {
   this.musician = musician; 
  }
}

class Step extends Command {
   
  public void execute() {
    musician.step();
  }
 
}

class TurnLeft extends Command {
   
  public void execute() {
    musician.turnLeft();
  }
 
}


class TurnRight extends Command {
   
  public void execute() {
    musician.turnRight();
  }
 
}


class Musician {
  
  float x, y;
  float direction = 0;
  float PERSON_RADIUS = 32.0f;
  float STEP_SIZE = 32.0f;
  float DISTANCE_X = 64.0f;
  float DISTANCE_Y = 64.0f;
  
  List<Command> commands = new ArrayList();
  int beat = 0;
  Musician(int row, float column) {
    this.x = row * (PERSON_RADIUS + DISTANCE_X);
    this.y = column * (PERSON_RADIUS + DISTANCE_Y);
  }
  
  void drawMe() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    rotate(direction); 
    fill(2,y,x);
    circle(0, 0, PERSON_RADIUS);
    color(255, 255, 255);
    fill(255,255,255);
    circle(0 + 20, 0, PERSON_RADIUS/2);
    popStyle();
    popMatrix();
  }
  
  void step() {
    
    this.x = this.x + STEP_SIZE  * cos(direction);
    this.y = this.y + STEP_SIZE *  sin(direction);
  }
  
  void turnLeft() {
    this.direction -= HALF_PI;
  }
  
  void turnRight() {
    this.direction += HALF_PI;
  }
  
  public Musician addCommand(Command command) {
    command.assignMusician(this);
    this.commands.add(command);
    return this;
  }
  
  public void nextCommand() {
    if(commands.size() > beat){
      commands.get(beat++).execute();
    }
  }
}

Musician a = new Musician(1, 1);
Musician b = new Musician(1, 2);
Musician c = new Musician(1, 3);
Musician d = new Musician(1, 4);
Musician e = new Musician(2, 1);
Musician f = new Musician(2, 2);
Musician g = new Musician(2, 3);
Musician h = new Musician(2, 4);

Musician m = a.addCommand(new Step()).addCommand(new Step()).addCommand(new TurnLeft()).addCommand(new Step()).addCommand(new TurnLeft()).addCommand(new Step());
Musician n = b.addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step());
Musician v = c.addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step());
Musician x = d.addCommand(new Step()).addCommand(new Step()).addCommand(new TurnRight()).addCommand(new Step()).addCommand(new TurnRight()).addCommand(new Step());

int beat = 0;
void draw() {
  noStroke();
  background(66);
  a.drawMe();
  b.drawMe();
  c.drawMe();
  d.drawMe();
  if(frameCount % FRAME_RATE == 0) {//minęla jedna sekunda?
    a.nextCommand();
    b.nextCommand();
    c.nextCommand();
    d.nextCommand();
  }
  //e.drawMe();
  //f.drawMe();
  //g.drawMe();
  //h.drawMe();
}
