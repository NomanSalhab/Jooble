import 'package:flutter/material.dart';
import 'package:jooble_1_1/offers.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
class FillForm extends StatefulWidget {
  late String offerID, email;
  FillForm(this.offerID, this.email);
  @override
  _FillFormState createState() => _FillFormState(offerID, email);
}

class _FillFormState extends State<FillForm> {
  late String offerID, email;
  _FillFormState(this.offerID, this.email);

  final TextEditingController _offerEmail = new TextEditingController();
  late String _email;
  static final List<String> days = <String>[
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31',
  ];
  String default_day = days.first;
  static final List<String> months = <String>[
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];
  String default_month = months.first;
  static final List<String> years = <String>[
    '1962', '1963', '1964', '1965', '1966', '1967',
    '1968', '1969', '1970', '1971', '1972', '1973',
    '1974', '1975', '1976', '1977', '1978', '1979',
    '1980', '1981', '1982', '1983', '1984', '1985',
    '1986', '1987', '1988', '1989', '1990', '1991',
    '1992', '1993', '1994', '1995', '1996', '1997',
    '1998', '1999', '2000', '2001', '2002', '2003',
    '2004',
  ];
  String default_year = years.first;

  int radioValue = 0, _newRadioValue = 0, _carValue = 0, radioEducation2 = 0;
  late String _resume;
  String edu = 'Middle School', car = 'No', team = 'No', day = days.first, month = months.first, year = years.first;
  final TextEditingController _resumeController = new TextEditingController();

  void handleRadioButtonChangedJob(int value) {
    setState(() {

      radioValue = value;
      debugPrint("Changed");
      _newRadioValue = value;
      Team(radioValue);
    });
  }
  void handleRadioButtonChangedCar(int value) {
    setState(() {
      _carValue = value;
      debugPrint("Changed Car");
      Car(_carValue);
    });
  }

