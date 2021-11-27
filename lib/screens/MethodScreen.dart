import 'package:data_security_algorithms/SubstitutionTechniques.dart';
import 'package:data_security_algorithms/TranspositionTechniques.dart';
import 'package:flutter/material.dart';

class MethodScreen extends StatelessWidget {
  const MethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TranspositionTechniques t = new TranspositionTechniques();
    print("rendered");
    int x = 'a'.codeUnitAt(0);
    String y = String.fromCharCode(x);
    y.toUpperCase();
    return Scaffold(
        body: Center(
      // child: Text(SubstitutionTechniques.VigenereCipher("we are discovered save yourself", "deceptive")),
      // child: Text(SubstitutionTechniques.VigenereAutoKeyCipher("wearediscoveredsaveyourself", "deceptive")),
      // child: Text(SubstitutionTechniques.ceaserToPlain("abcde", 7)),
      // child: Text(SubstitutionTechniques.VigenereAutoKeyPlain("ZICVTWQNGKZEIIGASXSTSLVVWLA", "deceptive")),
      child: Text(t.railFenceCipher("GeeksforGeeks", 3)),
    ));
  }
}
