// ignore_for_file: camel_case_types, file_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

import 'homePageDoctor.dart';

class help extends StatelessWidget {
  const help({Key? key}) : super(key: key);

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
                                builder: (context) => homePageDoctor()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 40.0),
                    Center(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.help_outline_outlined,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            "Help",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 37.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      " Contact with TeleOrtho:\n help@TeleOrtho.com",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
