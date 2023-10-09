//In this file define a initial orchestra musicians position
//Later I wil change that file for reading from textfile
// T, D, L, R - defines musician initial position - T means msician is faced top, D down, L left, R right 
//


String positions[] = {
  "TTTTT",
  "TTTTT",
  "TTTTT",
  "TTTTT",
};

List<Musician> parseMusiciansInput() {
  Musician m = new Musician(0, 0).addCommand(new Step()).addCommand(new Step()).addCommand(new TurnLeft()).addCommand(new Step()).addCommand(new TurnLeft()).addCommand(new Step());
  Musician n = new Musician(0, 1).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step());
  Musician v = new Musician(1, 0).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step()).addCommand(new Step());
  Musician x = new Musician(1, 1).addCommand(new Step()).addCommand(new Step()).addCommand(new TurnRight()).addCommand(new Step()).addCommand(new TurnRight()).addCommand(new Step());

  return List.of(m, n, v, x);
}
