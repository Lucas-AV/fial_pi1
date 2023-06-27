import 'main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;
  List<Contact> contatos = [
    Contact("Contato dos Bombeiros", "+55 61 ${generateRandomNumber()}"),
    Contact("Contato da Ambulância", "+55 61 ${generateRandomNumber()}"),
    Contact("Contato da Portaria", "+55 61 ${generateRandomNumber()}"),
    Contact("Contato do Síndico", "+55 61 ${generateRandomNumber()}"),
    Contact("Contato da Polícia", "+55 61 ${generateRandomNumber()}"),

    // Contact("Contato da Administração", "+55 61 ${generateRandomNumber()}"),
    // Contact("Central de Atendimento", "+55 61 ${generateRandomNumber()}"),
    // Contact("Contato da Manutenção", "+55 61 ${generateRandomNumber()}"),
    // Contact("Central de Segurança", "+55 61 ${generateRandomNumber()}"),
    // Contact("Contato do Zelador", "+55 61 ${generateRandomNumber()}"),
  ];
  List<Address> exemplos = [
    Address()
      ..nome = "Residencial Boa Vista"
      ..avisos = [
        Aviso(
          'Alerta de incêndio',
          alertMsg,
          Icons.warning_rounded,
        ),
        Aviso("Manutenção", "Manutenção nos elevadores programada para as 19h do dia 27/06 até as 22h.", Icons.settings)
      ],

    Address()
      ..nome = "Residencial Via Boulevard"
      ..inAlarm = false,

    Address()
      ..nome = "Residencial Jardim do Lago"
      ..inAlarm = false,
  ];

  Widget alarmWidget(Address address){
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(address.inAlarm)
            Icon(
              address.inAlarm? Icons.warning_rounded:Icons.warning_amber_rounded,
              color: Colors.white,
              size: 75,
            ),

          Padding(
            padding: address.inAlarm? const EdgeInsets.only(bottom: 8.0) : const EdgeInsets.only(top: 12),
            child: Text(
              address.inAlarm? "Alerta de incêndio!" : "Sem alertas ativos",
              style: TextStyle(
                fontWeight: address.inAlarm? FontWeight.w700:FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          if(address.inAlarm)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(alertMsg,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.justify),
            ),
        ],
      ),
    );
  }
  Widget iconDivisor({String divisor = "Contatos", double height = 3,Color color = Colors.white}){
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: height,
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(divisor,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24)),
            // child: Icon(icon,color: Colors.white,size: 28),
          ),
          Expanded(
            child: Container(
              height: height,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
  Widget contactWidget(Contact contact,{Color fontColor = Colors.black}){
    String nome = contact.nome;
    String tel = contact.num;
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Icon(Icons.person,color: fontColor,size: 48),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nome,
                style: TextStyle(color: fontColor,fontWeight: FontWeight.bold,fontSize: 22)
            ),
            Text(tel,style: TextStyle(color: fontColor,fontSize: 16)),
          ],
        )
      ],
    );
  }
  Widget cardWidget(Aviso aviso){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 20,
        ),
        Icon(aviso.icon,color: Colors.white,size: 48),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(aviso.title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                Text(aviso.details,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.justify),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget contactCard(Contact contact,{Color fontColor = Colors.black}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: contactWidget(contact,fontColor: fontColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String tripleVerify(){
      String mode = "";
      for(Aviso aviso in exemplos[index].avisos){
        if(getMode(aviso).isNotEmpty){
          mode = getMode(aviso);
          break;
        }
      }
      return mode;
    }

    exemplos[index].inAlarm = exemplos[index].avisos.any((aviso) => getMode(aviso).isNotEmpty);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: !exemplos[index].inAlarm? Colors.blue:gradients[tripleVerify()]!.first,//Colors.deepOrange,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: LayoutBuilder(
            builder: (context, constraints){
              return FittedBox(
                child: Text(
                  exemplos[index].nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          elevation: 5,
          actions: [
            PopupMenuButton(
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
                          Icon(index == exemplos.indexOf(item)? Icons.warning_rounded:Icons.warning_amber_rounded,color: Colors.black,),
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        index = exemplos.indexOf(item);
                      });
                    },
                  ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  MdiIcons.officeBuilding,
                  color: Colors.white,
                  size: 32,
                ),
              ),

            ),
          ],
        ),
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
              ] : gradients[tripleVerify()]?? [
                Colors.deepOrange,
                Colors.red,
                Colors.redAccent,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: alarmWidget(exemplos[index]),
                ),

                if(exemplos[index].avisos.isNotEmpty)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: iconDivisor(divisor: "Avisos",height: 2.5),
                      ),
                      for(Aviso aviso in exemplos[index].avisos)
                        if(aviso.title != 'Alerta de incêndio')
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: cardWidget(aviso),
                        ),
                    ],
                  ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: iconDivisor(height: 2.5),
                    ),
                    for(Contact contact in contatos)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: contactWidget(contact,fontColor: Colors.white),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
