import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:jooble_1_1/offers.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _username = new TextEditingController();
  bool isLoggedIn = false;

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
            "User Login",
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
            new Divider(
              color: Colors.blueGrey,
            ),
            new Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _username,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      labelText: "Email",
                      hintText: "Enter Yor Email",
                      counterText: "e.g. JohnDoe55@hotmail.com",
                      counterStyle: new TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.w700),
                      icon: new Icon(
                        Icons.person_pin,
                        size: 30.0,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  new Padding(padding: const EdgeInsets.all(3.0)),
                  new Divider(
                    color: Colors.blueGrey,
                  ),
                  new TextField(
                    controller: _password,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          )),
                      //counterText: "e.g. other languages, cooking, good with children...",
                      counterStyle: new TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.w700),
                      labelText: "Password",
                      hintText:
                          "Enter The Password You Entered For This Account",
                      icon: new Icon(
                        Icons.lock_outline,
                        size: 30.0,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0))
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(2.0)),
            new Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            new Divider(
              color: Colors.blueGrey,
            ),
            new OutlinedButton(
              // Within the `FirstRoute` widget
              onPressed: () {
                doUserLogin();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersScreen()));
              },
              child: new Text(
                "Login",
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

  void doUserLogin() async {
    final username = _username.text.trim();
    final password = _password.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      showSuccess("User was successfully login!");
      setState(() {
        isLoggedIn = true;
      });
    } else {
      showError(response.error!.message);
    }
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
