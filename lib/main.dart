import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  TextEditingController nota4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Média'),
        centerTitle: true,
        backgroundColor: Color(0xFF145A52),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFF4F7F6),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Primeira nota",
                labelStyle: TextStyle(color: Color(0xFF145A52)),
                filled: true,
                fillColor: Colors.white,
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF263B38), fontSize: 20.0),
              controller: nota1Controller,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Segunda nota",
                labelStyle: TextStyle(color: Color(0xFF145A52)),
                filled: true,
                fillColor: Colors.white,
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF263B38), fontSize: 20.0),
              controller: nota2Controller,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Terceira nota",
                labelStyle: TextStyle(color: Color(0xFF145A52)),
                filled: true,
                fillColor: Colors.white,
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF263B38), fontSize: 20.0),
              controller: nota3Controller,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Quarta nota",
                labelStyle: TextStyle(color: Color(0xFF145A52)),
                filled: true,
                fillColor: Colors.white,
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF263B38), fontSize: 20.0),
              controller: nota4Controller,
            ),
          ],
        ),
      ),
    );
  }
}