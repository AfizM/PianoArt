class Piano {
  int timer;
  Piano() {
    // Initialize timer
    timer = millis();
  }


  void drawPiano() {
    //outer piano
    fill(#1B1C1C);
    rect(90, 600, 950, 350);
    //keys
    fill(#F20206);
    rect(175, 675, 650, 250);
    //key 1
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(175, 675, 75, 250);

    //key 2
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(250, 675, 75, 250); 



    //key 3
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(325, 675, 75, 250);


    //key 4
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(400, 675, 75, 250);


    //key 5
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(475, 675, 75, 250);

    //key 6
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(550, 675, 75, 250);

    //key 7
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(625, 675, 75, 250);

    //key 8
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(700, 675, 75, 250);


    //key 9
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(775, 675, 75, 250);


    //key 10
    fill(#FAFAFA);
    stroke(0, 0, 0);
    strokeWeight(5);
    rect(850, 675, 75, 250);




    // inner key 1
    fill(0, 0, 0);
    rect(230, 675, 40, 150);

    // inner key 2
    fill(0, 0, 0);
    rect(305, 675, 40, 150);


    // inner key 3
    fill(0, 0, 0);
    rect(455, 675, 40, 150);

    // inner key 4
    fill(0, 0, 0);
    rect(530, 675, 40, 150);

    // inner key 5
    fill(0, 0, 0);
    rect(605, 675, 40, 150);


    // inner key 6 
    fill(0, 0, 0);
    rect(755, 675, 40, 150);

    // inner key 7
    fill(0, 0, 0);
    rect(830, 675, 40, 150);
  }

  void highlightKeyOnPress() {
    // If A is pressed then fill the key to red and put the inner keys over it, same procedure for the following
    if (keyPressed == true && key == 'A') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(175, 675, 75, 250);
      // inner key 1
      fill(0, 0, 0);
      rect(230, 675, 40, 150);
    }

    if (keyPressed == true && key == 'S') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(250, 675, 75, 250);

      // inner key 1
      fill(0, 0, 0);
      rect(230, 675, 40, 150);

      // inner key 2
      fill(0, 0, 0);
      rect(305, 675, 40, 150);
    }

    if (keyPressed == true && key == 'D') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(325, 675, 75, 250);

      // inner key 2
      fill(0, 0, 0);
      rect(305, 675, 40, 150);
    }

    if (keyPressed == true && key == 'F') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(400, 675, 75, 250);


      // inner key 3
      fill(0, 0, 0);
      rect(455, 675, 40, 150);
    }

    if (keyPressed == true && key == 'G') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(475, 675, 75, 250);

      // inner key 3
      fill(0, 0, 0);
      rect(455, 675, 40, 150);

      // inner key 4
      fill(0, 0, 0);
      rect(530, 675, 40, 150);
    }

    if (keyPressed == true && key == 'H') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(550, 675, 75, 250);

      // inner key 4
      fill(0, 0, 0);
      rect(530, 675, 40, 150);

      // inner key 5
      fill(0, 0, 0);
      rect(605, 675, 40, 150);
    }

    if (keyPressed == true && key == 'J') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(625, 675, 75, 250);


      // inner key 5
      fill(0, 0, 0);
      rect(605, 675, 40, 150);
    }

    if (keyPressed == true && key == 'K') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(700, 675, 75, 250);


      // inner key 6 
      fill(0, 0, 0);
      rect(755, 675, 40, 150);
    }

    if (keyPressed == true && key == 'L') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(775, 675, 75, 250);


      // inner key 6 
      fill(0, 0, 0);
      rect(755, 675, 40, 150);



      // inner key 7
      fill(0, 0, 0);
      rect(830, 675, 40, 150);
    }

    if (keyPressed == true && key == ';') {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255, 0, 0);
      rect(850, 675, 75, 250);


      // inner key 7
      fill(0, 0, 0);
      rect(830, 675, 40, 150);
    }

    if (keyPressed == true && key == 'W') {
      // inner key 1
      fill(255, 0, 0);
      rect(230, 675, 40, 150);
    }
    if (keyPressed == true && key == 'E') {


      // inner key 2
      fill(255, 0, 0);
      rect(305, 675, 40, 150);
    }
    if (keyPressed == true && key == 'R') {
      // inner key 3
      fill(255, 0, 0);
      rect(455, 675, 40, 150);
    }
    if (keyPressed == true && key == 'T') {
      // inner key 4
      fill(255, 0, 0);
      rect(530, 675, 40, 150);
    }
    if (keyPressed == true && key == 'Y') {
      // inner key 5
      fill(255, 0, 0);
      rect(605, 675, 40, 150);
    }
    if (keyPressed == true && key == 'U') {
      // inner key 6 
      fill(255, 0, 0);
      rect(755, 675, 40, 150);
    }
    if (keyPressed == true && key == 'I') {
      // inner key 7
      fill(255, 0, 0);
      rect(830, 675, 40, 150);
    }


    // Timer, after 0.5 seconds it turns the keys to white
    if (millis() > timer + 500) {
      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(175, 675, 75, 250);
      fill(0, 0, 0);
      rect(230, 675, 40, 150);





      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(250, 675, 75, 250);

      // inner key 1
      fill(0, 0, 0);
      rect(230, 675, 40, 150);

      // inner key 2
      fill(0, 0, 0);
      rect(305, 675, 40, 150);




      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(325, 675, 75, 250);

      // inner key 2
      fill(0, 0, 0);
      rect(305, 675, 40, 150);




      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(400, 675, 75, 250);


      // inner key 3
      fill(0, 0, 0);
      rect(455, 675, 40, 150);


      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(475, 675, 75, 250);

      // inner key 3
      fill(0, 0, 0);
      rect(455, 675, 40, 150);

      // inner key 4
      fill(0, 0, 0);
      rect(530, 675, 40, 150);



      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(550, 675, 75, 250);

      // inner key 4
      fill(0, 0, 0);
      rect(530, 675, 40, 150);

      // inner key 5
      fill(0, 0, 0);
      rect(605, 675, 40, 150); 


      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(625, 675, 75, 250);


      // inner key 5
      fill(0, 0, 0);
      rect(605, 675, 40, 150); 



      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(700, 675, 75, 250);


      // inner key 6 
      fill(0, 0, 0);
      rect(755, 675, 40, 150);



      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(775, 675, 75, 250);


      // inner key 6 
      fill(0, 0, 0);
      rect(755, 675, 40, 150);



      // inner key 7
      fill(0, 0, 0);
      rect(830, 675, 40, 150);



      stroke(0, 0, 0);
      strokeWeight(5);
      fill(255);
      rect(850, 675, 75, 250);


      // inner key 7
      fill(0, 0, 0);
      rect(830, 675, 40, 150);
      timer = millis();
    }
  }
}
