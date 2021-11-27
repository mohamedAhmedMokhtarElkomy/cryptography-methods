class SubstitutionTechniques {
  static String _filterText(String text) {
    text = text.toUpperCase();
    text = text.replaceAll(new RegExp(r'[^\w]+'), '');
    print(text);

    return text;
  }

  static List<String> _dividePlainToGroups(String text) {
    List<String> groups = [];
    String group = "";

    for (int i = 0; i < text.length; i++) {
      if (group == text[i]) {
        group += 'x';
        i--;
      } else
        group += text[i];

      if (group.length == 1 && i == text.length - 1)
        group += 'x';
      if (group.length % 2 == 0) {
        groups.add(group);
        group = "";
      }
    }
    print(groups);
    return groups;
  }

  static String ceaserToCipher(String text, int key) {
    text = _filterText(text);
    String cipher = "";

    for (int i = 0; i < text.length; i++) {
      int currentChar = text.codeUnitAt(i);

      if (currentChar >= 65 && currentChar <= 90) {
        currentChar -= 65;
        currentChar += key;
        currentChar = currentChar % 26;
        currentChar += 65;

        cipher += String.fromCharCode(currentChar);
      }
    }
    return cipher;
  }

  static String ceaserToPlain(String text, int key) {
    text = _filterText(text);
    String plain = "";

    for (int i = 0; i < text.length; i++) {
      int currentChar = text.codeUnitAt(i);

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

  static String VigenereCipher(String text, String key) {
    print(text);
    print(key);
    text = _filterText(text);
    key = _filterText(key);
    String cipher = "";
    // int currentChar = 0;
    for (int i = 0; i < text.length; i++) {
      // currentChar = (((key.codeUnitAt(i % key.length) + text.codeUnitAt(i)) - 65) % 26) + 65;
      cipher += String.fromCharCode(
          (((key.codeUnitAt(i % key.length) + (text.codeUnitAt(i) - 65)) - 65) %
              26) +
              65);
    }

    print(text);
    print(key);
    print(cipher);
    return cipher;
  }

  static String VigenerePlain(String cipher, String key) {
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
    print(key);
    return plain;
  }

  static String VigenereAutoKeyCipher(String text, String key) {
    print(text);

    text = _filterText(text);
    key = _filterText(key);
    key += text.substring(0, text.length - key.length);
    print(key);
    String cipher = "";
    // int currentChar = 0;
    for (int i = 0; i < text.length; i++) {
      // currentChar = (((key.codeUnitAt(i % key.length) + text.codeUnitAt(i)) - 65) % 26) + 65;
      cipher += String.fromCharCode(
          (((key.codeUnitAt(i) + (text.codeUnitAt(i) - 65)) - 65) %
              26) +
              65);
    }

    print(cipher);
    return cipher;
  }

  static String VigenereAutoKeyPlain(String cipher, String key) {
    cipher = _filterText(cipher);
    key = _filterText(key);
    key += cipher.substring(0, cipher.length - key.length);

    String plain = "";
    int currentChar = 0;
    for (int i = 0; i < cipher.length; i++) {
      currentChar = cipher.codeUnitAt(i);
      currentChar -= 65;
      currentChar -= (key.codeUnitAt(i) - 65);
      currentChar = currentChar % 26;
      currentChar += 65;
      plain += String.fromCharCode(currentChar);
    }

    print(plain);
    print(key);
    return plain;
  }

  static String RowTranspositionCipher(String plain, String key){

    int steps = key.length;

    int currentIndex = 0;

    String cipher = "";

    for(int i = 0; i < key.length; i++){
      
    }

    return "X";
  }

  static String playFairToCipher(String text, String key) {
    text = _filterText(text);
    key = _filterText(key);
    String cipher = "";

    key = key.replaceAll(RegExp('J'), 'I');

    var table =
    new List.generate(5, (_) => new List.filled(5, "", growable: false));

    for (int i = 0; i < key.length; i < i++) {
      if (!cipher.contains(key[i])) cipher += key[i];
    }
    for (int i = 65; i <= 90; i++) {
      if (i == 74) continue;
      if (!cipher.contains(String.fromCharCode(i)))
        cipher += String.fromCharCode(i);
    }

    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        String x = cipher[((i * 5) + j)];
        table[i][j] = x;
      }
    }

    cipher = "";


    return cipher;
  }
}
