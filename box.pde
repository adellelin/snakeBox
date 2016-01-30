public class Box {
  PVector pos;
  int size;
  
  
  Box(PVector startPos, int boxSize) {
    this.pos = startPos;
    this.size = boxSize;
  }
  
  void display() {
    stroke(250);
    rect(pos.x, pos.y, size, size);
  }
  
  void update(){
      
      //newBox.display();
      println("yes");  
      return;
    }

  }

    