class Word {
  String master;
  char[] masterChar;
  char[] testChar;
  boolean mistake;
  int next;
  
  Word(String m) {
    master = m;
    masterChar = master.toCharArray();
    mistake = false;
    next = 0;
  }
  
  void findNext(String test) {
    testChar = test.toCharArray();
    if (testChar.length == 0) {
      next = 0;
    }
    else {
      if (testChar.length == masterChar.length) {
        for (int i = 0; i < masterChar.length; i++) {
          if (testChar[i] != masterChar[i]) {
            next = i;
            break;
          }
          else {
            next = -1;
          }
        }
      }
      else if (testChar.length > masterChar.length) {
        for (int i = 0; i < masterChar.length; i++) {
          if (testChar[i] != masterChar[i]) {
            next = i;
            break;
          }
          else {
            next = i + 1;
          }
        }
        if (next > masterChar.length) {
          next = masterChar.length -1;
        }
      }
      else if (testChar.length < masterChar.length) {
        for (int i = 0; i < testChar.length; i++) {
          if (testChar[i] != masterChar[i]) {
            next = i;
            break;
          }
          else {
            next = i + 1;
          }
        }
      }
    }
  }
  
  boolean isCorrect() {
    if (next == -1) {
      return true;
    }
    else {
      if (testChar.length > next) {
        return false;
      }
      else {
        return true;
      }
    }
  }
  
  boolean isDone() {
    if (next == -1) {
      return true;
    }
    return false;
  }
}
