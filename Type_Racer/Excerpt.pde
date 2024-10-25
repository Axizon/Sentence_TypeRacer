class Excerpt {
  String Sentence;
  String[] words;
  int wordcount;
  int completed;
  int current;
  boolean mistake;
  
  Excerpt(String sent) {
    Sentence = sent;
    words = Sentence.split(" ");
    wordcount = words.length;
    completed = 0;
    current = 1;
    mistake = false;
  }
  
  void display() {
    boolean done = false;
    textSize(20);
    String finished = "";
    String currentLetter = "";
    String currentWord = "";
    fill(#AFAFAF);
    text(Sentence, 50, 50);
    if (current == 0) {
      current = words[completed].length();
      done = true;
    }
    if (completed == words.length) {
      fill(#0085CF);
      text(Sentence, 50, 50);
      return;
    }
    if (current > words[completed].length()) {
      current = words[completed].length();
    }
    for (int i = 0; i < completed; i++) {
      if (i == 0) {
        finished = words[i];
      }
      else {
        finished = finished + " " + words[i];
      }
    }
    if (completed == 0) {
      currentLetter = currentLetter + words[completed].substring(0, current);
      currentWord = currentWord + words[completed].substring(0, current - 1);
    }
    else {
      if (completed == words.length) {
        currentLetter = "";
        currentWord = "";
      }
      else {
        currentLetter = finished + " " + words[completed].substring(0, current);
        currentWord = finished + " " + words[completed].substring(0, current - 1);
      }
    }
    fill(20);
    text(currentLetter, 50, 50);
    if (mistake) {
      fill(#BF2121);
    }
    else if (done) {
      fill(#228E1B);
    }
    else {
      fill(#FFFFFF);
    }
    text(currentLetter, 50, 50);
    fill(20);
    text(currentWord, 50, 50);
    fill(#228E1B);
    text(currentWord, 50, 50);
    fill(20);
    text(finished, 50, 50);
    fill(#0085CF);
    text(finished, 50, 50);
  }
  
  boolean isDone() {
    if (completed == words.length) {
      return true;
    }
    else {
      return false;
    }
  }
}
