// /*
// vars 
int screen = 0; // 0 for main screen, 1 for red, 2 for blue, 3 for yellow // (20/3) - Pratyaksh
Button test1, test2, test3;

class Button { // 42  // created: 20/3 - Pratyaksh
  int x, y;                       //   Position of the button
  int width, height;              //  Size of the button
  String label;                   //  Text label on the button
  
  Button(int x, int y, int width, int height, String label) { // 26
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
  } // 20
  
  void display() { // 34 
    fill(255, 255, 0);              // Set button color to yellow
    rect(x, y, width, height);      // Draw the button
    fill(0);                        // Set text color to black
    textAlign(CENTER, CENTER);
    text(label, x + width / 2, y + height / 2); // Center the label within the button
  } // 28
  
  boolean overButton(int mouseX, int mouseY) { // 40
    
    // Check if the mouse is over the button
    return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
  } // 36
  
} // 15

void mousePressed() { // 57
  if (screen == 0) { // Main screen
    if (test1.overButton(mouseX, mouseY)) {
      screen = 1; // Change to red screen
    } else if (test2.overButton(mouseX, mouseY)) {
      screen = 2; // Change to blue screen
    } else if (test3.overButton(mouseX, mouseY)) {
      screen = 3; // Change to yellow screen
    }
  } else {
    // Click anywhere to return to the main screen from the color screens
    screen = 0;
  }
} // 44
// */
