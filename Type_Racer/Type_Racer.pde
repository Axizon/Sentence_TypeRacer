String sentences[]; 
Excerpt currentSentence;
Word currentWord;
String input;
boolean playing = true;
int mistakes;
int count;
int ticks;
String acc;
String wpm;
int score;
boolean done;

void setup() {
  textAlign(LEFT, TOP);
  size(900, 220);
  background(20);
  sentences = loadStrings("sentences.txt");
  currentSentence = new Excerpt(sentences[int(random(0, sentences.length))]);
  currentWord = new Word(currentSentence.words[0]);
  input = "";
  mistakes = 0;
  score = 0;
  frameRate(60);
}

void draw() {
  background(20);
  noStroke();
  if (done) {
    fill(#0085CF);
    currentSentence.display();
    textSize(15);
    rect(50, 35, 800, 2);
    fill(255);
    text("Accuracy: " + acc, 250, 150);
    if (ticks/3600 < 10) {
      if (ticks/60 < 10) {
        text("Time Elapsed: 0" + ticks/3600 + ":0" + (ticks/60)%60, 50, 150);
      }
      else {
        text("Time Elapsed: 0" + ticks/3600 + ":" + (ticks/60)%60, 50, 150);
      }
    }
    else {
      if (ticks/60 < 10) {
        text("Time Elapsed: " + ticks/3600 + ":0" + (ticks/60)%60, 50, 150);
      }
      else {
        text("Time Elapsed: " + ticks/3600 + ":" + (ticks/60)%60, 50, 150);
      }
    }
    text("WPM: " + wpm, 435, 150);
    text("Score: " + score, 600, 150);
    textSize(35);
    text("Sentence completed. Press space to continue.", 50, 85);
    return;
  }
  fill(#BF2121);
  rect(50, 35, 800, 2);
  fill(#0085CF);
  int chunk = 800/currentSentence.wordcount;
  rect(50, 35, chunk*(float(currentSentence.completed)), 2);
  currentSentence.display();
  if (playing) {
    ticks++;
  }
  currentWord.findNext(input);
  currentSentence.current = currentWord.next + 1;
  if (!currentWord.isCorrect()) {
    if (currentSentence.mistake != true) {
      mistakes++;
    }
  }//DISPLAYS SENTENCE
  
  currentSentence.mistake = !currentWord.isCorrect();
  fill(255);
  textSize(35);
  if ((ticks/30)%2 == 0) {
    text(">   " + input, 50, 85);
  }
  else {
    text(">   " + input + "_", 50, 85);
  }
  //DISPLAYS INPUT
  
  
  textSize(15);
  if (ticks/3600 < 10) {
    if (ticks/60 < 10) {
      text("Time Elapsed: 0" + ticks/3600 + ":0" + (ticks/60)%60, 50, 150);
    }
    else {
      text("Time Elapsed: 0" + ticks/3600 + ":" + (ticks/60)%60, 50, 150);
    }
  }
  else {
    if (ticks/60 < 10) {
      text("Time Elapsed: " + ticks/3600 + ":0" + (ticks/60)%60, 50, 150);
    }
    else {
      text("Time Elapsed: " + ticks/3600 + ":" + (ticks/60)%60, 50, 150);
    }
  }// DISPLAYS TIMER
  
  
  if (count != 0) {
    acc = str(((float(count) - float(mistakes))/float(count))*100) + "%";
  }
  else {
    acc = "--";
  }
  text("Accuracy: " + acc, 250, 150);
  ////DISPLAYS ACCURACY
  
  
  if (count != 0) {
    wpm = str(round((float(currentSentence.completed))/(float(ticks)/3600)));
  }
  else {
    wpm = "--";
  }
  text("WPM: " + wpm, 435, 150);
  
  
  text("Score: " + score, 600, 150);
  
  if (!playing) {
    text("PAUSED - Click to Resume", 50, 175);
  }//DISPLAYS PAUSE INFO
}//Readability of this code is -99999.

void keyPressed() {
  if (key == CODED) {
  }
  else {
    if (playing) {
      if (keyCode == BACKSPACE) {
        if (input != "") {
          input = input.substring(0, input.length() - 1);
        }
      }
      else if (key == ' ') {
        if (done) {
          mistakes = 0;
          count = 0;
          ticks = 0;
          score = 0;
          input = "";
          currentSentence = new Excerpt(sentences[int(random(0, sentences.length))]);
          currentWord = new Word(currentSentence.words[0]);
          done = false;
          //moves to next sentence
        }
        else if (currentWord.isDone()) {
          input = "";
          currentSentence.completed++;
          if (currentSentence.isDone()) {
            currentSentence.mistake = false;
            currentSentence.current = 1;
            score += currentWord.masterChar.length * 100;
            done = true;
            // resets sentence
          }
          else {
            currentSentence.mistake = false;
            currentSentence.current = 1;
            score += currentWord.masterChar.length * 100;
            currentWord = new Word(currentSentence.words[currentSentence.completed]);
          } // resets word
        }
        else {
          input = input + key;
        }
      }
      else {
        input = input + key;
        if (currentWord.isCorrect()) {
          count++;
        }
      }
    }
  }
}

void mouseClicked() {
  playing = !playing;
}
