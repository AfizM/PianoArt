 //<>//
import controlP5.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import java.util.*;

Minim minim;
ControlP5 cp5;
FilePlayer player;
FilePlayer player1;
FilePlayer player2;
FilePlayer player3;
FilePlayer player4;
FilePlayer player5;
FilePlayer player6;
FilePlayer player7;
FilePlayer player8;
FilePlayer player9;
FilePlayer player10;
FilePlayer player11;
FilePlayer player12;
FilePlayer player13;
FilePlayer player14;
FilePlayer player15;
FilePlayer player16;
FilePlayer player17;

FilePlayer kick;
FilePlayer bass;
FilePlayer snare;
FilePlayer clap;

ArrayList<FilePlayer> players = new ArrayList<FilePlayer>();

char[] notes = {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', 'W', 'E', 'R', 'T', 'Y', 'U', 'I'};

ArrayList<Integer> keys = new ArrayList<Integer>();
ArrayList<Character> allKeysPressed = new ArrayList<Character>();

// First image colors
ArrayList<Integer> redcolors = new ArrayList<Integer>();
ArrayList<Integer> bluecolors = new ArrayList<Integer>();
ArrayList<Integer> greencolors = new ArrayList<Integer>();
ArrayList<Integer> blackcolors = new ArrayList<Integer>();
ArrayList<Integer> purplecolors = new ArrayList<Integer>();
ArrayList<Integer> yellowcolors = new ArrayList<Integer>();
ArrayList<Integer> browncolors = new ArrayList<Integer>();
ArrayList<Integer> blackAcolors = new ArrayList<Integer>();
ArrayList<Integer> greycolors = new ArrayList<Integer>();
ArrayList<Integer> allcolors = new ArrayList<Integer>();
ArrayList<Integer> orangecolors = new ArrayList<Integer>();
ArrayList<Integer> lightbluecolors = new ArrayList<Integer>();
ArrayList<Integer> lightgreencolors = new ArrayList<Integer>();
ArrayList<Integer> pinkcolors = new ArrayList<Integer>();

// Second image colors
ArrayList<Integer> redcolors2 = new ArrayList<Integer>();
ArrayList<Integer> bluecolors2 = new ArrayList<Integer>();
ArrayList<Integer> greencolors2 = new ArrayList<Integer>();
ArrayList<Integer> blackcolors2 = new ArrayList<Integer>();
ArrayList<Integer> purplecolors2 = new ArrayList<Integer>();
ArrayList<Integer> yellowcolors2 = new ArrayList<Integer>();
ArrayList<Integer> browncolors2 = new ArrayList<Integer>();
ArrayList<Integer> blackAcolors2 = new ArrayList<Integer>();
ArrayList<Integer> greycolors2 = new ArrayList<Integer>();
ArrayList<Integer> whitecolors2 = new ArrayList<Integer>();
ArrayList<Integer> orangecolors2 = new ArrayList<Integer>();
ArrayList<Integer> lightbluecolors2 = new ArrayList<Integer>();
ArrayList<Integer> lightgreencolors2 = new ArrayList<Integer>();
ArrayList<Integer> pinkcolors2 = new ArrayList<Integer>();

FilePlayer playback;
AudioSample reverseplayback;

AudioOutput output;
AudioInput input;
AudioRecorder recorder;

Delay myDelay;

int pageNumber = 2;
int pageCount1 = 0;
int pageCount2 = 0;

int whiteCount = 0;

PImage img;
PImage img2;

float volume = 6;
boolean changed = false;
boolean doneonce = false;
boolean doneonce2 = false;
boolean doneonce3 = false;
boolean doneonce4 = false;

Piano piano = new Piano();
void setup() {
  size(1150, 1000);
  img = loadImage("butterfly.png");
  img2 = loadImage("rainbowfish1.png");

  cp5 = new ControlP5(this);

  minim = new Minim(this);

  cp5.addKnob("controlVolume")
    .setLabel("Volume")
    .setRange(-6, 6)
    .setValue(0)
    .setPosition(105, 610)
    .setRadius(35)
    .setNumberOfTickMarks(4)
    .setTickMarkLength(4)
    .snapToTickMarks(true)
    .setColorForeground(color(#5A5A59))
    .setColorBackground(color(0))
    .setColorActive(color(255, 255, 0))
    .setDragDirection(Knob.HORIZONTAL)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;
  // Create buttons
  cp5.addButton("startRecord")
    .setLabel("Start")
    .setValue(0)
    .setPosition(200, 625)
    .setSize(200, 19)
    .setWidth(65)
    .setFont(createFont("Verdana Bold Italic", 10))
    .setHeight(33)

    ;

  cp5.addButton("stopRecord")
    .setLabel("Stop")
    .setValue(0)
    .setPosition(285, 625)
    .setSize(200, 19)
    .setWidth(65)
    .setHeight(33)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;

  cp5.addButton("playRecord")
    .setLabel("Play")
    .setValue(0)
    .setPosition(370, 625)  
    .setSize(200, 19)
    .setWidth(65)
    .setHeight(33)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;

  cp5.addButton("nextPage")
    .setLabel("Next Page")
    .setValue(0)
    .setPosition(980, 550)  
    .setSize(200, 19)
    .setWidth(78)
    .setHeight(33)
    .setFont(createFont("Verdana Bold Italic", 11))
    ;
  // Create toggles
  cp5.addToggle("doublespeed")
    .setPosition(455, 630)
    .setSize(75, 23)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;

  cp5.addToggle("halfspeed")
    .setPosition(540, 630)
    .setSize(75, 23)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;
  cp5.addToggle("reverse")
    .setPosition(625, 630)
    .setSize(75, 23)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;

  cp5.addToggle("echo")
    .setPosition(710, 630)
    .setSize(75, 23)
    .setValue(true)
    .setMode(ControlP5.SWITCH)
    .setFont(createFont("Verdana Bold Italic", 10))
    ;

  cp5.addToggle("bass")
    .setPosition(800, 620)
    .setSize(75, 17)
    .setValue(false)
    .setFont(createFont("Verdana Bold Italic", 10))
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  ;

  cp5.addToggle("kick")
    .setPosition(800, 645)
    .setSize(75, 17)
    .setValue(false)
    .setFont(createFont("Verdana Bold Italic", 10))
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  ;

  cp5.addToggle("clap")
    .setPosition(890, 620)
    .setSize(75, 17)
    .setValue(false)
    .setFont(createFont("Verdana Bold Italic", 10))
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  ;

  cp5.addToggle("snare")
    .setPosition(890, 645)
    .setSize(75, 17)
    .setValue(false)
    .setFont(createFont("Verdana Bold Italic", 10))
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  ;

  // Create text labels
  cp5.addTextlabel("recordStatus")
    .setText("Press Start to start recording")
    .setPosition(85, 550)
    .setColorValue(0xffffff00)
    .setFont(createFont("Verdana Bold Italic", 18))
    ;
  cp5.addTextlabel("instructions")
    .setText("Controls: " + "\n" + "White keys: ASDFGHJKL" + "\n" + "Black keys: WERTYUI")
    .setPosition(750, 540)
    .setColorValue(0xffffff00)
    .setFont(createFont("Verdana Bold Italic", 15))
    ;
  // White keys
  player1 = new FilePlayer(minim.loadFileStream("C4.mp3"));
  player2 = new FilePlayer(minim.loadFileStream("D4.mp3"));
  player3 = new FilePlayer(minim.loadFileStream("E4.mp3"));
  player4 = new FilePlayer(minim.loadFileStream("F4.mp3"));
  player5 = new FilePlayer(minim.loadFileStream("G4.mp3"));
  player6 = new FilePlayer(minim.loadFileStream("A4.mp3"));
  player7 = new FilePlayer(minim.loadFileStream("B4.mp3"));
  player8 = new FilePlayer(minim.loadFileStream("C5.mp3"));
  player9 = new FilePlayer(minim.loadFileStream("D5.mp3"));
  player10 = new FilePlayer(minim.loadFileStream("E5.mp3"));

  // Black keys
  player11 = new FilePlayer(minim.loadFileStream("Db4.mp3"));
  player12 = new FilePlayer(minim.loadFileStream("Eb4.mp3"));
  player13 = new FilePlayer(minim.loadFileStream("Gb4.mp3"));
  player14 = new FilePlayer(minim.loadFileStream("Ab4.mp3"));
  player15 = new FilePlayer(minim.loadFileStream("Bb4.mp3"));
  player16 = new FilePlayer(minim.loadFileStream("Db5.mp3"));
  player17 = new FilePlayer(minim.loadFileStream("Eb5.mp3"));


  // Adding all players to arraylist players

  players.add(player1);
  players.add(player2);
  players.add(player3);
  players.add(player4);
  players.add(player5);
  players.add(player6);
  players.add(player7);
  players.add(player8);
  players.add(player9);
  players.add(player10);
  players.add(player11);
  players.add(player12);
  players.add(player13);
  players.add(player14);
  players.add(player15);
  players.add(player16);
  players.add(player17);


  // Get an lineOut which is an output
  output = minim.getLineOut();
  // Creates a AudioRecorder that records into output.wav taking sound from the output
  recorder = minim.createRecorder(output, dataPath("output.wav"), true);
  // For each player in players patch that player to the output
  for (FilePlayer player : players) {

    player.patch(output);
    //Gain g1 = new Gain(15);
    //  player.patch(g1).patch(output);
  }
  // Load mp3 files into FilePlayers
  kick = new FilePlayer(minim.loadFileStream("kick.mp3"));
  snare = new FilePlayer(minim.loadFileStream("snare.mp3"));
  clap = new FilePlayer(minim.loadFileStream("clap.mp3"));
  bass = new FilePlayer(minim.loadFileStream("bass.mp3"));
  // Create gain with value of -20 db and patch the kick FilePlayer to the gain and then patch it to the output
  Gain g1 = new Gain(-20);
  kick.patch(g1).patch(output);
  Gain g2 = new Gain(-20);
  snare.patch(g2).patch(output);
  Gain g3 = new Gain(-20);
  clap.patch(g3).patch(output);
  Gain g4 = new Gain(-20);
  bass.patch(g4).patch(output);
  // Resize images to fit canvas
  img.resize(960, 485);
  img2.resize(960, 485);
}
void nextPage() {
  pageNumber += 1;

  if (pageNumber == 3) {
    pageNumber = 1;
  }
  // Set the white count to 0 and clear shapes
  whiteCount = 0;
  allKeysPressed.clear();
}

void startRecord() {
  // If recorder is not recording then begin recording
  if ( !recorder.isRecording() ) 
  {
    //recorder.endRecord();
    recorder.beginRecord();
  } 
  cp5.getController("recordStatus").setValueLabel("Recording " );
}
void stopRecord() {
  // If the reocorder is recording then end the recording

  if ( recorder.isRecording() ) 
  {
    recorder.endRecord();
  } 
  cp5.getController("recordStatus").setValueLabel("Stopped recording " );
}

void playRecord() {


  cp5.getController("recordStatus").setValueLabel("Playing Recording" );
  if (cp5.getController("doublespeed").getValue() == 0) {
    // Saves the recording into output.wav
    recorder.save();
    println("Saved.");
    // Create a new recorder
    recorder = minim.createRecorder(output, dataPath("output.wav"), true);
    // Set the playback FilePlayer to a new FilePlayer loading in the output that was recorded previously
    playback = new FilePlayer(minim.loadFileStream("output.wav"));
    // Create a TickRate object with a rate of 2
    TickRate rate = new TickRate(2);
    //Create a gain object with the value of volume from the volume knob
    Gain gain = new Gain(volume);
    // Patch the playback to the gain and then patch then patch it to the output
    playback.patch(gain).patch(output);
    // Patch the playback to the rate control and then patch it to the output
    playback.patch(rate).patch(output);
    // Play the final playback
    playback.play();
  } else if (cp5.getController("reverse").getValue() == 0) {
    // Saves the recording into output.wav
    recorder.save();
    println("Saved.");
    // Create a new recorder
    recorder = minim.createRecorder(output, dataPath("output.wav"), true);
    // Set the AudioSample reverseplayback to the output.wav which is what was recorded
    reverseplayback = minim.loadSample("output.wav");
    // Get an float array of the left channel and right channel
    float[] leftChannel = reverseplayback.getChannel(AudioSample.LEFT);
    float[] rightChannel = reverseplayback.getChannel(AudioSample.RIGHT);
    // Reverse both arrays
    float[] leftReversed = reverse(leftChannel);
    float[] rightReversed = reverse(rightChannel);
    // Use array copy to copy the left and right reversed into the original left channel and right channel array to reverse it
    System.arraycopy(leftReversed, 0, leftChannel, 0, leftChannel.length);
    System.arraycopy(rightReversed, 0, rightChannel, 0, rightChannel.length);
    // Play the reverseplayblack FilePlayer
    reverseplayback.trigger();
  } else if (cp5.getController("halfspeed").getValue() == 0) {
    // Saves the recording into output.wav
    recorder.save();
    println("Saved.");
    // Create a new recorder
    recorder = minim.createRecorder(output, dataPath("output.wav"), true);
    // Set the playback FilePlayer to a new FilePlayer loading in the output that was recorded previously
    playback = new FilePlayer(minim.loadFileStream("output.wav"));
    // Create a TickRate object with a rate of 0.5
    TickRate rate = new TickRate(0.5);
    //Create a gain object with the value of volume from the volume knob
    Gain gain = new Gain(volume);
    // Patch the playback to the gain and then patch then patch it to the output
    playback.patch(gain).patch(output);
    // Patch the playback to the rate control and then patch it to the output
    playback.patch(rate).patch(output);
    // Play the final playback
    playback.play();
  } else if (cp5.getController("echo").getValue() == 0) {
    // Saves the recording into output.wav
    recorder.save();
    println("Saved.");
    // Create a new recorder
    recorder = minim.createRecorder(output, dataPath("output.wav"), true);
    // Set the playback FilePlayer to a new FilePlayer loading in the output that was recorded previously
    playback = new FilePlayer(minim.loadFileStream("output.wav"));
    // Create a delay object with maxDelay time as 0.5, amplitudeFactor as 0.5, feedback on as true and passAudio on as true
    myDelay = new Delay( 0.5, 0.5, true, true );
    //Create a gain object with the value of volume from the volume knob
    Gain gain = new Gain(volume);
    // Patch the playback to the gain and then patch then patch it to the output
    playback.patch(gain).patch(output);
    // Patch playback to myDelay then patch that to the output
    playback.patch(myDelay).patch(output);
    // Play the playback
    playback.play();
  } 

  // Else if none of the options are toggled replay the recording with a rate of 1 so it sounds the same as original sounds recorded
  else { 
    recorder.save();
    println("Saved.");
    recorder = minim.createRecorder(output, dataPath("output.wav"), true);

    playback = new FilePlayer(minim.loadFileStream("output.wav"));
    TickRate rate = new TickRate(1);
    Gain gain = new Gain(volume);
    playback.patch(gain).patch(output);
    playback.patch(rate).patch(output);
    playback.play();
  }
  drawImageBackground();
}




void drawImageBackground() {
  if (pageNumber == 1) {
    img.updatePixels();
    int count = 0;
    // Going through every pixel of the background of the image, get the current key in allKeysPressed, and set that pixel to a color, with lower notes having darker colors 
    // and higher notes having lighter colors, if it reaches the end of the allKeysPressed array, count is set to 0 and goes through the array again
    for (int number : allcolors) {
      if (count == allKeysPressed.size()) {
        count = 0;
      }
      if (allKeysPressed.get(count) == 'A') {
        img.pixels[number] = color(116, 0, 0);
        //img.pixels[number] = color(#EAC5C5);
      } else if (allKeysPressed.get(count) == 'S') {
        img.pixels[number] = color(238, 0, 0);
      } else if (allKeysPressed.get(count) == 'D') {
        img.pixels[number] = color(255, 236, 0);
      } else if (allKeysPressed.get(count) == 'F') {
        img.pixels[number] = color(40, 25, 0);
      } else if (allKeysPressed.get(count) == 'G') {
        img.pixels[number] = color(0, 124, 255);
      } else if (allKeysPressed.get(count) == 'H') {
        img.pixels[number] = color(69, 0, 234);
      } else if (allKeysPressed.get(count) == 'J') {
        img.pixels[number] = color(85, 0, 79 );
      } else if (allKeysPressed.get(count) == 'K') {
        img.pixels[number] = color(55, 0, 79);
      } else if (allKeysPressed.get(count) == 'L') {
        img.pixels[number] = color(0, 255, 232);
      } else if (allKeysPressed.get(count) == ';') {
        img.pixels[number] = color(0, 255, 232);
      } else if (allKeysPressed.get(count) == 'W') {
        img.pixels[number] = color(82, 52, 0);
      } else if (allKeysPressed.get(count) == 'E') {
        img.pixels[number] = color(179, 0, 0);
      } else if (allKeysPressed.get(count) == 'R') {
        img.pixels[number] = color(255, 99, 0);
      } else if (allKeysPressed.get(count) == 'T') {
        img.pixels[number] = color(153, 255, 0);
      } else if (allKeysPressed.get(count) == 'Y') {
        img.pixels[number] = color(0, 255, 232);
      } else if (allKeysPressed.get(count) == 'U') {
        img.pixels[number] = color(5, 0, 255);
      } else if (allKeysPressed.get(count) == 'I') {
        img.pixels[number] = color(87, 0, 158);
      }
      count++;
    }
  } else if (pageNumber == 2) {
    img2.updatePixels();
    int count = 0;
    // Going through every pixel of the background of the image, get the current key in allKeysPressed, and set that pixel to a color, with lower notes having darker colors 
    // and higher notes having lighter colors, if it reaches the end of the allKeysPressed array, count is set to 0 and goes through the array again
    for (int number : whitecolors2) {
      if (count == allKeysPressed.size()) {
        count = 0;
      }
      if (allKeysPressed.get(count) == 'A') {
        img2.pixels[number] = color(116, 0, 0);
        //img.pixels[number] = color(#EAC5C5);
      } else if (allKeysPressed.get(count) == 'S') {
        img2.pixels[number] = color(238, 0, 0);
      } else if (allKeysPressed.get(count) == 'D') {
        img2.pixels[number] = color(255, 236, 0);
      } else if (allKeysPressed.get(count) == 'F') {
        img2.pixels[number] = color(40, 25, 0);
      } else if (allKeysPressed.get(count) == 'G') {
        img2.pixels[number] = color(0, 124, 255);
      } else if (allKeysPressed.get(count) == 'H') {
        img2.pixels[number] = color(69, 0, 234);
      } else if (allKeysPressed.get(count) == 'J') {
        img2.pixels[number] = color(85, 0, 79 );
      } else if (allKeysPressed.get(count) == 'K') {
        img2.pixels[number] = color(55, 0, 79);
      } else if (allKeysPressed.get(count) == 'L') {
        img2.pixels[number] = color(0, 255, 232);
      } else if (allKeysPressed.get(count) == ';') {
        img2.pixels[number] = color(0, 255, 232);
      } else if (allKeysPressed.get(count) == 'W') {
        img2.pixels[number] = color(82, 52, 0);
      } else if (allKeysPressed.get(count) == 'E') {
        img2.pixels[number] = color(179, 0, 0);
      } else if (allKeysPressed.get(count) == 'R') {
        img2.pixels[number] = color(255, 99, 0);
      } else if (allKeysPressed.get(count) == 'T') {
        img2.pixels[number] = color(153, 255, 0);
      } else if (allKeysPressed.get(count) == 'Y') {
        img2.pixels[number] = color(0, 255, 232);
      } else if (allKeysPressed.get(count) == 'U') {
        img2.pixels[number] = color(5, 0, 255);
      } else if (allKeysPressed.get(count) == 'I') {
        img2.pixels[number] = color(87, 0, 158);
      }

      count++;
    }
  }
}


void draw() {
  // If kick toggle is toggled, if it isn't done once then play the kick FilePlayer on a loop, simillar procedure for  snare bass and clap
  if (cp5.getController("kick").getValue() == 1) {
    if (!doneonce) {
      kick.loop();
      doneonce = true;
    }
  }
  // If kick is not toggled, then pause the kick FilePlayer, simillar procedure for  snare bass and clap
  if (cp5.getController("kick").getValue() == 0) {
    kick.pause();
    doneonce = false;
  }

  if (cp5.getController("snare").getValue() == 1) {
    if (!doneonce2) {
      snare.loop();
      doneonce2 = true;
    }
  }

  if (cp5.getController("snare").getValue() == 0) {
    snare.pause();
    doneonce2 = false;
  }

  if (cp5.getController("bass").getValue() == 1) {
    if (!doneonce3) {
      bass.loop();
      doneonce3 = true;
    }
  }

  if (cp5.getController("bass").getValue() == 0) {
    bass.pause();
    doneonce3 = false;
  }

  if (cp5.getController("clap").getValue() == 1) {
    if (!doneonce4) {
      clap.loop();
      doneonce4 = true;
    }
  }

  if (cp5.getController("clap").getValue() == 0) {
    clap.pause();
    doneonce4 = false;
  }

  // Set the volume variable to whatever the knob's value is
  volume = cp5.getController("controlVolume").getValue();

  background(165);
  drawPixelCanvas();
  stroke(0);
  strokeWeight(0);
  piano.drawPiano();
  //drawPiano();
  //If it's the first page , go through each pixel of the first image and add the different colors of that image to multiple arrays
  if (pageNumber == 1) {
    image(img, 93, 28);

    if (pageCount1 == 0) {
      img.loadPixels();
      for (int i = 0; i < img.pixels.length; i++) {
        color c = img.pixels[i];
        if (c == #010101) {
          blackcolors.add(i);
        } else if (c == #cd0ddc) {
          purplecolors.add(i);
        } else if (c == #ffff00) {
          yellowcolors.add(i);
        } else if (c == #ff0000) {
          redcolors.add(i);
        } else if (c == #0000ff) {
          bluecolors.add(i);
        } else if (c == #3cf60a) {
          greencolors.add(i);
        } else if (c == #85480c) {
          browncolors.add(i);
        } else if (c < color(128)) {
          blackAcolors.add(i);
        }
        if (c == #ffffff) {
          allcolors.add(i);
        }
      }
      pageCount1 = 1;
    } 
    // If the whiteCount is 0, set the entire image to white, and set whtieCount to 1, when the next page button is pressed, white count is reset to 0
    if (whiteCount == 0) {
      img.updatePixels();
      // Make the image white
      img.loadPixels();

      for (int i = 0; i < img.pixels.length; i++) {

        img.pixels[i] = color(255);
      }

      img.updatePixels();
      whiteCount = 1;
      image(img, 85, 28);
    }
  }
  // Else If it's the second page , go through each pixel of the second image and add the different colors of that image to multiple arrays

  else if (pageNumber == 2) {
    image(img2, 93, 28);

    if (pageCount2 == 0) {
      img2.loadPixels();
      for (int i = 0; i < img2.pixels.length; i++) {
        color c = img2.pixels[i];
        if (c == #a349a4) {
          purplecolors2.add(i);
        } else if (c == #fff200) {
          yellowcolors2.add(i);
        } else if (c == #e31c24) {
          redcolors2.add(i);
        } else if (c == #3f48cc) {
          bluecolors2.add(i);
        } else if (c == #22b14c) {
          greencolors2.add(i);
        } else if (c == #b97a57) {
          browncolors2.add(i);
        } else if (c == #000000) {
          blackAcolors2.add(i);
        } else if (c == #ffffff) {
          whitecolors2.add(i);
        } else if (c == #ff7f27) {
          orangecolors2.add(i);
        } else if (c == #00a2e8) {
          lightbluecolors2.add(i);
        } else if (c == #b5e61d) {
          lightgreencolors2.add(i);
        } else if (c == #ffaec9) {
          pinkcolors2.add(i);
        } else if (c < color(230)) {
          blackcolors2.add(i);
        }
      }
      pageCount2 = 1;
    }
    // If the whiteCount is 0, set the entire image to white, and set whtieCount to 1, when the next page button is pressed, white count is reset to 0
    if (whiteCount == 0) {
      img2.updatePixels();

      img2.loadPixels();

      for (int i = 0; i < img2.pixels.length; i++) {

        img2.pixels[i] = color(255);
      }
      img2.updatePixels();
      whiteCount = 1;
    }
    image(img2, 93, 28);
  }



  // for every letter in notes, if the key that was pressed equals notes, then play the note and add that note to allKeysPressed
  if (keyPressed == true) {
    for (int i = 0; i < notes.length; i++) {
      if (key == notes[i]) {
        players.get(i).rewind();
        players.get(i).play();
        allKeysPressed.add(notes[i]);
      }
    }
  }



  // If its the first page, if keyPressed and key equals A, then get every position of the redcolors array and sets the color to a random color, similar procedure for all the following except for the K key which sets the color to a black color instead
  if (pageNumber == 1) {
    if (keyPressed && key == 'A') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : redcolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'S') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : bluecolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'D') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : greencolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'F') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : blackcolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'G') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : purplecolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'H') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : yellowcolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'J') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : browncolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'K') {
      img.loadPixels();
      for (int number : blackAcolors) {
        img.pixels[number] = #000000;
      }
      img.updatePixels();
    }

    if (keyPressed && key == 'L') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : redcolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }

    if (keyPressed && key == ';') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : bluecolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'W') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : greencolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'E') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : blackcolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'R') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : purplecolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'T') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : yellowcolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'Y') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : browncolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'U') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : bluecolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
    if (keyPressed && key == 'I') {
      color randomColor = (color) random(#000000);
      img.loadPixels();
      for (int number : greencolors) {
        img.pixels[number] = randomColor;
      }
      img.updatePixels();
    }
  }

  // If its the second page, if keyPressed and key equals A, then get every position of the redcolors2 array and sets the color to a random color, similar procedure for all the following except for the F and K key which sets the color to a black color instead
  if (pageNumber == 2) {
    if (keyPressed && key == 'A') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : redcolors2) {
        img2.pixels[number] = randomColor;
      }

      img2.updatePixels();
    }

    if (keyPressed && key == 'S') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : lightbluecolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'D') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : greencolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'F') {
      img2.loadPixels();
      for (int number : blackcolors2) {
        img2.pixels[number] = #000000;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'G') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : purplecolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'H') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : yellowcolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'J') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : browncolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'K') {
      img2.loadPixels();
      for (int number : blackAcolors2) {
        img2.pixels[number] = #000000;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'L') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : greycolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }
    if (keyPressed && key == 'W') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : orangecolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'E') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : bluecolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }
    if (keyPressed && key == 'R') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : lightgreencolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }
    if (keyPressed && key == 'T') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : pinkcolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }

    if (keyPressed && key == 'Y') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : redcolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }
    if (keyPressed && key == 'U') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : bluecolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }
    if (keyPressed && key == 'I') {
      color randomColor = (color) random(#000000);
      img2.loadPixels();
      for (int number : greencolors2) {
        img2.pixels[number] = randomColor;
      }
      img2.updatePixels();
    }
  }

  piano.highlightKeyOnPress();
}
void drawPixelCanvas() {
  stroke(#E8AB0E);
  strokeWeight(15);
  fill(0, 0, 0);
  rect(85, 20, 975, 500);
}
