import 'package:flutter/material.dart';
import 'package:jooble_1_1/offers.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class SearcherSignup extends StatefulWidget {
  const SearcherSignup({Key? key}) : super(key: key);

  @override
  _SearcherSignupState createState() => _SearcherSignupState();
}

class _SearcherSignupState extends State<SearcherSignup> {
  int radioValue = 0, _newRadioValue = 0, _genderValue = 0;
  final TextEditingController _username = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _phoneNumber = new TextEditingController();
  static final List<String> days = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];
  String default_day = days.first;
  static final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String default_month = months.first;
  static final List<String> years = <String>[
    '1962',
    '1963',
    '1964',
    '1965',
    '1966',
    '1967',
    '1968',
    '1969',
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
  ];
  String default_year = years.first;

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

  final TextEditingController _specialSkills = new TextEditingController();
  final TextEditingController _legalRecord = new TextEditingController();

  int radioValue2 = 1;

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
          "User Sign Up",
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
                  ],
                )),
            new Divider(
              color: Colors.blueGrey,
              height: 20.0,
            ),
            new OutlinedButton(
              // Within the `FirstRoute` widget
              onPressed: () {
                doUserRegistration();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersScreen()));
              },
              child: new Text(
                "Sign Up",
                style: new TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue.shade400,
                  // minimumSize: new Size(50, 50),
                  fixedSize: new Size(10, 60),
                  backgroundColor: Colors.grey.shade200,
                  side: BorderSide(color: Colors.blue, width: 5.0),
                  padding: EdgeInsets.all(10.0)),
            ),
          ],
        ),
      ),
    );
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            new FlatButton(
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
            new FlatButton(
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

  Future<void> addOffer() async {
    final offer = ParseObject('User')..set('phone', _phoneNumber);
    await offer.save();
  }

  void doUserRegistration() async {
    final username = _username.text.trim();
    final email = _email.text.trim();
    final password = _password.text.trim();
    final phone = _phoneNumber.text.trim();

    final user = ParseUser.createUser(username, password, email);
    var response = await user.signUp();
    // final offer = ParseObject('User')..set('phone', phone);
    // await offer.save();
    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }

  Widget buildDropDownDays() => new Container(
      width: 100,
      height: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_day,
        items: days
            .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.adjust_sharp),
                      const SizedBox(width: 5),
                      new Text(
                        item,
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                  value: item,
                ))
            .toList(),
        onChanged: (value) =>
            setState(() => this.default_day = value.toString()),
      ));

  Widget buildDropDownMonths() => new Container(
      width: 180,
      height: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_month,
        items: months
            .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.adjust_sharp),
                      const SizedBox(width: 5),
                      new Text(
                        item,
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                  value: item,
                ))
            .toList(),
        onChanged: (value) =>
            setState(() => this.default_month = value.toString()),
      ));

  Widget buildDropDownYears() => new Container(
      width: 120,
      height: 45,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_year,
        items: years
            .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.adjust_sharp),
                      const SizedBox(width: 5),
                      new Text(
                        item,
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                  value: item,
                ))
            .toList(),
        onChanged: (value) =>
            setState(() => this.default_year = value.toString()),
      ));
}
