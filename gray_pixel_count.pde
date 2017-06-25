PImage img;
int threshold = 250;
int point_sum;
int sum;

void setup () {
  img = loadImage("sample_toilet.png"); //load image of a case
  size(1016, 586); //set the canvus size same as the image size
  noLoop();
  background(#ffffee);
}

void draw() {
  fill(#d0d0f0);
  img.filter(THRESHOLD, 0.9); //set the threshold as the points that is mold exists can be white and others black
  image(img, 0, 0);
  moldCount();
  save("samplegray.png");
  println("point_sum = " + point_sum + " out of " + sum);
}

void moldCount() {
  for (int y=0; y < img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int br = int(brightness(img.get(x, y)));
      sum += 1;
      if (br >= threshold) {
        point_sum +=1;
      }
    }
  }
}