import 'dart:async';
import 'package:jooble_1_1/signup.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:jooble_1_1/offers.dart';
import 'package:jooble_1_1/search.dart';
import 'package:jooble_1_1/add_offers.dart';

import 'applications.dart';

void main() async {
  final keyApplicationId = 'vr8QWFMmv0xXH4REJ4hXuhjwDm4hHPRBwpNqLpMa';
  final keyClientKey = 'liIEHZjuY7IvJGKwY6p1MKY7U2TJ7ah2aq53JzyS';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true, debug: true);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'Signup',
    routes: {
      'Offers': (context) => OffersScreen(),
      'AddOffers': (context) => AddOffer(),
      'Search': (context) => Search(),
      'Login': (context) => LoginForm(),
      'Signup': (context) => UserType(),
      //'Applications' : (context) => Applications(),
    },
  ));
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  int radioValue = 0, _newRadioValue = 0, _genderValue = 0;
  final TextEditingController _username = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _phoneNumber = new TextEditingController();

  void handleRadioButtonChangedJob(int value) {
    setState(() {
      radioValue = value;
      debugPrint("Changed");
      _newRadioValue = value;
    });
  }

  void handleRadioButtonChangedGender(int value) {
    setState(() {
      _genderValue = value;
      debugPrint("Changed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(
          color: Colors.blue.shade500,
        ),
        shadowColor: Colors.blue.shade900,
        foregroundColor: Colors.blue.shade500,
        title: new Text(
          "Login/Sign Up",
          style: new TextStyle(
            color: Colors.blue.shade500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: new Container(
        color: Colors.grey.shade200,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Image.asset(
              "images/100.png",
              alignment: Alignment.topCenter,
              width: 160,
              height: 150,
              color: Colors.blue.shade700,
            ),
            new Container(
                padding: const EdgeInsets.all(2.0),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _username,
                      decoration: new InputDecoration(
                        //filled: true,
                        border: new OutlineInputBorder(
                            gapPadding: 6.0,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                        labelText: "username",
                        labelStyle: new TextStyle(fontSize: 18.0),
                        hintText: "Enter Your Full Name",
                        icon: new Icon(
                          Icons.person_outline_rounded,
                          size: 25.0,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    new Padding(padding: const EdgeInsets.all(3.0)),
                    new TextField(
                      controller: _password,
                      decoration: new InputDecoration(
                        //filled: true,
                        border: new OutlineInputBorder(
                            gapPadding: 6.0,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                        labelText: "password",
                        labelStyle: new TextStyle(fontSize: 18.0),
                        hintText: "Enter a Password",
                        icon: new Icon(
                          Icons.lock_outline,
                          size: 25.0,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    new Padding(padding: const EdgeInsets.all(3.0)),
                    new TextField(
                      controller: _email,
                      decoration: new InputDecoration(
                        //filled: true,
                        border: new OutlineInputBorder(
                            gapPadding: 6.0,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                        labelText: "email",
                        labelStyle: new TextStyle(fontSize: 18.0),
                        hintText: "Enter Your Email",
                        icon: new Icon(
                          Icons.mail_outline_rounded,
                          size: 25.0,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    new Padding(padding: const EdgeInsets.all(3.0)),
                    new TextField(
                      controller: _phoneNumber,
                      decoration: new InputDecoration(
                        //filled: true,
                        border: new OutlineInputBorder(
                            gapPadding: 6.0,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                        labelText: "phone",
                        labelStyle: new TextStyle(fontSize: 18.0),
                        hintText: "Enter Your Phone Number",
                        icon: new Icon(
                          Icons.phone_android_sharp,
                          size: 25.0,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                )),
            new Padding(padding: const EdgeInsets.all(6.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Gender: ",
                  style: new TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w800,
                    fontSize: 19.0,
                  ),
                ),
                new Radio<int>(
                  value: 3,
                  groupValue: _genderValue,
                  onChanged: (value) {
                    handleRadioButtonChangedGender(3);
                  },
                ),
                new Text(
                  "Male",
                  style: new TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w800,
                    fontSize: 17.5,
                  ),
                ),
                new Radio<int>(
                  value: 4,
                  groupValue: _genderValue,
                  onChanged: (value) {
                    handleRadioButtonChangedGender(4);
                  },
                ),
                new Text(
                  "Female",
                  style: new TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontWeight: FontWeight.w800,
                      fontSize: 17.8),
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.all(1.0)),
            new Container(
              color: Colors.grey.shade300,
              child: new Padding(padding: const EdgeInsets.all(0.8)),
            ),
            new Padding(padding: const EdgeInsets.all(2.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (value) {
                    handleRadioButtonChangedJob(1);
                  },
                ),
                new Text(
                  "Employer",
                  style: new TextStyle(
                    color: Colors.blueGrey.shade600,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.5,
                  ),
                ),
                new Radio<int>(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (value) {
                    handleRadioButtonChangedJob(2);
                  },
                ),
                new Text(
                  "Job Searcher",
                  style: new TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.3),
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.all(7.0)),
            new OutlinedButton(
              // Within the `FirstRoute` widget
              onPressed: () {
                proceedPressed(_newRadioValue);
              },
              child: new Text(
                "Proceed",
                style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.blue.shade600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue.shade400,
                  // minimumSize: new Size(50, 50),
                  fixedSize: new Size(10, 45),
                  backgroundColor: Colors.grey.shade200,
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  padding: EdgeInsets.all(10.0)),
            ),
          ],
        ),
      ),
    );
  }

  void proceedPressed(int screen) {
    switch (screen) {
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EmployerLogin()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearcherLogin()));
    }
  }
}

class EmployerLogin extends StatefulWidget {
  @override
  _EmployerLoginState createState() => _EmployerLoginState();
}

class _EmployerLoginState extends State<EmployerLogin> {
  final TextEditingController _storeName = new TextEditingController();
  final TextEditingController _companySpeciality = new TextEditingController();
  final TextEditingController _location = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: new IconThemeData(
            color: Colors.blue.shade500,
          ),
          shadowColor: Colors.blue.shade500,
          title: new Text(
            "Employer Sign Up",
            style: new TextStyle(
              color: Colors.blue.shade500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
        ),
        body: new Container(
          color: Colors.grey.shade200,
          child: new ListView(padding: const EdgeInsets.all(2.0), children: <
              Widget>[
            new Image.asset(
              "images/538.png",
              alignment: Alignment.topCenter,
              width: 160,
              height: 145,
              color: Colors.blue.shade700,
            ),
            new Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(2.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _storeName,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      labelText: "Company/Store Name",
                      labelStyle: new TextStyle(fontSize: 18.0),
                      hintText: "Enter The Name of Your Company",
                      icon: new Icon(Icons.store_rounded, size: 25.0),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  new Padding(padding: const EdgeInsets.all(3.0)),
                  new TextField(
                    controller: _companySpeciality,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      labelText: "Company Type",
                      labelStyle: new TextStyle(fontSize: 18.0),
                      hintText: "Enter a Type of Your Company",
                      icon:
                          new Icon(Icons.business_center_outlined, size: 25.0),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  new Padding(padding: const EdgeInsets.all(3.0)),
                  new TextField(
                    controller: _location,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      counterText: "e.g. Hamah/Salamiyah.",
                      labelText: "Location",
                      labelStyle: new TextStyle(fontSize: 18.0),
                      hintText: " Governorate/City",
                      icon: new Icon(
                        Icons.location_on_outlined,
                        size: 25.0,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(8.0)),
            new OutlinedButton(
              // Within the `FirstRoute` widget
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersScreen()));
                //ProceedPressed(_newRadioValue);
              },
              child: new Text(
                "Sign Up",
                style: new TextStyle(
                  fontSize: 19.0,
                  color: Colors.blue.shade400,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue.shade400,
                  // minimumSize: new Size(50, 50),
                  fixedSize: new Size(10, 50),
                  backgroundColor: Colors.grey.shade200,
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  padding: EdgeInsets.all(10.0)),
            ),
          ]),
        ));
  }
}

class SearcherLogin extends StatefulWidget {
  const SearcherLogin({Key? key}) : super(key: key);

  @override
  _SearcherLoginState createState() => _SearcherLoginState();
}

class _SearcherLoginState extends State<SearcherLogin> {
  final TextEditingController _specialSkills = new TextEditingController();
  final TextEditingController _legalRecord = new TextEditingController();

  int radioValue = 0, radioValue2 = 1, _newRadioValue = 0;

  void handleRadioButtonChangedCar(int value) {
    setState(() {
      radioValue = value;
      debugPrint("Changed Car");
      _newRadioValue = value;
    });
  }

  void handleRadioButtonChanged(int value) {
    setState(() {
      radioValue2 = value;
      debugPrint("Changed Education");
      _newRadioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: new IconThemeData(
            color: Colors.blue.shade500,
          ),
          shadowColor: Colors.blue.shade900,
          foregroundColor: Colors.blue.shade500,
          title: new Text(
            "Searcher Sign Up",
            style: new TextStyle(
              color: Colors.blue.shade500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade100,
        ),
        body: new Container(
          color: Colors.grey.shade200,
          child: new ListView(padding: const EdgeInsets.all(5.0), children: <
              Widget>[
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Image.asset(
              "images/884.png",
              alignment: Alignment.topCenter,
              width: 160,
              height: 128,
              color: Colors.blue.shade700,
            ),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Education:      ",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.blueGrey.shade700,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                new Radio<int>(
                  value: 4,
                  groupValue: radioValue2,
                  onChanged: (value) {
                    handleRadioButtonChanged(4);
                  },
                ),
                new Text(
                  "Middle School  ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  value: 5,
                  groupValue: radioValue2,
                  onChanged: (value) {
                    handleRadioButtonChanged(5);
                  },
                ),
                new Text(
                  "Bachelor",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800),
                ),
                new Radio<int>(
                  value: 6,
                  groupValue: radioValue2,
                  onChanged: (value) {
                    handleRadioButtonChanged(6);
                  },
                ),
                new Text(
                  "College Graduate",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            new Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _legalRecord,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      labelText: "Legal Record",
                      hintText: "Write The Felony with Years Served",
                      counterText: "or just write Clean.",
                      counterStyle: new TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.w700),
                      icon: new Icon(
                        Icons.clear_all,
                        size: 30.0,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  new Padding(padding: const EdgeInsets.all(3.0)),
                  new TextField(
                    controller: _specialSkills,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      counterText:
                          "e.g. other languages, cooking, good with children...",
                      counterStyle: new TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.w700),
                      labelText: "Special Skills",
                      hintText:
                          "Enter The Skills The Might Help You in This Job",
                      icon: new Icon(
                        Icons.handyman_rounded,
                        size: 30.0,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0))
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(2.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Car Type: ",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0),
                ),
                new Radio<int>(
                  value: 3,
                  groupValue: radioValue,
                  onChanged: (value) {
                    handleRadioButtonChangedCar(3);
                  },
                ),
                new Text(
                  "None  ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey.shade600,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: (value) {
                    handleRadioButtonChangedCar(1);
                  },
                ),
                new Text(
                  "Taxi  ",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey.shade600,
                      fontWeight: FontWeight.w800),
                ),
                new Radio<int>(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (value) {
                    handleRadioButtonChangedCar(2);
                  },
                ),
                new Text(
                  "Pick Up/Truck",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey.shade600,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            new OutlinedButton(
              // Within the `FirstRoute` widget
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersScreen()));
                //ProceedPressed(_newRadioValue);
              },
              child: new Text(
                "Sign Up",
                style:
                    new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue.shade400,
                  // minimumSize: new Size(50, 50),
                  fixedSize: new Size(10, 50),
                  backgroundColor: Colors.grey.shade200,
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  padding: EdgeInsets.all(10.0)),
            ),
            new Padding(padding: const EdgeInsets.all(7.0)),
          ]),
        ));
  }

  void savingToVars() {
    addPerson();
  }

  Future<void> addPerson() async {}
}
