// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {

  PVector[][] field;
  int cols, rows; 
  int resolution; 

  FlowField(int r) {
    resolution = r;
    cols = 540/resolution;
    rows = 540/resolution;
    field = new PVector[cols][rows];
    update();
  }


  void update() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float x = i*resolution-width/2;
        float y = j*resolution-height/2;
        float r = sqrt((x*x)+ (y*y));
        PVector v = new PVector( -x*0.222, 6);
        v.normalize();
        field[i][j] = v; 
      }
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}



