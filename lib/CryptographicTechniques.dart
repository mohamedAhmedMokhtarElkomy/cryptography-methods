import 'package:flutter/material.dart';

class CryptoGraphicTechniques {

  List _methods = List<Method>.empty(growable: true);

  CryptoGraphicTechniques(){
   _methods.add(Method("Ceaser", "substitution", Colors.yellow));
   _methods.add(Method("Vigener", "substitution", Colors.orange));
   _methods.add(Method("Rail Fence", "Transposition", Colors.blue));
   _methods.add(Method("Row Transposition", "Transposition", Colors.redAccent));
  }


  List get methods => _methods;

  String _filterText(String text) {
    text = text.toUpperCase();
    text = text.replaceAll(new RegExp(r'[^\w]+'), '');
    print(text);

    return text;
  }

  String ceaserEncryption(String plain, int key) {
    plain = _filterText(plain);
    String cipher = "";

    for (int i = 0; i < plain.length; i++) {
      int currentChar = plain.codeUnitAt(i);

      if (currentChar >= 65 && currentChar <= 90) {
        currentChar -= 65;
        currentChar += key;
        currentChar = currentChar % 26;
        currentChar += 65;

        cipher += String.fromCharCode(currentChar);
      }
    }
    print(cipher);
    return cipher;
  }

  String ceaserDecryption(String cipher, int key) {
    cipher = _filterText(cipher);
    String plain = "";

    for (int i = 0; i < cipher.length; i++) {
      int currentChar = cipher.codeUnitAt(i);

      if (currentChar >= 65 && currentChar <= 90) {
        currentChar -= 65;
        currentChar -= key;
        currentChar = currentChar % 26;
        currentChar += 65;

        plain += String.fromCharCode(currentChar);
      }
    }

    print(plain);
    return plain;
  }

  String vigenereEncryption(String plain, String key) {
    plain = _filterText(plain);
    key = _filterText(key);

    String cipher = "";

    for (int i = 0; i < plain.length; i++) {
      // currentChar = (((key.codeUnitAt(i % key.length) + text.codeUnitAt(i)) - 65) % 26) + 65;
      cipher += String.fromCharCode(
          (((key.codeUnitAt(i % key.length) + (plain.codeUnitAt(i))) - 65*2) % 26) + 65);
    }

    print(cipher);
    return cipher;
  }

  String vigenereDecryption(String cipher, String key) {
    cipher = _filterText(cipher);
    key = _filterText(key);

    String plain = "";
    int currentChar = 0;
    for (int i = 0; i < cipher.length; i++) {
      currentChar = cipher.codeUnitAt(i);
      currentChar -= 65;
      currentChar -= (key.codeUnitAt(i % key.length) - 65);
      currentChar = currentChar % 26;
      currentChar += 65;
      plain += String.fromCharCode(currentChar);
    }

    print(plain);
    return plain;
  }

  String railFenceEncryption(String plain, int depth) {
    String cipher = "";
    plain = _filterText(plain);

    var railFence = List<String>.filled(depth, "", growable: false);
    
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

  String rowTranspositionEncryption(String plain, String key) {
    plain = _filterText(plain);
    key = _filterText(key);
    String cipher = "";

    int rowsNo = plain.length ~/ key.length;
    if (plain.length % key.length != 0) rowsNo++;

    var table = new List<String>.filled(rowsNo, "", growable: false);

    for (int i = 0; i < rowsNo; i++) {
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

      for (int j = 0; j < rowsNo; j++) cipher += table[j][minIndex];
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
    //   for (int j = 0; j < rowsNo; j++) {
    //     cipher += table[j][indexMin];
    //   }
    // }
  }

  //again
  String rowTranspositionDecryption(String cipher, String key) {
    cipher = _filterText(cipher);
    key = _filterText(key);
    String plain = "";

    int rowsNo = cipher.length ~/ key.length;
    if (plain.length % key.length != 0) rowsNo++;

    // var table = new List<String>.filled(rowsNo, "", growable: false);
    var table =
    new List.generate(rowsNo, (_) => new List.filled(key.length, "", growable: false));

    int minIndex = 0;
    for (int k = 0; k < cipher.length; k++) {
      for (int i = 0; i < key.length; i++)
        if (key.codeUnitAt(i) < key.codeUnitAt(minIndex)) minIndex = i;

      for (int j = 0; j < rowsNo; j++) {
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

class Method {
  String name;
  // Function encryption;
  // Function decryption;
  String cryptographyType;
  Color color;

  Method(this.name,
      // this.encryption,this.decryption,
      this.cryptographyType, this.color);
}

class ListOfMethods {
  List _methods = List<Method>.empty();

  ListOfMethods();
}
