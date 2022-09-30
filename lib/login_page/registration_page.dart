import 'package:flutter_application_1/login_page/header_widget.dart';
import 'package:flutter_application_1/login_page/login_page.dart';
import 'package:flutter_application_1/login_page/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  String firstname, lastname, useremail, phone, userpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 192, 203),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  margin: EdgeInsets.fromLTRB(20, 10, 20,
                                      10), // This will be the login form
                                  child: Column(children: [
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  'Name', 'Name Not Null !!'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  'Lastname', 'Lastname Not Null !!'),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              onSaved: (onemail) {
                                setState(() {
                                  useremail = onemail;
                                });
                              },
                              decoration: ThemeHelper().textInputDecoration(
                                  "E-Mail", "E-Mail  Not Null !!"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (!(val.isEmpty) &&
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(val)) {
                                  return "Enter a valid email address";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              decoration: ThemeHelper().textInputDecoration(
                                  "Tel.", "Tel is Not Null !!"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (!(val.isEmpty) &&
                                    !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return "Enter a valid phone number";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              onSaved: (userpasword) {
                                setState(() {
                                  userpassword = userpasword;
                                });
                              },
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Password*", "Password Not Null !!"),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 15.0),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                          value: checkboxValue,
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValue = value;
                                              state.didChange(value);
                                            });
                                          }),
                                      Text(
                                        "I accept all terms and conditions.",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            validator: (value) {
                              if (!checkboxValue) {
                                return 'You need to accept terms and conditions';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 248, 149, 165)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  singUp(useremail, userpassword).then((value) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));
                                  });
                                }
                              },
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future singUp(useremail, userpassword) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: useremail, password: userpassword)
        .then((value) {
      FirebaseAuth.instance.signOut();
    });
  }
}
