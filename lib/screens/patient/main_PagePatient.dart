// ignore_for_file: file_names, prefer_const_constructors, camel_case_types, avoid_print, deprecated_member_use, unused_element

import 'package:_finalproject/firebase/user.dart';
import 'package:_finalproject/report/Report.dart';
import 'package:_finalproject/screens/patient/List_of_doctors.dart';
import 'package:_finalproject/screens/patient/recovery_Plan_Summary.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'Edit_Profile.dart';
//import 'Upload_injury.dart';
import 'Upload_injury.dart';
import 'allreport_Patient.dart';
//import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class main_PagePatient extends StatefulWidget {
  const main_PagePatient({Key? key}) : super(key: key);

  @override
  State<main_PagePatient> createState() => _main_PagePatientState();
}

class _main_PagePatientState extends State<main_PagePatient> {
  bool _isActive = false;

  void _onChanged(bool value) {
    setState(() {
      _isActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          //     verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.start,
          //      crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image.asset('images/p2.png'),

            Card(
              margin: EdgeInsets.all(15.0),
              // padding: EdgeInsets.all(10.0),
              color: Color(0xFF4d8d6e),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 55.0,
                ),
                title: Text(
                  MyUser.FULLNAME,
                  //SignInScreen.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  MyUser.USERNAME,
                  //SignInScreen.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),

            Stack(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned(
                  left: 20,
                  top: 15,
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Positioned(
                  left: 285,
                  top: 20,
                  child: Text('TENS',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
                SwitchListTile(
                  activeColor: Colors.green,
                  activeTrackColor: Colors.grey[400],
                  inactiveThumbColor: Colors.red,
                  // secondary: const Icon(Icons.home),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
              ],
            ),

            /* Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  child: SwitchListTile(
                    title: Text('TENS',
                        style: TextStyle(color: Colors.black, fontSize: 12)),

                    activeColor: Colors.green,

                    activeTrackColor: Colors.grey[400],

                    inactiveThumbColor: Colors.red,

                    // secondary: const Icon(Icons.home),

                    controlAffinity: ListTileControlAffinity.trailing,

                    value: _isActive,

                    onChanged: (value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Summary",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),*/

            /*     Container(
              color: Colors.yellow,
              margin: EdgeInsets.symmetric(horizontal: 120),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: SwitchListTile(
                  title: Text('TENS',
                      style: TextStyle(color: Colors.black, fontSize: 12)),

                  activeColor: Colors.green,

                  activeTrackColor: Colors.grey[400],

                  inactiveThumbColor: Colors.red,

                  // secondary: const Icon(Icons.home),

                  controlAffinity: ListTileControlAffinity.trailing,

                  value: _isActive,

                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
              ),
            ),*/

            /*  Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),*/
            //SizedBox(width: 8),

            Wrap(
              direction: Axis.vertical,
              children: [
                /*      Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Switch(
                          value: _isActive,
                          onChanged: (bool value) {
                            _onChanged(value);
                          }),
                      SwitchListTile(
                          title: Text('Click me'),
                          activeColor: Colors.red,
                          secondary: const Icon(Icons.home),
                          value: _isActive,
                          onChanged: (bool value) {
                            _onChanged(value);
                          })
                    ],
                  ),
                ),*/

                //  SizedBox(width: 5.0),
                /*  Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  //      padding: EdgeInsets.all(9),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                ),*/
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF4d8d6e)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // color: Colors.yellow,

                  //  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(9),
                  width: 360,
                  child: Wrap(
                    direction: Axis.vertical,
                    //  spacing: 5.0,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        // spacing: 5,
                        children: [
                          Icon(
                            Icons.restore_outlined,
                            color: Color(0xFF4d8d6e),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            "Phase1: Week 2",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          InkWell(
                            child: Icon(
                              Icons.description_outlined,
                              color: Color(0xFF4d8d6e),
                              size: 30.0,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => recovery_Plan_Summary()),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        //    spacing: 5,
                        children: const [
                          Icon(
                            Icons.developer_board_outlined,
                            color: Color(0xFF4d8d6e),
                            size: 27.0,
                          ),
                          SizedBox(
                            width: 13.0,
                          ),
                          Text(
                            "TENS intensity: 15 Hz",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            /*       Container(
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0), color: Color(0xFF4d8d6e)),
                child: Column(
                  children: <Widget>[
                    Card(
                      //     margin: EdgeInsets.all(15.0),
                      // padding: EdgeInsets.all(10.0),
                      color: Color(0xFF4d8d6e),
                      child: ListTile(
                        leading: Icon(
                          Icons.restore_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        title: Text(
                          "Ahmad Khaled",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        /*    subtitle: Text(
                        "Ahmad0504",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),*/
                      ),
                    ),
                    Card(
                      // margin: EdgeInsets.all(15.0),
                      // padding: EdgeInsets.all(10.0),
                      color: Color(0xFF4d8d6e),
                      child: ListTile(
                        leading: Icon(
                          Icons.restore_outlined,
                          color: Colors.white,
                          size: 55.0,
                        ),
                        title: Text(
                          "Ahmad Khaled",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        /* subtitle: Text(
                        "Ahmad0504",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),*/
                      ),
                    ),
                  ],
                ),
              ),
*/

            InkWell(
              child: Image(
                image: AssetImage("assets/images/initial diag.png"),
                width: 300,
                height: 125,
              ),
              onTap: () {
                ShowAlertDialog(context);
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Upload_injury()),
                );*/
              },
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              child: Image(
                image: AssetImage("assets/images/My report.png"),
                width: 300,
                height: 125,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => allreport_Patient()),
                );
              },
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              child: Image(
                image: AssetImage("assets/images/my profile.png"),
                width: 300,
                height: 125,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit_Profile()),
                );
              },
            ),
            /* SizedBox(
              height: 5,
            ),*/
            /*  Container(
                //       margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      print("fffff");
                    },
                    child: Image(
                      image: AssetImage("images/initial diag.png"),
                      width: 300,
                    ),
                  ),
                ),
              ),
*/
            /*  Container(
                //         margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      print("fffff");
                    },
                    child: Image(
                      image: AssetImage("images/my report.png"),
                      width: 300,
                    ),
                  ),
                ),
              ),
*/
            /*  Container(
                //        margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      print("fffff");
                    },
                    child: Image(
                      image: AssetImage("images/my profile.png"),
                      width: 300,
                    ),
                  ),
                ),
              ),
*/
            ListTile(
              trailing: Expanded(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => List_of_doctors()),
                    );
                  },
                  child: Image(
                    image: AssetImage("assets/images/Message.png"),
                    height: 300,
                  ),
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }

  void ShowAlertDialog(BuildContext context) {
    Widget cancle = FlatButton(
      child: Text("Cancle"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget ok = FlatButton(
      onPressed: () {
        //===============================================//
        SReport.report=Report();
        //===============================================//
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Upload_injury()),
        );
      },
      child: Text("Ok"),
    );

    AlertDialog alert = AlertDialog(
      title: Icon(Icons.person, size: 50),
      content: Text(
        " This diagnosis is tentative and... Take picture of the injury, upload it and then start the diagnosis",
        overflow: TextOverflow.ellipsis,
        maxLines: 5,
      ),
      actions: [cancle, ok],
    );

    showDialog(
        context: context,
        builder: (BuildContext buildercontex) {
          return alert;
        });
  }
}
