class TekstFelt extends Komponent {

  boolean iFokus  = false;

  StringBuffer input = new StringBuffer();
  float x, y;
  float bredde = 245, hojde = 35;

  TekstFelt(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void tegn() {
    fill(255);
    rect(x+5, y, bredde, hojde);

    fill(0);
    if (frameCount%20<12 && iFokus)rect(x+75+ input.length()*8, y+3, 10, hojde -5);
    fill(100);
    rect(x, y, 73, hojde);
    fill(0);
    text("TAST BELØB: " +input.toString() + "   KR", x, y + 25);
  }

  void registrerKlik() {
    if (mousePressed && mouseX < x +bredde && mouseX > x && mouseY > y && mouseY < y + hojde) {
      iFokus = true;
    } else if (mousePressed && !(mouseX < x +bredde && mouseX > x && mouseY > y && mouseY < y + hojde)) {
      iFokus = false;
    }
  }

  void tilfojTegn() {
    if (key==BACKSPACE && input.length() > 0) {
      input.deleteCharAt(input.length()-1);
    } else if (iFokus &&(key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='0')) {
      input.append(key);
    }
  }

  void ryd() {
    input.delete(0, input.length());
  }

  float hentBelob() {
    float belob = 0;
    if (input.length() > 0) {
      try {
        belob =  Float.parseFloat(input.toString());
      }
      catch(Exception e) {
        // her burde brugeren nok lige få en fejlmeddelelse
      }
    }

    return belob;
  }
}
