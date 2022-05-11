// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:_finalproject/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../firebase/user.dart';
import 'main_PagePatient.dart';

class Diagnosis_result extends StatelessWidget {
  Diagnosis_result({Key? key}) : super(key: key);
    
    
  String Fracture =
      "•Don’t weight bearon the injured foot.\n•If there is wound,it must be coveredwith a sterile gauzeor cloth.\n" +
          "•Raise the leg and placeice on the swollen areafor less than 20 minutes.\n•See the doctor promptly.\n" +
          "•evaluate the stabilityof the joint.•inspect the knee joint.\n•Check neurovascularstatus of the limb.\n" +
          "•Pain relievingmedications";

  String Sprain =
      "•Keep the ankle elevated(raised up) above the levelof the heart wheneverpossible, to decrease ankleswelling by lying downand propping the footon pillows.\n" +
          "•Place ice on theswollen area but Icingshould not be appliedfor any longer than20 minutes repeatedevery hour.\n" +
          "•Pain relievingmedications.•Put ACE bandage.\n•See your doctorif the swellingand pain continue.";

  List<String> Symptoms = ['fff', 'ff', ' tks', 'alrf'];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return  Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            //   verticalDirection: VerticalDirection.down,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image.asset('images/p2.png'),

              Row(
                children: const [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Image(
                    image: AssetImage("assets/images/logo.png"),
                    width: 140,
                    height: 140,
                  ),
                  Padding(padding: EdgeInsets.all(20.0)),
                ],
              ),

              Padding(padding: EdgeInsets.all(8.0)),
              Stack(

                children: const [

                  Positioned(
                    child: Text(
                      "Report of the Initial Diagnosis",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                endIndent: 30,
                indent: 30,
              ),

              Wrap(
                direction: Axis.vertical,
                children: [
                  Wrap(

                    direction: Axis.horizontal,
                    children:  [
                      Text(
                        "Username: "+MyUser.USERNAME/*SignInScreen.userName*/,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        "Gender: "+MyUser.GENDER,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Wrap(
                    direction: Axis.horizontal,
                    children:  [
                      Text(
                       "Name: "+ MyUser.FULLNAME,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        "Date: "+formattedDate,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
                endIndent: 30,
                indent: 30,
              ),

              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20)),
                  Text(
                    "Symptoms",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //       Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                ],
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
                endIndent: 30,
                indent: 45,
              ),
              //هنننننننننننننننننا لسته الاعراض
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20)),
                  Container(
                    child: Text(
                      ("--------------------------------------------------\n" +
                          "--------------------------------------------------"),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  //       Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                ],
              ),

              Padding(padding: EdgeInsets.all(10.0)),

              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20)),
                  Text(
                    "Possible injury",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //       Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                ],
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
                endIndent: 30,
                indent: 45,
              ),

              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20)),
                  Text(
                    "--------------------------------------------------\n" +
                        "--------------------------------------------------",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                  //       Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                ],
              ),

              Padding(padding: EdgeInsets.all(10.0)),

              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20)),
                  Text(
                    "Recommendation",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //       Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                ],
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.black,
                endIndent: 30,
                indent: 45,
              ),

              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20)),

                  /*  ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (BuildContext context, i) {
                        return Container(
                          //   padding: EdgeInsets.all(10),
                          child: Column(
                            children: [Text('${names[i]}')],
                          ),
                        );
                      }),*/

                  Text(
                    "--------------------------------------------------\n" +
                        "--------------------------------------------------",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                  //       Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                ],
              ),
              Padding(padding: EdgeInsets.all(15.0)),

              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Icon(
                    Icons.warning_amber_outlined,
                    size: 35,
                  ),
                  Text(
                    "This report is not a final diagnosis. Contact your\n" +
                        " physician or health provider for more information.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                  // Padding(padding: EdgeInsets.all(20.0)),
                ],
              ),

              Padding(padding: EdgeInsets.all(12.0)),

              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 125)),
                  MaterialButton(
                    minWidth: 120.0,
                    color: Color(0xFF4d8d6e),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const main_PagePatient()),
                      );
                    },
                    child: Text(
                      "ok", // quiz.choices[questionNumber][0],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void Dd(List Sum) {
    for (String s in Sum) {
      print(Sum);
    }
    ;
  }
}
/*
                          Symptoms.forEach((element) => Text(element)),

                          for (var i = 0; i < Symptoms.length; i++) {
                            print("object");
                          },
 */