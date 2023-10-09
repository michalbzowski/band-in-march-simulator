//class representing one musician in choreography 

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
