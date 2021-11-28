import 'package:data_security_algorithms/CryptographicTechniques.dart';
import 'package:data_security_algorithms/screens/MethodScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Data security',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Cryptography"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  CryptoGraphicTechniques techniques = new CryptoGraphicTechniques();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          print(techniques.methods[index]);
          return Container(
            decoration: BoxDecoration(
              color: techniques.methods[index].color,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                // leading: Icon(Icons.unsubscribe_outlined),
                title: Text(techniques.methods[index].name),
                subtitle: Padding(padding: EdgeInsets.only(left: 16),child: Text(techniques.methods[index].cryptographyType,)),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MethodScreen(techniques.methods[index].name)));
                },
              ),
            ),
          );
        },
        itemCount: techniques.methods.length,
      ),
    );
  }
}

class MethodCard extends StatelessWidget {
  Color color;
  String name;
  String type;

  MethodCard(this.color, this.name, this.type);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