  void handleRadioButtonEducation(int value) {
    setState(() {
      radioEducation2 = value;
      debugPrint("Changed Education");
      _newRadioValue = value;
      Edu(radioEducation2);
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
        title: new Text("Fill Application Form",
          style: new TextStyle(
            color: Colors.blue.shade500,
          ),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: new ListView(
        children: <Widget> [
          new Padding(padding: const EdgeInsets.all(8.0)),
          new Image.asset(
            "images/276.png",
            width: 128,
            height: 128,
            color: Colors.blue.shade700,
          ),
          new Padding(padding: const EdgeInsets.all(12.0)),
          new Container(
            color: Colors.grey.shade100,
            padding: const EdgeInsets.all(3.5),
            child: new Column(
              children: <Widget>[
                new Text("What Would Make Us Choose You?",textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 28.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800
                  ),),
                new Padding(padding: const EdgeInsets.all(12.0)),
                new Container(
                  alignment: Alignment.topCenter,
                  child: new TextField(
                  controller: _resumeController,
                  maxLines: 4,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        gapPadding: 6.0,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )
                    ),
                    labelStyle: new TextStyle(fontSize: 28.0),
                    labelText: "Personal Resume",
                    hintText: "Write a bit about Your Self",
                    hintStyle: new TextStyle(
                      fontSize: 21.0,
                    ),
                    filled: true,alignLabelWithHint: true,
                    icon: new Icon(Icons.person_pin,size: 40.0,),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                ),),
                new Padding(padding: const EdgeInsets.all(8.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Your Education:      ",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [new Radio<int>(
                      value: 7,
                      groupValue: radioEducation2,
                      onChanged: (value) {
                        handleRadioButtonEducation(7);
                      },
                    ),
                      new Text(
                        "Middle School  ",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w800),
                      ),]),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio<int>(
                      value: 8,
                      groupValue: radioEducation2,
                      onChanged: (value) {
                        handleRadioButtonEducation(8);
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
                      value: 9,
                      groupValue: radioEducation2,
                      onChanged: (value) {
                        handleRadioButtonEducation(9);
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
                new Divider(color: Colors.blueGrey),
                new Container(
                  alignment: Alignment.center,
                  child: new Text("Date of Birth:",textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),),),
                new Padding(padding: const EdgeInsets.all(8.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[new Container(
                        alignment: Alignment.topCenter,
                        child: buildDropDownDays()),
                      new SizedBox(width: 7,),
                      new Container(
                          alignment: Alignment.topCenter,
                          child: buildDropDownMonths()),
                      new SizedBox(width: 7,),
                      new Container(
                          alignment: Alignment.topCenter,
                          child: buildDropDownYears()),
                    ]),
                new Divider(color: Colors.blueGrey),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.all(5.0)),
                    new Text(
                      "Can You Drive a Car? ",
                      style: new TextStyle(
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.w800,
                        fontSize: 19.0,
                      ),
                    ),
                    new Radio<int>(
                      value: 3,
                      groupValue: _carValue,
                      onChanged: (value) {
                        handleRadioButtonChangedCar(3);
                      },
                    ),
                    new Text(
                      "Yes",
                      style: new TextStyle(
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.w800,
                        fontSize: 17.5,
                      ),
                    ),
                    new Radio<int>(
                      value: 4,
                      groupValue: _carValue,
                      onChanged: (value) {
                        handleRadioButtonChangedCar(4);
                      },
                    ),
                    new Text(
                      "No",
                      style: new TextStyle(
                          color: Colors.blueGrey.shade600,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.8),
                    ),
                  ],
                ),
                new Padding(padding: const EdgeInsets.all(6.5),),
                new Container(
                  color: Colors.grey.shade300,
                  child: new Padding(padding: const EdgeInsets.fromLTRB(200, 1.0, 200, 1.0)),
                ),
                new Padding(padding: const EdgeInsets.all(10.0),),

                    new Text("Are You Good With Working in a Team?",textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.w800,
                        fontSize: 17.8),),
                new Padding(padding: const EdgeInsets.all(7.0)),
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
                      "Yes",
                      style: new TextStyle(
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.w800,
                        fontSize: 17.5,
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
                      "No",
                      style: new TextStyle(
                          color: Colors.blueGrey.shade600,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.8),
                    ),
                  ],
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  child:new TextField(
                    controller: _offerEmail,
                    decoration: new InputDecoration(
                      filled: true,
                      border: new OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(40.0),
                          )
                      ),
                      labelStyle: new TextStyle(fontSize: 18.0),
                      labelText: "Your Email",
                      hintText: "Enter Your Account's Email For Confirmation.",
                      icon: new Icon(Icons.lock_open_rounded,size: 27.0,),
                    ),
                    keyboardType: TextInputType.text,
                  ),),
                new Padding(padding: const EdgeInsets.all(7.0)),
                new Align(
                  alignment: Alignment.topRight,
                  child: new OutlinedButton(
                  // Within the `FirstRoute` widget
                  onPressed: () {
                    SetDoB(email);
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => OffersScreen()
                        ));
                  },
                  child: new Text(
                    "Apply",
                    style: new TextStyle(
                      fontSize: 19.0,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(//alignment: Alignment(10, 0),
                      primary: Colors.blue.shade400,
                      // minimumSize: new Size(50, 50),
                      fixedSize: new Size(200, 50),
                      backgroundColor: Colors.grey.shade200,
                      side: BorderSide(color: Colors.blue, width: 3.0),
                      padding: EdgeInsets.all(10.0)),
                ),),
                new Padding(padding: const EdgeInsets.all(9.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void Edu(int v) {
    switch(v) {
      case 7: edu = 'Middle School'; break;
      case 8: edu = 'Bachelor'; break;
      case 9: edu = 'College'; break;
      default: edu = 'Middle School'; break;
    }
  }
  void Car(int v) {
    switch(v) {
      case 3: car = 'Yes'; break;
      case 4: car = 'No'; break;
      default: car = 'No'; break;
    }
  }
  void Team(int v) {
    switch(v) {
      case 1: team = 'Yes'; break;
      case 2: team = 'No'; break;
      default: team = 'No'; break;
    }
  }
  Widget buildDropDownDays() =>
      new Container(
          width: 90,
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
            items: days.map((item) =>
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.adjust_sharp),
                      const SizedBox(width: 5),
                      new Text(item,
                        style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),),
                    ],
                  ),
                  value: item,
                )).toList(),
            onChanged: (value) =>
                setState(() => this.default_day = value.toString()),

          ));

  Widget buildDropDownMonths() =>
      new Container(
          width: 170,
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
            items: months.map((item) =>
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.adjust_sharp),
                      const SizedBox(width: 5),
                      new Text(item,
                        style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),),
                    ],
                  ),
                  value: item,
                )).toList(),
            onChanged: (value) =>
                setState(() => this.default_month = value.toString()),

          ));

  Widget buildDropDownYears() =>
      new Container(
          width: 110,
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
            items: years.map((item) =>
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.adjust_sharp),
                      const SizedBox(width: 5),
                      new Text(item,
                        style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),),
                    ],
                  ),
                  value: item,
                )).toList(),
            onChanged: (value) =>
                setState(() => this.default_year = value.toString()),

          ));

  void SetDoB(String email) {
    _resume = _resumeController.text;
    day = default_day;
    month = default_month;
    year = default_year;
    _email = _offerEmail.text;
    addApplication(email);
  }

Future<void> addApplication(String email) async {
    final offer = ParseObject('Application')
      ..set('formId', offerID)
      ..set('Resume', _resume)
      ..set('BirthDay', day)
      ..set('BirthMonth', month)
      ..set('BirthYear', year)
      ..set('Education', edu)
      ..set('Team', team)
      ..set('CarType', car)
      ..set('ApplicantEmail', _email)
      ..set('EmployerEmail', email);
    await offer.save();



}

}

