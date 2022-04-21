import 'package:jooble_1_1/offers.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AddOffer extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  final TextEditingController _offerName = new TextEditingController();

  final TextEditingController _offerEmail = new TextEditingController();

  final TextEditingController _offerMinimumSalary = new TextEditingController();

  final TextEditingController _offerMaximumSalary = new TextEditingController();

  final TextEditingController _offerLocation = new TextEditingController();

  final TextEditingController _offerWorkType = new TextEditingController();

  final TextEditingController _offerContractType = new TextEditingController();

  final TextEditingController _offerStartHour = new TextEditingController();

  final TextEditingController _offerEndHour = new TextEditingController();

  final TextEditingController _offerMinimumEducation =
      new TextEditingController();

  final TextEditingController _offerCarType = new TextEditingController();

  late String _email,
      _name,
      _location,
      _workType,
      _contractType,
      _minEducation,
      _carType,
      _contractDuration,
      _contractDurationMax;

  late int _startHour, _endHour, _minSalary, _maxSalary;
  RangeValues hours = RangeValues(0, 23), salaries = RangeValues(50000, 550000);

  static final List<String> contract_duration = <String>[
    '1 Month',
    '2 Months',
    '3 Months',
    '6 Months',
    '9 Months',
    '1 Year',
    'More..',
  ];
  String default_contract_duration = contract_duration.first;
  String default_contract_duration_max = contract_duration.last;
  String edu = 'Middle School', car = 'None', contract = 'None';
  int radioContract2 = 6,
      _newRadioValue = 0,
      radioEducation2 = 7,
      radioValue = 3;

  void handleRadioButtonChanged(int value) {
    setState(() {
      radioContract2 = value;
      debugPrint("Changed Contract");
      _newRadioValue = value;
      Contract(radioContract2);
      ContractType();
    });
  }

  void handleRadioButtonEducation(int value) {
    setState(() {
      radioEducation2 = value;
      debugPrint("Changed Contract");
      _newRadioValue = value;
      Edu(radioEducation2);
    });
  }

  void handleRadioButtonChangedCar(int value) {
    setState(() {
      radioValue = value;
      debugPrint("Changed Car");
      _newRadioValue = value;
      Car(radioValue);
    });
  }

  static final List<String> work_types = <String>[
    // 'Any',
    'Desk',
    'Labor',
    'Services',
    'Management',
    'Delivery',
    'Other',
  ];
  String default_work_type = work_types.first;

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
          "Add A New Job Offer",
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
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(9.0)),
            new TextField(
              controller: _offerName,
              decoration: new InputDecoration(
                filled: true,
                border: new OutlineInputBorder(
                    gapPadding: 6.0,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                labelStyle: new TextStyle(fontSize: 18.0),
                labelText: "Offer Name/اسم المنصب",
                hintText: "Write The Job's Position/المنصب",
                icon: new Icon(
                  Icons.person_pin,
                  size: 25.0,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            new Divider(
              color: Colors.blue,
            ),
            new Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(4.0),
              child: new Text(
                "Required Job Salary:",
                style: new TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            new Padding(padding: const EdgeInsets.all(4.0)),
            new Row(children: <Widget>[
              //buildSideLabel("50K"),
              new Text(
                "50K",
                style: new TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              new Expanded(
                child: new RangeSlider(
                  values: salaries,
                  min: 50000,
                  max: 550000,
                  divisions: 50,
                  labels: RangeLabels(salaries.start.round().toString(),
                      salaries.end.round().toString()),
                  onChanged: (salaries) =>
                      setState(() => {this.salaries = salaries}),
                ),
              ),
              new Text(
                "550K",
                style: new TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
            ]),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Text(
              "Salary Range is: ${salaries.start.round()}-${salaries.end.round()}",
              style: new TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            new Divider(
              color: Colors.blueGrey,
            ),
            Row(
              children: [
                new Text(
                  "  Desired Location:  ",
                  style: new TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                new Container(
                    alignment: Alignment.topCenter,
                    child: buildDropDownGovernorates()),
              ],
            ),
            new Divider(
              color: Colors.blue,
            ),
            Row(
              children: [
                new Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                  child: new Text(
                    "  Desired Work Type:  ",
                    style: new TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                new Container(
                    alignment: Alignment.topCenter,
                    child: buildDropDownWorkType()),
              ],
            ),
            new Divider(
              color: Colors.blue,
            ),

            new Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
              child: new Text(
                "Type of Contract:",
                style: new TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            new Padding(padding: const EdgeInsets.all(8.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                  value: 4,
                  groupValue: radioContract2,
                  onChanged: (value) {
                    handleRadioButtonChanged(4);
                  },
                ),
                new Text(
                  "Temporary  ",
                  style: new TextStyle(
                      fontSize: 16.0,
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
                  groupValue: radioContract2,
                  onChanged: (value) {
                    handleRadioButtonChanged(5);
                  },
                ),
                new Text(
                  "Perminant",
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800),
                ),
                new Radio<int>(
                  value: 6,
                  groupValue: radioContract2,
                  onChanged: (value) {
                    handleRadioButtonChanged(6);
                  },
                ),
                new Text(
                  "None Desired",
                  style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            ContractType(),

            new Divider(
              color: Colors.blue,
            ),

            new Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(4.0),
              child: new Text(
                "Required Work Hours:",
                style: new TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            new Padding(padding: const EdgeInsets.all(4.0)),
            //Salary Slider
            new Row(children: <Widget>[
              new Text(
                "12 A.M.",
                style: new TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              new Expanded(
                child: new RangeSlider(
                  values: hours,
                  min: 0,
                  max: 24,
                  divisions: 24,
                  labels: RangeLabels(hours.start.round().toString(),
                      hours.end.round().toString()),
                  onChanged: (hours) => setState(() => this.hours = hours),
                ),
              ),
              new Text(
                "12 A.M.",
                style: new TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
            ]),
            new Padding(padding: const EdgeInsets.all(5.0)),
            new Text(
              "Work Hours: ${hours.start.round()}-${hours.end.round()}",
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            new Divider(
              color: Colors.blue,
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Minimum Education Required:      ",
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
                children: <Widget>[
                  new Radio<int>(
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
                  ),
                ]),
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
            new Divider(
              color: Colors.blue,
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Car Type:   ",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 19.0),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
            new Divider(color: Colors.blueGrey),
            new Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
              child: new TextField(
                controller: _offerEmail,
                decoration: new InputDecoration(
                  filled: true,
                  border: new OutlineInputBorder(
                      gapPadding: 6.0,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                      )),
                  labelStyle: new TextStyle(fontSize: 18.0),
                  labelText: "Your Email",
                  hintText: "Enter Your Account's Email For Confirmation.",
                  icon: new Icon(
                    Icons.lock_open_rounded,
                    size: 27.0,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            new Divider(
              color: Colors.blueGrey,
              height: 20.0,
            ),
            new OutlinedButton(
              // Within the `FirstRoute` widget
              onPressed: () {
                savingToVars();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersScreen()));
              },
              child: new Text(
                "Publish Job Offer",
                style:
                    new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue.shade400,
                  // minimumSize: new Size(50, 50),
                  fixedSize: new Size(280, 50),
                  backgroundColor: Colors.grey.shade200,
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  padding: EdgeInsets.all(10.0)),
            ),
            new Padding(padding: const EdgeInsets.all(5.0)),
          ],
        ),
      ),
    );
  }

  static final List<String> governorates = <String>[
    // 'Any',
    'Damascus',
    'Rif Dimashq',
    'Aleppo',
    'Lattakia',
    'Homs',
    'Tarttus',
    'Hama',
    'Al-Suwayda',
    'Daraa',
    'Deir ez-zor',
    'Idlib',
    'Raqqa',
    'Al-Hasakah',
    'Quneitra',
  ];
  String default_governorate = governorates.first;

  Widget buildDropDownGovernorates() => new Container(
      width: 200,
      height: 53,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_governorate,
        items: governorates
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
            setState(() => this.default_governorate = value.toString()),
      ));

  void Edu(int v) {
    switch (v) {
      case 7:
        edu = 'Middle School';
        break;
      case 8:
        edu = 'Bachelor';
        break;
      case 9:
        edu = 'College';
        break;
      default:
        edu = 'Middle School';
        break;
    }
  }

  void Car(int v) {
    switch (v) {
      case 1:
        car = 'Taxi';
        break;
      case 2:
        car = 'Pickup/Truck';
        break;
      case 3:
        car = 'None';
        break;
      default:
        car = 'None';
        break;
    }
  }

  void Contract(int v) {
    switch (v) {
      case 4:
        contract = 'Temporary';
        break;
      case 5:
        contract = 'Permanent';
        break;
      case 6:
        contract = 'None';
        break;
      default:
        contract = 'None';
        break;
    }
  }

  Widget ContractType() {
    int t = radioContract2;
    bool flag = true;
    if (t == 4)
      flag = true;
    else
      flag = false;
    /*if(t == 4)*/
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 750),
        child: flag
            ? Container(
                key: Key('1'),
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.all(4.0)),
                    new Row(
                      children: <Widget>[
                        new Text(
                          "   Minimum Duration:     ",
                          style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        new Container(
                            alignment: Alignment.topCenter,
                            child: buildDropDownContractType()),
                      ],
                    ),
                    new Padding(padding: const EdgeInsets.all(4.0)),
                    new Row(
                      children: <Widget>[
                        new Text(
                          "   Maximum Duration:    ",
                          style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        new Container(
                            key: Key('2'),
                            alignment: Alignment.topCenter,
                            child: buildDropDownContractTypeMax()),
                      ],
                    ),
                  ],
                ),
              )
            : Container(
                color: Colors.grey.shade200,
                child: new Padding(padding: const EdgeInsets.all(2.0)),
              ));
  }

  Widget buildDropDownContractType() => new Container(
      width: 160,
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_contract_duration,
        items: contract_duration
            .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.timelapse_outlined),
                      const SizedBox(width: 5),
                      new Text(
                        item,
                        style: new TextStyle(
                          fontSize: 17.0,
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
            setState(() => this.default_contract_duration = value.toString()),
      ));

  Widget buildDropDownContractTypeMax() => new Container(
      width: 160,
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_contract_duration_max,
        items: contract_duration
            .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.timelapse_outlined),
                      const SizedBox(width: 5),
                      new Text(
                        item,
                        style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                  value: item,
                ))
            .toList(),
        onChanged: (value) => setState(
            () => this.default_contract_duration_max = value.toString()),
      ));

  Widget buildDropDownWorkType() => new Container(
      width: 200,
      height: 53,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.blue.shade500, width: 3),
      ),
      child: new DropdownButton<String>(
        value: default_work_type,
        items: work_types
            .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.business_center),
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
            setState(() => this.default_work_type = value.toString()),
      ));

  void savingToVars() {
    _email = _offerEmail.text;
    _name = _offerName.text;
    _minSalary = int.parse(salaries.start.round().toString());
    _maxSalary = int.parse(salaries.end.round().toString());
    _location = default_governorate;
    _workType = default_work_type;
    _contractType = contract;
    _contractDuration = default_contract_duration;
    _contractDurationMax = default_contract_duration_max;
    _startHour = int.parse(hours.start.round().toString());
    _endHour = int.parse(hours.end.round().toString());
    _minEducation = edu;
    _carType = car;
    addOffers();
  }

  ParseUser? currentUser;
  late String id;

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    id = currentUser!.username!;
    return currentUser;
  }

  Future<void> addOffers() async {
    if (_contractType == 'Temporary') {
      final offer = ParseObject('Offer')
        ..set('name', _name)
        ..set('MinimumSalary', _minSalary)
        ..set('MaximumSalary', _maxSalary)
        ..set('Location', _location)
        ..set('StartHour', _startHour)
        ..set('EndHour', _endHour)
        ..set('MinimumEducation', _minEducation)
        ..set('CarType', _carType)
        ..set('ContractType', _contractType)
        ..set('ContractDuration', _contractDuration)
        ..set('ContractDurationMax', _contractDurationMax)
        ..set('WorkType', _workType)
        ..set('EmployerEmail', _email);
      await offer.save();
    } else {
      final offer = ParseObject('Offer')
        ..set('name', _name)
        ..set('MinimumSalary', _minSalary)
        ..set('MaximumSalary', _maxSalary)
        ..set('Location', _location)
        ..set('StartHour', _startHour)
        ..set('EndHour', _endHour)
        ..set('MinimumEducation', _minEducation)
        ..set('CarType', _carType)
        ..set('ContractType', _contractType)
        ..set('WorkType', _workType)
        ..set('EmployerEmail', _email);
      await offer.save();
    }
  }
}
