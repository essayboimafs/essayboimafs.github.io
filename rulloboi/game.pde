Console n = new Console(10,100,12);
Console time = new Console(20, 100, 12)
void setup()
{
      size(500,500);
      n.activate();
      time.activate();
}

void draw()
{
      background(0);
      n.display();
      time.display();
}

void keyPressed()
{
         if (keyAnalyzer(key).compareTo("NUMBER") == 0)
        {
            c.addChar(key);
        }
        if (keyCode == BACKSPACE)
        {
            c.deleteChar();
        }
}


