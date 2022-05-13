// ignore_for_file: camel_case_types, file_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:_finalproject/screens/patient/Xray_pic.dart';
import 'package:intl/intl.dart';
import '../../const/get_size.dart';
import '../../firebase/firebase.dart';
import 'Each_report.dart';

// Add loop when there is a pic in firebase then generate Card and display the pic in screen
class List_of_Xray extends StatelessWidget {
  const List_of_Xray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Xray Pictures",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getScreenSize(context).width * 0.075
        ),),
      ),
      body:  FutureBuilder(
          future: FirebaseController.fetchReportDoctor(),
          builder: (context, snapShot) {
            if (!snapShot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else{

              return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  //TODO : Set Your List Here Nagel
                  itemCount:  FirebaseController.report["xrayImages"].length,
                  itemBuilder: (_,index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Xray_pic()),
                        );
                      },
                      child: Card(
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
                              FirebaseController.indexXrayImages=index;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Xray_pic()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 7),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.microwave_outlined,
                                    color: Color(0xFF3b6b54),
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "#${(index + 1)}_" +
                                        "${DateFormat.yMd().format(FirebaseController.report["xrayImages"][index]["date"].toDate())}",
                                    //"#1_06-07-2021",
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
                    );
                  }
              );
            }}),
    );
  }
}
