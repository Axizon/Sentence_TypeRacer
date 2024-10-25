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
  
  //void findNext(String test) {
  //  boolean assigned = false;
  //  testChar = test.toCharArray();
  //  int shortend; 
  //  if (testChar.length < masterChar.length) {
  //    shortend = testChar.length;
  //  }
  //  else {
  //    shortend = masterChar.length;
  //  }
  //  if (shortend != masterChar.length) {
  //    for (int i = 0; i < shortend; i++) {
  //      if (testChar[i] != masterChar[i]) {
  //        next = i;
  //        assigned = true;
  //      }
  //    }
  //    if (!assigned) {
  //      next = shortend;
  //    }
  //  }
  //  else {
  //    for (int i = 0; i < masterChar.length; i++) {
  //      if (testChar[i] != masterChar[i]) {
  //        next = i;
  //      }
  //      else {
  //        next = -1;
  //      }
  //    }
  //  }
  //} THIS CODE SHOULD NEVER BE ALLOWED TO SEE THE LIGHT OF DAY
  
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
  }//This code is pretty atrocious too
  
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
