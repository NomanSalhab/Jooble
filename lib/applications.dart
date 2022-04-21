import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:jooble_1_1/show_list.dart';

class Applications extends StatelessWidget {
  late String email3;
  bool s = false;
  final TextEditingController _username = new TextEditingController();

  Applications({
    key,
    required this.email3,
  }) : super(key: key);

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
          "Applications to Your Offers",
          style: new TextStyle(
            color: Colors.blue.shade500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: new Column(
        children: <Widget>[
          new Image.asset(
            "images/884.png",
            alignment: Alignment.topCenter,
            width: 160,
            height: 128,
            color: Colors.blue.shade700,
          ),
          new Divider(
            color: Colors.blueGrey,
          ),
          new TextField(
            textAlign: TextAlign.center,
            controller: _username,
            decoration: new InputDecoration(
              filled: true,
              border: new OutlineInputBorder(
                  gapPadding: 6.0,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              labelText: "Email",
              hintText: "Enter Your Email",
              counterText: "e.g. JohnDoe55@hotmail.com",
              counterStyle:
                  new TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
              icon: new Icon(
                Icons.person_pin,
                size: 30.0,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          new Divider(
            color: Colors.blueGrey,
            height: 20,
          ),
          new OutlinedButton(
            // Within the `FirstRoute` widget
            onPressed: () {
              email3 = _username.text;
              s = true;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowList(email3)));
            },
            child: new Text(
              "Show Applications",
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            style: OutlinedButton.styleFrom(
                primary: Colors.blue.shade400,
                // minimumSize: new Size(50, 50),
                fixedSize: new Size(300, 50),
                backgroundColor: Colors.grey.shade200,
                side: BorderSide(color: Colors.blue, width: 3.0),
                padding: EdgeInsets.all(10.0)),
          ),
        ],
      ),
    );
  }

  Future<List<ParseObject>> getApplication(String email2) async {
    // getEmail(oId);
    QueryBuilder<ParseObject> queryApplication =
        QueryBuilder<ParseObject>(ParseObject('Application'));
    queryApplication..whereContains('EmployerEmail', email2);
    final ParseResponse apiResponse = await queryApplication.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
