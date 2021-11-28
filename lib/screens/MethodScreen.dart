import 'package:data_security_algorithms/CryptographicTechniques.dart';
import 'package:data_security_algorithms/SubstitutionTechniques.dart';
import 'package:data_security_algorithms/TranspositionTechniques.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MethodScreen extends StatefulWidget {
  final _name;

  MethodScreen(this._name);

  @override
  _MethodScreenState createState() => _MethodScreenState();
}

class _MethodScreenState extends State<MethodScreen> {
  final _inputController = TextEditingController();
  final _keyController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  var _encryptionState = true;
  CryptoGraphicTechniques _techniques = new CryptoGraphicTechniques();
  String result = "";

  @override
  Widget build(BuildContext context) {
    print("rendered");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget._name),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _inputController,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      labelText: _encryptionState
                          ? "Enter plain text"
                          : "Enter cipher text"),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _keyController,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      labelText: "Enter key"),
                  keyboardType: TextInputType.phone,
                ),
              ),

              ListTile(
                title: const Text('Encryption'),
                leading: Radio(
                  value: "Encryption",
                  groupValue: _encryptionState ? "Encryption" : "Decryption",
                  onChanged: (value) {
                    setState(() {
                      _encryptionState = true;
                      print(_encryptionState);
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Decryption'),
                leading: Radio(
                  value: "Decryption",
                  groupValue: _encryptionState ? "Encryption" : "Decryption",
                  onChanged: (value) {
                    setState(() {
                      _encryptionState = false;
                      print(_encryptionState);
                    });
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (widget._name == "Ceaser")
                        _encryptionState
                            ? result = _techniques.ceaserEncryption(_inputController.text,
                            int.parse(_keyController.text))
                            : result = _techniques.ceaserDecryption(_inputController.text,
                            int.parse(_keyController.text));
                      else if (widget._name == "Vigener")
                        _encryptionState
                            ? result = _techniques.vigenereEncryption(
                            _inputController.text, _keyController.text)
                            : result = _techniques.vigenereDecryption(
                            _inputController.text, _keyController.text);
                      else if (widget._name == "Rail Fence")
                        _encryptionState
                            ? result = _techniques.railFenceEncryption(
                            _inputController.text, int.parse(_keyController.text))
                            : result = "Not available";
                      else if (widget._name == "Row Transposition")
                        _encryptionState
                            ?result = _techniques.rowTranspositionEncryption(
                            _inputController.text, _keyController.text)
                            : result = _techniques.rowTranspositionDecryption(
                            _inputController.text, _keyController.text);
                    });
                  },
                  child: Text(_encryptionState ? "Encrypt" : "Decrypt")),
              Padding(padding: EdgeInsets.all(10),child: Text(_encryptionState ? "Cipher text: " + result : "Plain Text: " + result),)
              // Padding(padding: EdgeInsets.all(12), child: Text(_encryptionState ""),)
            ],
          ),
        ));
  }
}

// child: Text(SubstitutionTechniques.VigenereCipher("we are discovered save yourself", "deceptive")),
// child: Text(SubstitutionTechniques.VigenereAutoKeyCipher("wearediscoveredsaveyourself", "deceptive")),
// child: Text(SubstitutionTechniques.ceaserToPlain("abcde", 7)),
// child: Text(SubstitutionTechniques.VigenereAutoKeyPlain("ZICVTWQNGKZEIIGASXSTSLVVWLA", "deceptive")),
// child: Text(t.railFenceCipher("GeeksforGeeks", 3)),
// child: Text(t.rowTranspositionEncryption("Traffic Analysis is the most harmful attack", "security")),
// child: Text(t.rowTranspositionEncryption("TRAFFICANALYSISISTHEMOSTHARMFULATTACK", "security")),
// child: Text(t.rowTranspositionDecryption("ALHRARATATIIOUxFSMFKTNSHTCSSLxFYEMCAITAx", "security")),
