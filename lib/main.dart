import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'home_page.dart';
import 'login_page.dart';
import 'dart:io';
import 'desktop.dart';

// ignore_for_file: prefer_const_constructors
String alertMsg = "ATENÇÃO: Mantenha a calma e siga imediatamente as orientações de evacuação. Dirija-se a saída de emergência mais próxima evitando o uso de elevadores, não retorne ao edifício até receber autorização das autoridades competentes, priorize a sua segurança e a dos demais.";

String getMode(Aviso aviso){
  for(String i in gradients.keys) {
    if (aviso.title.contains(i)) {
      return i;
    }
  }
  return "";
}

Map<String,List<Color>> gradients = {
  "incêndio":[
    Colors.deepOrange,
    Colors.red,
    Colors.redAccent,
  ],
  "luz":[
    Colors.black,
    Color(0xFF222222),
  ],
  "água":[
    Colors.blueAccent,
    Colors.blue,
    Colors.lightBlue,
    Colors.lightBlueAccent,
  ],
};

class Aviso {
  String title;
  String details;
  IconData icon;
  Aviso(this.title,this.details,this.icon);
}

class Alerta extends Aviso {
  String mode;

  Alerta(String title, String details, IconData icon, this.mode) : super(title, details, icon);
}

class Address {
  String nome = "";
  bool inAlarm = false;
  List<Aviso> avisos = [];
}

class Morador{
  String nome;
  String cpf;
  Morador(this.nome,this.cpf);
}

class Contact {
  String nome;
  String num;
  Contact(this.nome,this.num);
}

String generateRandomNumber() {
  var random = Random();
  var number = random.nextInt(900000000) + 100000000; // Gera um número de 9 dígitos aleatório
  return number.toString();
}

String formatPhoneNumber(String phoneNumber) {
  var formattedNumber = phoneNumber.substring(0, 9) + "-" + phoneNumber.substring(9);
  return formattedNumber;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FIAL",
      home: LoginPage(),
    );
  }
}

