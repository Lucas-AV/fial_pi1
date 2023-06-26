import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'home_page.dart';
import 'login_page.dart';
import 'dart:io';
import 'desktop.dart';


// ignore_for_file: prefer_const_constructors
class Address {
  String nome = "";
  bool inAlarm = false;
  List<String> avisos = [];
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
      home: Platform.isAndroid? LoginPage():DesktopPage(),// LoginPage(),
    );
  }
}


class DesktopPage extends StatefulWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: const [
                    Text("Notificações",style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: double.infinity,
                width: 0.25,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: const [
                    Text("Relatórios",style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
