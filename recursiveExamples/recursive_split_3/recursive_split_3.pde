
void setup() {
    noLoop();
    size(400, 300);
}

void draw() {
    drawSplit(0, 0, width, height, 0);
}

// bottom, right, top, left

void drawSplit(int x, int y, int w, int h, int trbl) {
    int x2, y2;
    boolean shouldSplitAgain = false;
    if (trbl == 0 || trbl == 2) {
        // vertical devide
        h = h / 2;
        y = y + h;
        x2 = x + w;
        y2 = y;
        if (h > 2) {
            shouldSplitAgain = true;
        }
    } else {
        // horizontal devide
        w = w / 2;
        x = x + w;
        x2 = x;
        y2 = y + h;
        if (w > 2) {
            shouldSplitAgain = true;
        }
    }
   fill(trbl * 64);
   line(x, y, x2, y2);
   if (trbl == 3) {
     x = x - w;
   }
   if (trbl == 2) {
     y = y - h;
   }
   trbl += 1;
   if (trbl == 4) {
     trbl = 0;
   }
   if (shouldSplitAgain) {
      println(x, y, w, h, trbl);
      drawSplit(x, y, w, h, trbl); 
   }
}
