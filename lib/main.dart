import 'package:_finalproject/screens/doctor/AddPatient.dart';
import 'package:_finalproject/screens/doctor/Message.dart';
import 'package:_finalproject/screens/doctor/Mypatients.dart';
import 'package:_finalproject/screens/doctor/myPatient.dart';
import 'package:_finalproject/screens/patient/main_PagePatient.dart';
import 'package:_finalproject/temp/temp.dart';
import 'package:_finalproject/temp/temp2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:_finalproject/screens/wlcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'Screens/doctor/Myprofile.dart';
import 'Screens/doctor/homePageDoctor.dart';
import 'const/pattel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // initialize firebase
  await Firebase.initializeApp(); 
  runApp(MyApp());
}                                       

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    primarySwatch: Palette.kToDark,
      ),
      home: WelcomeScreen(),//const Message(), // when the app run , welcomeScreen is the home page
    );
  }
}
