PPlot p = new PPlot();
float scale = 3;
boolean auto = false;
int ms;

void setup() {
  size(800, 300);
  surface.setTitle("Plotter");
  surface.setResizable(true);
  background(255);
}

void draw() {
  telnet_tick();
  p.redraw(0, 0, width, height, scale, false);
  
  if (auto && millis() - ms > 60) {
    ms = millis();
    p.move();
  }
}

void telnet_data(String data) {
  p.parse(data);
  ms = millis();
}

void mouseWheel(MouseEvent e) {
  scale -= e.getCount() / 5.0;
  scale = max(scale, 0.05);
}

void mousePressed() {
  auto = !auto;
}
