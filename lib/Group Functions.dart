import 'package:amritasreeproject/AddtoGroup.dart';
import 'package:amritasreeproject/CreateGroup.dart';
import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'registration.dart';
import 'MigrateGroup.dart';
import 'CreateCluster.dart';
import 'AddToCluster.dart';
import 'list.dart';
import 'MigrateCluster.dart';

class GF extends StatelessWidget {
  final int MemberID,GroupID;

  GF({this.MemberID, this.GroupID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AmritaSREE'),
      ),
      body: ListView(
          children:[ Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/amma.png',
                      height: 100.0,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        height: 60.0,
                        minWidth: 270.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GrpRegistration()));
                          },
                          child: Text(
                            "Create Group",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: new Color(0xff622F74),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        height: 60.0,
                        minWidth: 270.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ATG()));
                          },
                          child: Text(
                            "Add to Group",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: new Color(0xff622F74),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        height: 60.0,
                        minWidth: 270.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MG()));
                          },
                          child: Text(
                            "Migrate Group",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: new Color(0xff622F74),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        height: 60.0,
                        minWidth: 270.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Dashboard(MemberID: MemberID)));
                          },
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: new Color(0xff622F74),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        height: 60.0,
                        minWidth: 270.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: new Color(0xff622F74),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          ]),
    );
  }
}
