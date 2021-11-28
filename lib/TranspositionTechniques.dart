class TranspositionTechniques {
  String _filterText(String text) {
    text = text.toUpperCase();
    text = text.replaceAll(new RegExp(r'[^\w]+'), '');
    return text;
  }

  String railFenceCipher(String plain, int depth) {
    String cipher = "";
    plain = _filterText(plain);

    var railFence = List<String>.filled(depth, "", growable: false);

    // int i = 0;
    // int flag = 0;
    // while(flag == 0){
    //
    //   int j = -1;
    //   for(j=0; j < depth; j++) {
    //     railFence[j] += plain[i];
    //     if(i < plain.length - 1)
    //       i++;
    //     else
    //       flag = 1;
    //   }
    //   for(j=depth-2; j > 0; j--){
    //     railFence[j] += plain[i];
    //     if(i < plain.length - 1)
    //       i++;
    //     else
    //       flag = 1;
    //   }
    // }

    bool moveDown = true;
    int depthCount = 0;
    for (int i = 0; i < plain.length; i++) {
      railFence[depthCount] += plain[i];
      if (moveDown)
        depthCount++;
      else
        depthCount--;
      if (depthCount == 0 || depthCount == depth - 1) moveDown = !moveDown;
    }

    for (int i = 0; i < depth; i++) cipher += railFence[i];
    print(cipher);
    return cipher;
  }

  String railFenceDecryption(String cipher, int depth) {
    String plain = "";
    var railFence = List<String>.filled(depth, "", growable: false);

    return plain;
  }

  String rowTranspositionEncryption(String plain, String key) {
    plain = _filterText(plain);
    key = _filterText(key);
    String cipher = "";

    int noRows = plain.length ~/ key.length;
    if (plain.length % key.length != 0) noRows++;

    var table = new List<String>.filled(noRows, "", growable: false);

    for (int i = 0; i < noRows; i++) {
      for (int j = 0; j < key.length; j++) {
        if ((i * key.length) + j < plain.length)
          table[i] += plain[(i * key.length) + j];
        else
          table[i] += "x";
      }
    }

    int minIndex = 0;
    for (int k = 0; k < key.length; k++) {
      for (int i = 0; i < key.length; i++)
        if (key.codeUnitAt(i) < key.codeUnitAt(minIndex)) minIndex = i;

      for (int j = 0; j < noRows; j++) cipher += table[j][minIndex];
      key = key.replaceFirst(RegExp(key[minIndex]), '|');
    }

    print(cipher);
    return cipher;

    // var minCol = key[0];
    // for(int i = 0; i < key.length; i++){
    //   if()
    // }

    // String finished = "";
    // int minValue;
    // for (int k = 0; k < key.length; k++) {
    //   minValue = 200;
    //   for (int i = 0; i < key.length; i++) {
    //     if (key.codeUnitAt(i) < minValue && !finished.contains(key[i])) {
    //       minValue = key.codeUnitAt(i);
    //     }
    //   }
    //   finished += String.fromCharCode(minValue);
    //   int indexMin = key.indexOf(String.fromCharCode(minValue));
    //   for (int j = 0; j < noRows; j++) {
    //     cipher += table[j][indexMin];
    //   }
    // }
  }

  String rowTranspositionDecryption(String cipher, String key) {
    cipher = _filterText(cipher);
    key = _filterText(key);
    String plain = "";

    int noRows = cipher.length ~/ key.length;
    if (plain.length % key.length != 0) noRows++;

    // var table = new List<String>.filled(noRows, "", growable: false);
    var table =
    new List.generate(noRows, (_) => new List.filled(key.length, "", growable: false));

    int minIndex = 0;
    for (int k = 0; k < cipher.length; k++) {
      for (int i = 0; i < key.length; i++)
        if (key.codeUnitAt(i) < key.codeUnitAt(minIndex)) minIndex = i;

      for (int j = 0; j < noRows; j++) {
        table[j][minIndex] = cipher[k];
        k++;
        print(table);
      }
      k--;
      key = key.replaceFirst(RegExp(key[minIndex]), '|');
    }

    for(int i = 0; i < table.length; i++)
      plain += table[i].join();

    print (plain);
    return plain;
  }
}
