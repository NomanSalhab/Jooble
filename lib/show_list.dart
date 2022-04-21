import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ShowList extends StatefulWidget {
  late String email;

  ShowList(this.email);

  @override
  _ShowListState createState() => _ShowListState(email);
}

class _ShowListState extends State<ShowList> {
  late String email;

  _ShowListState(this.email);

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
          new Expanded(
            child: FutureBuilder<List<ParseObject>>(
                future: getApplication(email),
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
                              final varResume = varOffer.get<String>('Resume');
                              final varDay = varOffer.get<String>('birthDay');
                              final varMonth =
                                  varOffer.get<String>('BirthMonth');
                              final varYear = varOffer.get<String>('BirthYear');
                              final varEducation =
                                  varOffer.get<String>('Education');
                              final varFormId = varOffer.get<String>('FormId');
                              final varTeam = varOffer.get<String>('Team');
                              final varCarType =
                                  varOffer.get<String>('CarType');
                              final varEmail =
                                  varOffer.get<String>('ApplicantEmail');
                              final appId = varOffer.get<String>('objectId');
                              final varId = varOffer.get<String>('FormId');

                              return new ListTile(
                                title: new Text('$varEducation'),
                                leading: new CircleAvatar(
                                  child: new Icon(Icons.business_center),
                                ),
                                trailing: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    //new Text("$varYear, "),
                                    new Text(
                                      "$varEmail ",
                                      style: new TextStyle(fontSize: 12.0),
                                      textAlign: TextAlign.end,
                                    ),
                                    new IconButton(
                                      onPressed: () async {
                                        deleteOffer('$varId', '$appId');
                                        setState(() {});
                                      },
                                      icon: new Icon(
                                        Icons.restore_from_trash_outlined,
                                        color: Colors.redAccent,
                                      ),
                                      tooltip: 'Apply Now',
                                    ),
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

  Future<List<ParseObject>> getApplication(String email2) async {
    // getEmail(oId);
    QueryBuilder<ParseObject> queryApplication =
        QueryBuilder<ParseObject>(ParseObject('Application'));
    //email2 = 'nomansalhab8516@gmail.com';
    queryApplication..whereContains('EmployerEmail', email2);
    final ParseResponse apiResponse = await queryApplication.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> deleteOffer(String oid, String aid) async {
    var offer = ParseObject('Offer')..objectId = oid;
    await offer.delete();
    var application = ParseObject('Application')..objectId = aid;
    await application.delete();
  }

  Future<void> deleteApplication(String id) async {
    var application = ParseObject('Application')..objectId = id;
    await application.delete();
  }
}
