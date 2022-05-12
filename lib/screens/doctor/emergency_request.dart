// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, file_names, camel_case_types, sized_box_for_whitespace

// ignore_for_file: prefer_const_constructors_in_immutables, file_names, camel_case_types, duplicate_ignore
// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable
//import 'dart:ui';

import 'package:flutter/material.dart';

import '../../firebase/chatting.dart';
import '../../firebase/firebase.dart';
import 'AllReportOfPatient.dart';
import 'homePageDoctor.dart';

class emergency_request extends StatefulWidget {
  @override
  State<emergency_request> createState() => _emergency_requestState();
}

class _emergency_requestState extends State<emergency_request> {
  String search="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  ClipPath(
                    child: Container(
                      height: 102,
                      width: 392.7,
                      color: Color(0xFF4d8d6e),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const homePageDoctor()),
                        );
                      },
                    ),
                  ),
                  /*  Positioned(
                    bottom: 50,
                    left: 20,
                    child: Image(
                      //width: 20,
                      // height: 20,
                      image: AssetImage('Pictures/patient.png'),
                      width: 10,
                      height: 10,
                    ),
                  ),*/
                  Positioned(
                    bottom: 35,
                    left: 70,
                    child: Text(
                      'Emergency request',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                elevation: 3,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10.0, 12.0, 0, 10),
                        height: 44,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: TextField(
                          onChanged: (val){
                            search=val;
                          },
                          //controller: _search,
                          decoration: InputDecoration(
                            hintText: "  Patient name or username",
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {

                          });
                        },
                        child: Text("Search",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF4d8d6e),
                            )),
                      ),
                      /*ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40)))),
                        child: Text(
                          'Add patient',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        onPressed: () {},
                      ),*/
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
        FutureBuilder(
            future: Chatting.getAdditives(),
                builder: (context,snapShot) {
                if (!snapShot.hasData) {
                return Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox(
                    height: 540,
                    child:
                    ListView.builder(
                      itemCount: Chatting.listHellper.length,
                      itemBuilder: (_,index){
                        return (Chatting.listHellper[index]["tensD"]==Chatting.listHellper[index]["tensP"])?
                              FutureBuilder(
                            future: Chatting.getNameEmail(
                                email: Chatting.listHellper[index]['patient_email'],
                                typeUser:"patient"
                            ),
                            builder: (context,snapshot){
                              if(!snapshot.hasData){
                                return SizedBox();
                              }else{
                                return snapshot.data.toString().toLowerCase().contains(search.toLowerCase())?
                                allreportsP(snapshot.data.toString(),Chatting.listHellper[index]['patient_email'], context)://Chatting.listHellper[index]['patient_email']):
                                SizedBox.fromSize();
                                // return doctor(Chatting.listHellper[index]['patient_email']);
                              }
                            }):
                              SizedBox();

                      },
                    ),
                  );
                }}),
            ]),
          ),
        ),
      );
  }

  Widget allreportsP(String reportID, String email, BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 13),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.grey,
      color: Colors.grey[100], //5FA080 //grey[50]
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outlined,
              color: Colors.red,
              size: 30.0,
            ),
            /* Image(
              width: 30,
              height: 30,
              image: AssetImage('Pictures/patient.png'),
            ),*/
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                // margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  reportID,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
           
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_right_outlined),
              color: Color(0xFF2d5240),
              iconSize: 35,
              onPressed: () {
                FirebaseController.namePatient=reportID;
                FirebaseController.emailPatient=email;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllReportOfPatient()),
                );
                // setState(() {
                //   _isBluetoothOn = !_isBluetoothOn;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}
