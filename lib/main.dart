import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore_for_file: prefer_const_constructors
class Address {
  String nome = "";
  int andar = 0;
  int apto = 0;
  bool inAlarm = false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Address> exemplos = [
    Address()
    ..andar = 12
    ..apto = 1205
    ..nome = "Residencial Boa Vista"
    ..inAlarm = true,

    Address()
    ..andar = 8
    ..apto = 807
    ..nome = "Residencial Via Boulevard"
    ..inAlarm = false,

    Address()
    ..andar = 10
    ..apto = 1002
    ..nome = "Residencial Jardim do Lago"
    ..inAlarm = false,
  ];

  Widget alarmWidget(Address address){
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              child: LayoutBuilder(
                builder: (context, constraints){
                  return Center(
                    child: Icon(
                      address.inAlarm? Icons.warning_rounded:Icons.warning_amber_rounded,
                      size: constraints.maxWidth*0.85,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: SizedBox(
              height: 125,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.inAlarm? "Alerta de incêndio!" : "Sem alertas ativos",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    // Text(
                    //   "Detalhes do acontecimento",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     color: Colors.white,
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: !exemplos[index].inAlarm? [
                Colors.blue,
                Colors.lightBlue,
                Colors.lightBlueAccent,
              ] : [
                Colors.deepOrange,
                Colors.red,
                Colors.redAccent,
              ]
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 1,
                top: 3,
                child: PopupMenuButton(
                  tooltip: "",
                  itemBuilder: (context) => [
                    for(Address item in exemplos)
                      PopupMenuItem(
                        value: item,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.nome),
                            if(item.inAlarm)
                              Icon(index == exemplos.indexOf(item)? Icons.warning_rounded:Icons.warning_amber_rounded),
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            index = exemplos.indexOf(item);
                          });
                        },
                      ),
                  ],
                  child: Icon(
                    MdiIcons.officeBuilding,
                    color: Colors.white,
                    size: 32,
                  ),
                )
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        exemplos[index].nome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    alarmWidget(exemplos[index])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
