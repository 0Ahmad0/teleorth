// ignore_for_file: camel_case_types, file_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/report/details_report.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../recovery_plan_creen1.dart';
import '../../recovery_plan_screen2.dart';
import '../doctor/recovery_Plan.dart';
import 'Diagnosis_result.dart';
import 'Dignosisi_report.dart';
import 'Injury_Image.dart';
import 'List_of_Xray.dart';
import 'allreport_Patient.dart';
import 'recovery_plan.dart';

class Each_report extends StatelessWidget {
  const Each_report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: Column(
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
                            context);
                        },
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 60.0,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                     Text(
                       FirebaseController.listReport[FirebaseController.indexReport]["details"]["name"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),

              Material(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
                  color: Colors.white,
                  child: Row(
                    children:  [
                      Text(
                  "#${FirebaseController.indexReport+1}_"+FirebaseController.listReport[FirebaseController.indexReport]["details"]["name"]+
                      " | ${
                      DateFormat.yMd().format(FirebaseController.listReport[FirebaseController.indexReport]["date"].toDate())
                  }",
                       // "#1_"+SignInScreen.fullName+"_6-7-2021",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                color: Color(0xFF4d8d6e), //white70,
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                    //  print(FirebaseController.listReport[FirebaseController.indexReport]["email"]);
                      DetailsReport.setReport(FirebaseController.listReport[FirebaseController.indexReport]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dignosisi_report()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 7),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.assignment_ind_outlined,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Diagnosis Result",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
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
                elevation: 7,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                color: Color(0xFF4d8d6e),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Injury_Image()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 7),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.insert_photo_outlined,
                            color: Colors.white, //(0xFF3b6b54),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Injury picture",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
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
                elevation: 7,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                color: Color(0xFF4d8d6e),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ((FirebaseController.listReport[FirebaseController.indexReport]["details"]["type"]=="fracture")&&
                                FirebaseController.listReport[FirebaseController.indexReport]["isVisible"])
                                ?RecoveryPlanScreen2():recovery_Plan())
                          /*,recovery_plan(
                              weberList: DetailsReport.recoveryPlan["WeberA"] as List,
                              weberName: "Weber A",

                            )),*/
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 7),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.description_outlined,
                            color: Colors.white, //(0xFF3b6b54),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Recovery Plan",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
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
                elevation: 7,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                color: Color(0xFF4d8d6e),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => List_of_Xray()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 7),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.microwave_outlined,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "X-ray picture",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
