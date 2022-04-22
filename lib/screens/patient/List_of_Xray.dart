// ignore_for_file: camel_case_types, file_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:_finalproject/screens/patient/Xray_pic.dart';
import 'Each_report.dart';

// Add loop when there is a pic in firebase then generate Card and display the pic in screen
class List_of_Xray extends StatelessWidget {
  const List_of_Xray({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: Column(
            children: <Widget>[
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Each_report()),
                          );
                        },
                      ),
                    ),
                    const Positioned(
                      top: 65,
                      bottom: 8,
                      left: 125,
                      child: Text(
                        '   My Xray Pictures',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
                        MaterialPageRoute(builder: (context) => Xray_pic()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 7),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.microwave_outlined,
                            color: Color(0xFF3b6b54),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "#1_06-07-2021",
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
            ],
          ),
        ),
      ),
    );
  }
}
