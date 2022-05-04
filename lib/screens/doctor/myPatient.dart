// ignore_for_file: camel_case_types, file_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'package:_finalproject/Screens/doctor/Mypatients.dart';
import 'package:_finalproject/Screens/doctor/homePageDoctor.dart';
import 'package:_finalproject/Screens/doctor/recovery_Plan.dart';
import 'package:flutter/material.dart';

import 'AddPatient.dart';
import 'AllReportOfPatient.dart';
import 'ImageOfInjury.dart';
import 'List_of_Xray.dart';
import 'diag_report.dart';

class myPatient extends StatelessWidget {
  const myPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: Column(
        //   verticalDirection: VerticalDirection.down,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image.asset('images/p2.png'),
          Container(
            padding: const EdgeInsets.all(20.0),
            color: const Color(0xFF4d8d6e),
            child: Row(
              children: [
                Positioned(
                  top: 10,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => homePageDoctor()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20.0),
                const Image(
                  width: 60,
                  height: 60,
                  image: AssetImage('assets/images/patient.png'),
                  color: Colors.white,
                ),
                /*Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 60.0,
                  ),*/
                const SizedBox(
                  width: 20.0,
                ),
                const Text(
                  "Patients",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 15.0,
          ),
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            color: Colors.white70,
            child: Expanded(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mypatients()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 13, horizontal: 7),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.assignment_ind_outlined,
                        color: Color(0xFF3b6b54),
                        size: 35.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "My Patients",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 5),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            color: Colors.white70,
            child: Expanded(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPatient()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 13, horizontal: 7),
                  child: Row(
                    children: const [
                      Image(
                        width: 34,
                        height: 34,
                        image: AssetImage('assets/images/patient.png'),
                        color: Color(0xFF4d8d6e),
                      ),
                      /*  Icon(
                          Icons.description_outlined,
                          color: Color(0xFF3b6b54),
                          size: 30.0,
                        ),*/
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Add patient",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
