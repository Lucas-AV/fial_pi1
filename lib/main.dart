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
  String template = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lectus id magna consequat, eget gradiv urna commodo. Integer sed volutpat neque, at pulvinar turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae. Aliquam erat volutpat.";

  List<Aviso> listaAvisos = [
    Aviso(
      'Cadastro de morador',
      'O morador, Fulano Sobrenome, de CPF, 123.456.789-10, foi cadastrado no sistema FIAL do condomínio.',
      Icons.person_add,
    ),
    Aviso(
      "Manutenção nos elevadores",
      "Manutenção nos elevadores programada para as 19h do dia 27/06 até as 22h.",
      Icons.settings,
    ),
    Aviso(
      'Alerta de incêndio',
      alertMsg,
      Icons.warning_rounded,
    ),
    Aviso(
      'Falta de luz',
      'Informamos que ocorreu uma queda de energia no condomínio. A equipe técnica já está trabalhando para resolver o problema. Pedimos desculpas pelo inconveniente e agradecemos pela compreensão.',
      Icons.dark_mode_outlined,
    ),
    Aviso(
      'Falta de água',
      'Prezados moradores, identificamos problemas com o encanamento e o abastecimento de água no prédio. Nossa equipe de manutenção está trabalhando para resolver a situação o mais rápido possível. Pedimos desculpas pelos transtornos causados e agradecemos pela compreensão.',
      Icons.water_drop_outlined,
    ),
    Aviso(
      'Cadastro de morador',
      'O morador, Fulano Sobrenome, de CPF, 123.456.789-10, foi cadastrado no sistema FIAL do condomínio.',
      Icons.person_add,
    ),
    Aviso(
      'Cadastro de morador',
      'O morador, Fulano Sobrenome, de CPF, 123.456.789-10, foi cadastrado no sistema FIAL do condomínio.',
      Icons.person_add,
    ),
    Aviso(
      'Piscina interditada',
      'A piscina principal do condomínio está interditada por tempo indeterminado.',
      Icons.pool,
    ),
    Aviso(
      'Mudança de clima',
      'Atenção moradores: Prevê-se mudanças abruptas no clima nos próximos dias. Por favor, estejam preparados para variações de temperatura, chuvas intensas ou ventos fortes. Tomem as devidas precauções e estejam atentos às orientações adicionais da administração do prédio',
      Icons.thunderstorm_rounded
    ),
    Aviso(
      'Cadastro de morador',
      'O morador, Fulano Sobrenome, de CPF, 123.456.789-10, foi cadastrado no sistema FIAL do condomínio.',
      Icons.person_add,
    ),
    Aviso(
      'Cadastro de morador',
      'O morador, Fulano Sobrenome, de CPF, 123.456.789-10, foi cadastrado no sistema FIAL do condomínio.',
      Icons.person_add,
    ),
    Aviso(
      'Cadastro de morador',
      'O morador, Fulano Sobrenome, de CPF, 123.456.789-10, foi cadastrado no sistema FIAL do condomínio.',
      Icons.person_add,
    ),
  ];
  
  Widget avisoCard(Aviso aviso){
    Color fontColor = getMode(aviso).isNotEmpty? Colors.white:Colors.black;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: RawMaterialButton(
        onPressed: (){},
        child: Container(
          decoration: BoxDecoration(
            color: getMode(aviso).isNotEmpty? Colors.red : Colors.white,
            gradient: LinearGradient(
              colors: getMode(aviso).isNotEmpty? gradients[getMode(aviso)] ?? [Colors.white, Colors.white] : [Colors.white,Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0,3)
              )
            ]
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Icon(aviso.icon,size: 64,color: fontColor,),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(aviso.title,style: TextStyle(color: fontColor,fontWeight: FontWeight.bold,fontSize: 22)),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(aviso.details,textAlign: TextAlign.justify,style: TextStyle(color: fontColor),maxLines: 3,overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sensorCard({String title = "Sensores de fumaça", IconData icon = Icons.sensors}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: RawMaterialButton(
        onPressed: (){},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0,3)
                )
              ]
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Icon(icon,size: 64,),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19)),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(template,textAlign: TextAlign.justify,style: TextStyle(color: Colors.black),maxLines: 3,overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget relatoriosCard({String title = "Relatório diário", String date = "26/05/23"}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: RawMaterialButton(
        onPressed: (){},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0,3)
              )
            ]
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Icon(MdiIcons.fileDocumentMultiple,size: 64,),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$title ($date)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19)),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(template,textAlign: TextAlign.justify,style: TextStyle(color: Colors.black),maxLines: 3,overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sector({
    String title = "Template",
    double underlineWidth = 300,
    Widget bottomButton = const SizedBox(),
    List<Widget> children = const [],
  }){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 36,right: 36,top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 64,
                        shadows: const [Shadow(color: Colors.black12,blurRadius: 1)]
                      )
                    ),
                  ),
                  Container(color: Colors.white,width: underlineWidth,height: 8,),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 3,
                crossAxisCount: 2,
                children: children,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: bottomButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Row(
          children: [
            sector(
              title: "Notificações",
              underlineWidth: 300,
              bottomButton: Row(
                children: [
                  RawMaterialButton(
                    onPressed: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                      child: Center(child: Text("Cadastrar\naviso",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                    ),
                  ),
                  SizedBox(width: 15),
                  RawMaterialButton(
                    onPressed: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                      child: Center(child: Text("Cadastrar\nmorador",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                    ),
                  ),
                ],
              ),
              children: [
                for(Aviso aviso in listaAvisos)
                  avisoCard(aviso)
              ]
            ),
            Expanded(
              child: Column(
                children: [
                  sector(
                    title: "Status dos sensores",
                    underlineWidth: 500,
                    children: [
                      sensorCard(title: "Sensores de fumaça",icon: Icons.sensors),
                      sensorCard(title: "Sensores de temperatura",icon: Icons.thermostat_outlined),
                      sensorCard(title: "Luzes de emergência",icon: MdiIcons.lightbulbOnOutline),
                      sensorCard(title: "Fechaduras magnéticas",icon: Icons.lock_outline),
                    ],
                    bottomButton: Row(
                      children: [
                        RawMaterialButton(
                          onPressed: (){},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                            child: Center(child: Text("Realizar\ncheckup",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sector(title: "Relatórios",underlineWidth: 250,
                    children: [
                      relatoriosCard(title:"Relatório diário",date: "19/06/2023"),
                      relatoriosCard(title:"Relatório semanal",date: "18/06/2023"),
                      relatoriosCard(title:"Relatório semanal",date: "11/06/2023"),
                      relatoriosCard(title:"Relatório semanal",date: "04/06/2023"),
                      relatoriosCard(title:"Relatório semanal",date: "28/05/2023"),
                    ],
                    bottomButton: Row(
                      children: [
                        RawMaterialButton(
                          onPressed: (){},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                            child: Center(child: Text("Gerar\nrelatório",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
