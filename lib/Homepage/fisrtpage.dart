import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ChooseFood/MainChoosefood.dart';
import 'package:flutter_application_1/Foodmenu.dart/Menu.dart';
import 'package:flutter_application_1/calculators/Homescreencal.dart';
import 'package:flutter_application_1/catorylist.dart';
import 'package:flutter_application_1/countnum.dart';
import 'package:flutter_application_1/login_page/login_page.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 192, 203),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Babe Safe House Bar',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.white, letterSpacing: .5, fontSize: 20),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.keyboard_return,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                });
              },
            )
          ],
          backgroundColor: Color.fromARGB(255, 255, 192, 203),
        ),
        body: Container(
          child: ListView(
              primary: false,
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.all(1.0),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CountNum(
                                        title: '',
                                      )),
                            );
                          },
                          child: Image.asset(
                            'assets/image/math.jpg',
                            height: 125,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.8),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Number Program',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseFood()),
                            );
                          },
                          child: Image.asset(
                            'assets/image/foodmenu.jpg',
                            height: 125,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.8),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'choose a menu',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        )),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Image.asset(
                            'assets/image/cal.jpg',
                            height: 125,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.8),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Calculator',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        )),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Menu()),
                            );
                          },
                          child: Image.asset(
                            'assets/image/menu.jpg',
                            height: 125,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.8),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'FoodMenu',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        )),
                  ],
                ),
              ]),
        ));
  }
}