/*

























import 'package:flutter/material.dart';
import 'custom_shape.dart';
import 'package:main_page/screens/main_PagePatient.dart';

class Edit_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  ClipPath(
                    clipper: Customshape(),
                    child: Container(
                      height: 200,
                      width: 392.7,
                      color: Color(0xFF4d8d6e),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const main_PagePatient()),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 74,
                    right: 35,
                    left: 20,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 90.0,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 128,
                    child: Text(
                      'My profile',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  /*Positioned(
                    bottom: 40,
                    left: 150,
                    child: Text(
                      'Ahmad0504',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),*/
                ]),
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: 
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Ahmad Khaled',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    title: 
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Ahmad0504',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      '055-458-8086',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: buildTextField('Name', 'Ahmad Khaled', false),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: buildTextField('Username', 'Ahmad0504', false),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: buildTextField('E-mail', 'AhmadK@gmailcom', false),
                ),
                Container(
                  width: 350.0,
                  height: 12.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 10.0, 0, 0),
                  child: Text(
                    'Gender',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 50.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
                  child: DropdownButtonFormField(
                    iconDisabledColor: Color(0xFF4d8d6e),
                    decoration: const InputDecoration(
                      isDense: true,
                      //contentPadding: EdgeInsets.all(12),
                      /*enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),*/
                    ),
                    /*hint: const Text("Select your gender",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),*/
                    items: const [
                      DropdownMenuItem(
                        child: Text('Male',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('Female',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '2',
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 12.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 10.0, 0, 0),
                  child: Text(
                    'Language',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 50.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
                  child: DropdownButtonFormField(
                    iconDisabledColor: Color(0xFF4d8d6e),
                    decoration: const InputDecoration(
                      isDense: true,
                      //contentPadding: EdgeInsets.all(12),
                      /*enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),*/
                    ),
                    /*hint: const Text("Select your gender",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),*/
                    items: const [
                      DropdownMenuItem(
                        child: Text('Arabic',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('English',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '2',
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Male',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'How to use TeleOrtho?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),*/
                SizedBox(
                  width: 350.0,
                  height: 15.0,
                  /*child: Divider(
                    color: Colors.grey,
                  ),*/
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                    child: Text(
                      'Change password',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  height: 8.0,
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.help_outline,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        //obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}



/*  Positioned(
                    top: 14,
                    left: 8,
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const main_PagePatient()),
                        );
                      },
                    ),
                  ),*/ 

*/





////////////////////////////////////
///
////*
///
///

/*











import 'package:flutter/material.dart';

import 'main_PagePatient.dart';

class allreportsP {
  String ID;

  allreportsP({
    required this.ID,
  });
}

class allreport_Patient extends StatelessWidget {
  /*List allReport = [
    allreportsP(ID: "#1_LamaKhaled_6-7-2021"),
    allreportsP(ID: "#2_LamaKhaled_15-7-2021"),
    allreportsP(ID: "#3_LamaKhaled_20-7-2021"),
    allreportsP(ID: "#4_LamaKhaled_30-7-2021"),
    allreportsP(ID: "#5_LamaKhaled_3-8-2021"),
    allreportsP(ID: "#6_LamaKhaled_6-8-2021"),
    allreportsP(ID: "#7_LamaKhaled_8-9-2021"),
    allreportsP(ID: "#8_LamaKhaled_16-10-2021"),
  ];*/

  var damageLevel;

  List<String> Gender = [
    "High",
    "Medium",
    "Low",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          elevation: 5,
          leading: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => main_PagePatient()),
              );
            },
          ),
          title: Wrap(
            children: const [
              Icon(
                Icons.person_outline_outlined,
                size: 35,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Ahmad Khaled",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF4d8d6e),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            /*  Container(
                padding: const EdgeInsets.all(20.0),
                color: Color(0xFF4d8d6e),
                child: Row(
                  children: const [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 60.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      "Ahmad Khaled",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),*/
            Material(
              elevation: 3,
              child: Container(
                color: Colors.white,
                // width: 360.0,
                //height: 45.0,
                padding: const EdgeInsets.all(20),
                //   margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                child: TextField(
                  onChanged: (value) {},
                  // controller: editingController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)))),
                ),
              ),
            ),
            //  const SizedBox(height: 10.0),
            const SizedBox(height: 10.0),
            /*   ListView.builder(
                shrinkWrap: true,
                itemCount: allReport.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      color: Color(0xFF61ab87),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(7),
                              child: Column(
                                children: const <Widget>[
                                  Icon(
                                    Icons.description_outlined,
                                    color: Colors.black87,
                                    size: 35.0,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(width: 100, height: 5),
                                  //    const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      allReport[index].ID,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 8, 0, 0),
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(
                                        Icons.keyboard_arrow_right_outlined),
                                    iconSize: 35,
                                    onPressed: () {
                                      // setState(() {
                                      //   _isBluetoothOn = !_isBluetoothOn;
                                      // });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),*/

            Container(
              height: 500,
              child: ListView(scrollDirection: Axis.vertical, children: [
                allreportsP("#1_LamaKhaled_6-7-2021"),
                allreportsP("#2_LamaKhaled_15-7-2021"),
                allreportsP("#3_LamaKhaled_20-7-2021"),
                allreportsP("#4_LamaKhaled_30-7-2021"),
                allreportsP("#5_LamaKhaled_3-8-2021"),
                allreportsP("#6_LamaKhaled_6-8-2021"),
                allreportsP("#7_LamaKhaled_8-9-2021"),
                allreportsP("#8_LamaKhaled_16-10-2021"),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget allreportsP(String reportID) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      shadowColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(
              Icons.description_outlined,
              color: Colors.black87,
              size: 35.0,
            ),
            /* Image(
              width: 30,
              height: 30,
              image: AssetImage('Pictures/patient.png'),
            ),*/
            SizedBox(
              width: 30,
            ),
            Container(
              width: 150,
              child: Text(
                reportID,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            SizedBox(
              height: 35,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)))),
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/