import 'package:flutter_application_1/Homepage/fisrtpage.dart';
import 'package:flutter_application_1/login_page/header_widget.dart';
import 'package:flutter_application_1/login_page/theme_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String useremail, userpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 192, 203),
      body: Center(
        child: Container(
          child: StreamBuilder<User>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FirstPage();
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SafeArea(
                          child: Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              margin: EdgeInsets.fromLTRB(20, 10, 20,
                                  10), // This will be the login form
                              child: Column(
                                children: [
                                  Text(
                                    'Babe Safe House Bar',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          Container(
                                            child: TextFormField(
                                              onSaved: (email) {
                                                useremail = email;
                                              },
                                              decoration: ThemeHelper()
                                                  .textInputDecoration('E-Mail',
                                                      'E-Mail  Not Null !!'),
                                            ),
                                            decoration: ThemeHelper()
                                                .inputBoxDecorationShaddow(),
                                          ),
                                          SizedBox(height: 15.0),
                                          Container(
                                            child: TextFormField(
                                              onSaved: (password) {
                                                userpassword = password;
                                              },
                                              obscureText: true,
                                              decoration: ThemeHelper()
                                                  .textInputDecoration(
                                                      'Password',
                                                      'Password Not Null !!'),
                                            ),
                                            decoration: ThemeHelper()
                                                .inputBoxDecorationShaddow(),
                                          ),
                                          SizedBox(height: 15.0),
                                          Container(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color.fromARGB(255, 248,
                                                            149, 165)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    40, 10, 40, 10),
                                                child: Text(
                                                  'Login'.toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0)),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  _formKey.currentState.save();
                                                  print('email : ${useremail}');
                                                  print(
                                                      'password : ${userpassword}');
                                                  singIn(
                                                      useremail, userpassword);
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20),
                                            //child: Text('Don\'t have an account? Create'),
                                            child:
                                                Text.rich(TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "You don't have user register Here >>"),
                                              TextSpan(
                                                text: ' Register',
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        RegistrationPage()));
                                                      },
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .accentColor),
                                              ),
                                            ])),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }

  Future singIn(useremail, userpassword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: useremail, password: userpassword);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.toString() ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        Fluttertoast.showToast(
            msg: 'ไม่มีผู้นี้ใช้ในระบบ',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 255, 192, 203),
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.toString() ==
          '[firebase_auth/unknown] Given String is empty or null') {
        Fluttertoast.showToast(
            msg: 'ไม่มีข้อมูลให้รับ',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 255, 192, 203),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 255, 192, 203),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
