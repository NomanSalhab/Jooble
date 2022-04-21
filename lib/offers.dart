import 'package:jooble_1_1/add_offers.dart';
import 'package:jooble_1_1/applications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:jooble_1_1/search.dart';
import 'dart:async';
import 'package:jooble_1_1/fill_form.dart';
//import 'fill_form.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late String offerName,
      offerSalary,
      contractType,
      start,
      end,
      edu,
      car,
      oId,
      e,
      email;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: buildNavigateButton(),
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              size: 34.0,
            ),
            onPressed: () {
              debugPrint("Show Search Filters Screen!");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
          ),
          new IconButton(
            icon: new Icon(
              Icons.content_paste,
              size: 34.0,
            ),
            onPressed: () {
              getTodo(oId);
              SavingEmail(oId);
              debugPrint("Show Search Filters Screen!");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Applications(email3: 'email')));
            },
          ),
        ],
        iconTheme: new IconThemeData(
          color: Colors.blue.shade500,
        ),
        shadowColor: Colors.blue.shade900,
        foregroundColor: Colors.blue.shade500,
        title: new Text(
          "Available Offers",
          style: new TextStyle(
            color: Colors.blue.shade500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: FutureBuilder<List<ParseObject>>(
                future: getOffer(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return new Center(
                        child: new Text('None.'),
                      );
                    case ConnectionState.waiting:
                      return new Center(
                        child: new Container(
                            width: 50,
                            height: 50,
                            child: new CircularProgressIndicator()),
                      );
                    default:
                      if (snapshot.hasError) {
                        return new Center(
                          child: new Text('Error.'),
                        );
                      }
                      if (!snapshot.hasData) {
                        return new Center(
                          child: new Text('No Data...'),
                        );
                      } else {
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 10.0),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final varOffer = snapshot.data![index];
                              final varName = varOffer.get<String>('name')!;
                              final varMinSalary =
                                  varOffer.get<int>('MinimumSalary')!;
                              final varMaxSalary =
                                  varOffer.get<int>('MaximumSalary')!;
                              final varLocation =
                                  varOffer.get<String>('Location')!;
                              final varWorkType =
                                  varOffer.get<String>('WorkType')!;
                              final varContractType =
                                  varOffer.get<String>('ContractType')!;
                              final varStartHour =
                                  varOffer.get<int>('StartHour')!;
                              final varEndHour = varOffer.get<int>('EndHour')!;
                              final varMinEducation =
                                  varOffer.get<String>('MinimumEducation')!;
                              final varCarType =
                                  varOffer.get<String>('CarType')!;
                              oId = varOffer.get<String>('objectId')!;
                              e = varOffer.get<String>('EmployerEmail')!;

                              return new ListTile(
                                onTap: () {
                                  ShowAlertMessage(
                                      context,
                                      varName,
                                      varLocation,
                                      '$varMinSalary',
                                      '$varStartHour',
                                      varContractType,
                                      '$varEndHour',
                                      varMinEducation,
                                      varCarType,
                                      varOffer.objectId!);
                                },
                                title: new Text(varName,
                                    style: new TextStyle(fontSize: 18.0)),
                                leading: new CircleAvatar(
                                  child: new Icon(Icons.business_center),
                                ),
                                trailing: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text("$varWorkType,",
                                        style: new TextStyle(fontSize: 13.0)),
                                    new IconButton(
                                        onPressed: () async {
                                          oId =
                                              varOffer.get<String>('objectId')!;
                                          e = varOffer
                                              .get<String>('EmployerEmail')!;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FillForm(
                                                          varOffer.objectId!,
                                                          e)));
                                        },
                                        icon: new Icon(
                                          Icons.paste_rounded,
                                          color: Colors.green,
                                        )),
                                    new IconButton(
                                        onPressed: () async {
                                          oId =
                                              varOffer.get<String>('objectId')!;
                                          var e = varOffer
                                              .get<String>('EmployerEmail');
                                          ShowDeleteMessage(context, '$e', oId);
                                        },
                                        icon: new Icon(
                                          Icons.restore_from_trash_outlined,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              );
                            });
                      }
                  }
                }),
          ),
        ],
      ),
    );
    // );
  }

  void ShowAlertMessage(
      BuildContext context,
      String offerNam,
      String offerLoc,
      String offerSal,
      String offerStart,
      String offerCon,
      String offerEnd,
      String offerEdu,
      String offerCar,
      String oId) async {
    //getTodo(oId);
    var alert = new AlertDialog(
      title: new Text(offerNam),
      content: new Text(
          "  Offer Location is $offerLoc\n  Offer Salary is $offerSal\n  Contract Type is $offerCon\n  Start Hour is $offerStart\n  End Hour is $offerEnd\n  Required Education is $offerEdu\n  Required Car is $offerCar"),
      actions: <Widget>[
        new TextButton(
          child: new Text(
            "Apply",
            style: new TextStyle(color: Colors.blue.shade500),
          ),
          onPressed: () {
            Navigator.pop(context);
            // oId =
            // varOffer.get<String>('objectId')!;
            // e = varOffer.get<String>('EmployerEmail')!;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FillForm('$oId', '$e')));
          },
          //icon: new Icon(Icons.add)
        ),
        new TextButton(
          child: new Text(
            "Cancel",
            style: new TextStyle(color: Colors.blue.shade500),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    await showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void ShowDeleteMessage(
      BuildContext context, String offerE2, String offerId) async {
    //getTodo(oId);
    final TextEditingController offerE = new TextEditingController();
    var alert = new AlertDialog(
      title: new Text('Enter email for Conformation'),
      content: new TextField(
        controller: offerE,
        keyboardType: TextInputType.text,
      ),
      actions: <Widget>[
        new TextButton(
          child: new Text(
            "Apply",
            style: new TextStyle(color: Colors.blue.shade500),
          ),
          onPressed: () {
            if (offerE.text == offerE2) deleteOffer(offerId);
            Navigator.pop(context);
            setState(() {});
          },
        ),
        new TextButton(
          child: new Text(
            "Cancel",
            style: new TextStyle(color: Colors.blue.shade500),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    await showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  Future<List<ParseObject>> getOffer() async {
    QueryBuilder<ParseObject> queryOffer =
        QueryBuilder<ParseObject>(ParseObject('Offer'));
    final ParseResponse apiResponse = await queryOffer.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> getTodo(String oId) async {
    QueryBuilder<ParseObject> queryOffer =
        QueryBuilder<ParseObject>(ParseObject('Offer'));
    var offer = ParseObject('Offer')..objectId = oId;

    final apiResponse = await ParseObject('Offer').get(oId);
    offerName = offer.get<String>('name')!;
    offerSalary = offer.get<int>('MinimumSalary')!.toString();
    contractType = offer.get<String>('ContractType')!;
    start = offer.get<int>('StartHour')!.toString();
    end = offer.get<int>('EndHour')!.toString();
    edu = offer.get<String>('MinimumEducation')!;
    car = offer.get<String>('CarType')!;
    email = offer.get<String>('EmployerEmail')!;

    if (apiResponse.success && apiResponse.results != null) {
      for (var o in apiResponse.results) {
        final object = o as ParseObject;

        print('${object.objectId} - ${object.get<String>('name')}');
      }
    }
    // return [];
  }

  Widget buildNavigateButton() => FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddOffer()));
        },
        icon: new Icon(Icons.add),
        label: new Text("Add an Offer"),
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.grey.shade200,
      );

  Future<void> SavingEmail(String oId) async {
    QueryBuilder<ParseObject> queryOffer =
        QueryBuilder<ParseObject>(ParseObject('Offer'));
    var offer = ParseObject('Offer')..objectId = oId;
    // final ParseResponse apiResponse = await offer.query();
    final apiResponse = await ParseObject('Offer').get(oId);
    email = offer.get<String>('EmployerEmail')!;
  }

  Future<void> deleteOffer(String oid) async {
    var offer = ParseObject('Offer')..objectId = oid;
    await offer.delete();
  }
}
