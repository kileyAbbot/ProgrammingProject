//Adapted from https://github.com/mitkonikov/Processing/blob/master/Text_Box/TEXTBOX.pde for text box creation in Airport

public class TEXTBOX {
   public int X = 0, Y = 0, H = 35, W = 200;
   public int TEXTSIZE = 24;
   
   // COLORS
   public color Background = color(#eae8eb);
   public color Foreground = color(#eae8eb);
   public color BackgroundSelected = color(#cdcacf);
   public color Border = color(#eae8eb);
   
   public boolean BorderEnable = false;
   public int BorderWeight = 1;
   
   public String Text = "";
   public int TextLength = 0;

   private boolean selected = false;
   
   TEXTBOX() {
      // CREATE OBJECT DEFAULT TEXTBOX
   }
   
   TEXTBOX(int x, int y, int w, int h) {
      X = x; Y = y; W = w; H = h;
   }
   
   void DRAW() {
      // DRAWING THE BACKGROUND
      if (selected) {
         fill(#eae8eb);
      } else {
         fill(#eae8eb);
      }
      
      if (BorderEnable) {
         strokeWeight(BorderWeight);
         stroke(#eae8eb);
      } else {
         noStroke();
      }
      
      rect(X, Y, W, H);
      
      // DRAWING THE TEXT ITSELF
      fill(#64a4cc);
      textSize(TEXTSIZE);
      text(Text, X + (textWidth(Text) / 2) + 5, Y + TEXTSIZE - 5);
   }
   
   // IF THE KEYCODE IS ENTER RETURN 1
   // ELSE RETURN 0
   boolean KEYPRESSED(char KEY, int KEYCODE) {
      if (selected) {
         if (KEYCODE == (int)BACKSPACE)
         {
            BACKSPACE();
         }
         else if (KEYCODE == 32) 
         {
            // SPACE
            addText(' ');
         }
         else if (KEYCODE == (int)ENTER) {
            return true;
         }
         else
         {
            // CHECK IF THE KEY IS A LETTER OR A NUMBER
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
               addText(KEY);
            }
         }
      }
      
      return false;
   }
   
   private void addText(char text) {
      // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
      
    
      if (textWidth(Text + text) < W) {
         Text += text;
         TextLength++;
      }
      
   }
   
   private void BACKSPACE() {
      if (TextLength - 1 >= 0) {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }
   
   // FUNCTION FOR TESTING IS THE POINT
   // OVER THE TEXTBOX
   private boolean overBox(int x, int y) {
      if (x >= X && x <= X + W) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y) {
      if (overBox(x, y)) {
         selected = true;
      } else {
         selected = false;
      }
   }
}
