//David Valdespino|Calculator App|10/02/2024
Button[] buttons = new Button [24];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(225, 330);
  textSize(15);
  l=0.0;
  r=0.0;
  result=0.0;
  op = ' ';
  left=true;
  buttons[0]= new Button(30, 306, "0", true);
  buttons[1]= new Button(30, 262, "1", true);
  buttons[2]= new Button(30, 218, "4", true);
  buttons[3] = new Button(30, 175, "7", true);
  buttons[4] =new Button(88, 260, "2", true);
  buttons[5]=new Button(88, 218, "5", true);
  buttons[6] =new Button(88, 175, "8", true);
  buttons[7]= new Button(145, 218, "6", true);
  buttons[8]= new Button(145, 262, "3", true);
  buttons[9]= new Button(145, 175, "9", true);
  buttons[10]= new Button(88, 306, "-", false);
  buttons[11]= new Button(145, 306, ".", false);
  buttons[12]= new Button(195, 306, "=", false);
  buttons[13]= new Button(195, 262, "+", false);
  buttons[14]= new Button(195, 218, "-", false);
  buttons[15]= new Button(195, 175, "X", false);
  buttons[16]= new Button(30, 138, "D", false);
  buttons[17]= new Button(88, 138, "π", false);
  buttons[18]= new Button(145, 138, "l", false);
  buttons[19]= new Button(195, 138, "÷", false);
  buttons[20]= new Button(195, 93, "l", false);
  buttons[21]= new Button(145, 93, "l", false);
  buttons[22]= new Button(88, 93, "l", false);
  buttons[23]= new Button(30, 93, "C", false);
}

void draw() {
  // println(" Left;" + l + " Right; " + r +" Results;" + result + " Op;" + op + "l" + left );

  background(120);
  for (int i=0; i<buttons.length; i++) {
    textSize(15);
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void mouseReleased() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l = 0;
      r = 0;
      result = 0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      op = '-';
      dVal="0";
      left = false;
    } else if (buttons[i].on && buttons[i].val.equals("X")) {
      op = 'x';
      dVal="0";
      left = false;
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      op = '÷';
      dVal="0";
      left = false;
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      if (op=='+') {
        result = l + r;
        dVal = str(result);
      } else if (op=='-') {
        result = l - r;
        dVal = str(result);
      } else if (op=='x') {
        result = l * r;
        dVal = str(result);
      } else if (op=='÷') {
        result = l / r;
        dVal = str(result);
      } else if (buttons[i].on && buttons[i].val.equals("π")) {
        op = 'π';
        if (left) {
          dVal += str(PI);
          l = float(dVal);
        } else {
          dVal += str(PI);
          r = float(dVal);
        }
        left = false;
      }

      //r = float(dVal); {
      //l *= -1;
      //dVal = str(l);
      //} else if(left== false) {
      // dVal += str(PI);
      //  r = float(dVal); {
      //  l *= -1;
      //  dVal = str(l);
    }
  }
}



void updateDisplay() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, 35, 240, 70);
  fill(0);
  if (dVal.length()<12) {
    textSize (35);
  } else if (dVal.length()==12) {
    textSize (30);
  } else if (dVal.length()==12) {
    textSize (25);
  } else if (dVal.length()==12) {
    textSize (20);
  } else if (dVal.length()==12) {
    textSize (15);
  }
  textAlign(RIGHT);
  text(dVal, width-10, 40);
}



void performCalculation() {
}

void keyPressed () {
  println("key:" + key);
  println("KeyCode;"+ keyCode);

  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode ==49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode ==50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode ==51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode ==52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode ==53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode ==54) {
    handleEvent("6", true);
  } else if (key == 7|| keyCode == 103 || keyCode ==55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode ==56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode ==57) {
    handleEvent("9", true);
  } else if (key == '÷' || keyCode == 47 ) {
    handleEvent("/", false);
  } else if (key ==  ' ' || keyCode == 10 ) {
    handleEvent(" " , false);
  } else if (key == '+' || keyCode == 55 ) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 45) {
    handleEvent("-", false);
  } else if (key == '.' || keyCode == 46) {
    handleEvent(".", false);

} else if (key == 'X' || keyCode == 46) {
    handleEvent("X", true);
    //printVals();
  }
}


void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() <12 && isNum) {
    if (dVal.equals("0")) {
      dVal=keyVal;
    } else {
      dVal+= keyVal;
    }
    l= float (dVal);
  } else if (!left && dVal.length()<12 && isNum) {
    if (dVal.equals("0")) {
      dVal= keyVal;
    } else {
      dVal+= keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal="0";
    op='+';
  }
}
