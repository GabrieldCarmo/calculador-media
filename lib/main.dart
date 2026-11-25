
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home(),
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

  String _infoText = "Informe suas notas";

  void _calcular(){
    if(nota1Controller.text.isEmpty ||
       nota2Controller.text.isEmpty ||
       nota3Controller.text.isEmpty ||
       nota4Controller.text.isEmpty){
      setState(() {
        _infoText = "Preencha todas as notas!";
      });
      return;
    }

    double? nota1 = double.tryParse(nota1Controller.text.replaceAll(',', '.'));
    double? nota2 = double.tryParse(nota2Controller.text.replaceAll(',', '.'));
    double? nota3 = double.tryParse(nota3Controller.text.replaceAll(',', '.'));
    double? nota4 = double.tryParse(nota4Controller.text.replaceAll(',', '.'));

    if(nota1 == null || nota2 == null ||
       nota3 == null || nota4 == null ||
       nota1 < 0 || nota1 > 10 ||
       nota2 < 0 || nota2 > 10 ||
       nota3 < 0 || nota3 > 10 ||
       nota4 < 0 || nota4 > 10){
      setState(() {
        _infoText = "Informe notas válidas entre 0 e 10!";
      });
      return;
    }

    double media = (nota1 + nota2 + nota3 + nota4) / 4;

    setState(() {
      if(media <= 5){
        _infoText = "Média: ${media.toStringAsFixed(1)}\n"
            "Você ficou com R. Precisa estudar muito!";
      }else if(media > 5 && media < 9){
        _infoText = "Média: ${media.toStringAsFixed(1)}\n"
            "Você ficou com B. Precisa estudar um pouco mais!";
      }else if(media >= 9 && media <= 10){
        _infoText = "Média: ${media.toStringAsFixed(1)}\n"
            "Você ficou com MB. Foi aprovado com excelência!";
      }else{
        _infoText = "Média inválida!";
      }
    });
  }

  void _limpar(){
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    nota4Controller.clear();

    setState(() {
      _infoText = "Informe suas notas";
    });
  }

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
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Container(
                height: 48.0,
                child: ElevatedButton(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF145A52),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Calcular Média',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _limpar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE0EAE7),
                  foregroundColor: Color(0xFF145A52),
                ),
                child: Text(
                  'Limpar',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF263B38),
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
