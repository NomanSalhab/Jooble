import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jooble_1_1/login.dart';
import 'package:jooble_1_1/searcher_signup.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  int rValue = 1, rGroupValue = 0;

  void handleRadioButtonUserType(int value) {
    setState(() {
      rValue = value;
      debugPrint("Changed User Type");
      rGroupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(
          color: Colors.blue.shade500,
        ),
        shadowColor: Colors.blue.shade900,
        foregroundColor: Colors.blue.shade500,
        title: new Text(
          "Sign Up",
          style: new TextStyle(
            color: Colors.blue.shade500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: new Container(
        color: Colors.grey.shade200,
        child: new Column(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    groupValue: rGroupValue,
                    value: 1,
                    onChanged: (value) {
                      handleRadioButtonUserType(1);
                    },
                  ),
                  new Text(
                    "New User?...Sign Up",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
            new Padding(padding: const EdgeInsets.all(15.5)),
            new Divider(
              color: Colors.blueGrey,
              height: 20.0,
            ),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Already Have an Account?",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio(
                  groupValue: rGroupValue,
                  value: 2,
                  onChanged: (value) {
                    handleRadioButtonUserType(2);
                  },
                ),
                new Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            new Divider(
              color: Colors.blueGrey,
            ),
            new Padding(padding: const EdgeInsets.all(4.0)),
            new OutlinedButton(
              onPressed: () {
                switch (rGroupValue) {
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearcherSignup()));
                    break;
                  case 2:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                    break;
                  case 3:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Empty title"),
                      duration: Duration(seconds: 2),
                    ));
                }
              },
              child: new Text("Proceed",
                  style: new TextStyle(
                    fontSize: 21.0,
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  )),
              style: OutlinedButton.styleFrom(
                  //alignment: Alignment(10, 0),
                  primary: Colors.blue.shade400,
                  // minimumSize: new Size(50, 50),
                  fixedSize: new Size(200, 50),
                  backgroundColor: Colors.grey.shade100,
                  side: BorderSide(color: Colors.blue, width: 5.5),
                  padding: EdgeInsets.all(10.0)),
            ),
          ],
        ),
      ),
    );
  }
}
