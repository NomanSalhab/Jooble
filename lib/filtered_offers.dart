import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:jooble_1_1/search.dart';
import 'package:jooble_1_1/fill_form.dart';

class FilteredOffers extends StatelessWidget {
  late List<String> data;

  FilteredOffers({
    key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                future: getFilteredOffers(),
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
                              final varEmail =
                                  varOffer.get<String>('EmployerEmail')!;

                              return new ListTile(
                                title: new Text(varName),
                                leading: new CircleAvatar(
                                  child: new Icon(Icons.business_center),
                                ),
                                trailing: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text("$varLocation, "),
                                    new Text("$varWorkType, "),
                                    new IconButton(
                                        onPressed: () async {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FillForm(
                                                          varOffer.objectId!,
                                                          varEmail)));
                                        },
                                        icon: new Icon(
                                          Icons.paste_rounded,
                                          color: Colors.green,
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
  }

  Future<List<ParseObject>> getFilteredOffers() async {
    QueryBuilder<ParseObject> queryOffer =
        QueryBuilder<ParseObject>(ParseObject('Offer'));
    if (data[5] == 'Temporary') {
      queryOffer
        ..whereContains('name', data[0])
        ..whereGreaterThanOrEqualsTo(
            'MinimumSalary', int.parse(data[1]).round())
        ..whereContains('Location', data[3])
        ..whereContains('WorkType', data[4])
        ..whereContains('ContractType', data[5])
        ..whereContains('ContractDuration', data[6])
        ..whereContains('ContractDurationMax', data[7])
        ..whereGreaterThanOrEqualsTo('StartHour', int.parse(data[8]))
        ..whereLessThanOrEqualTo('EndHour', int.parse(data[9]))
        ..whereContains('MinimumEducation', data[10])
        ..whereContains('CarType', data[11]);
      final ParseResponse apiResponse = await queryOffer.query();
      if (apiResponse.success && apiResponse.results != null) {
        return apiResponse.results as List<ParseObject>;
      } else {
        return [];
      }
    } else {
      queryOffer
        ..whereContains('name', data[0])
        ..whereGreaterThanOrEqualsTo(
            'MinimumSalary', int.parse(data[1]).round())
        //..whereLessThanOrEqualTo('MaximumSalary', int.parse(data[2]))
        ..whereContains('Location', data[3])
        ..whereContains('WorkType', data[4])
        ..whereContains('ContractType', data[5])
        ..whereGreaterThanOrEqualsTo('StartHour', int.parse(data[8]))
        ..whereLessThanOrEqualTo('EndHour', int.parse(data[9]))
        ..whereContains('MinimumEducation', data[10])
        ..whereContains('CarType', data[11]);
      final ParseResponse apiResponse = await queryOffer.query();
      if (apiResponse.success && apiResponse.results != null) {
        return apiResponse.results as List<ParseObject>;
      } else {
        return [];
      }
    }
  }
}
