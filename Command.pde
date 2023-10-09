//Abstract class representngin concept of movement done by musician
abstract class Command {
  protected Musician musician;
  
  abstract void execute();
  public void assignMusician(Musician musician) {
   this.musician = musician; 
  }
}

//every class belowe represents one movement/action musicain could take 
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
