import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'home_page.dart';
import 'desktop.dart';
import 'dart:io';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 7,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                          "FIAL",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 64,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    blurRadius: 1
                                )
                              ]
                          )
                      ),
                      for(int i = 0; i < 2; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                          child: Container(
                            width: double.infinity,
                            height: 66,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon([Icons.person_rounded,MdiIcons.lockOutline][i],color: Colors.black,size: 36),
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

              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => kIsWeb? const DesktopPage() : Platform.isAndroid? const HomePage(): const DesktopPage()));
                      },
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              )
                            ]
                        ),
                        child: const Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24))),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}