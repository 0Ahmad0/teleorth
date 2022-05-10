// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ui';

import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../const/get_size.dart';
import '../doctor/homePageDoctor.dart';
import 'Each_report.dart';
import 'package:_finalproject/report/details_report.dart';
import 'package:_finalproject/reusable_widgets/reusable_widget.dart';
import 'package:_finalproject/screens/patient/main_PagePatient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class recovery_plan extends StatefulWidget {
  List? weberList;
  String? weberName;
  bool canEdit = true;
  recovery_plan({
    this.weberList,
    this.weberName,
    this.canEdit=true
});

  @override
  State<recovery_plan> createState() => _recovery_planState();
}

class _recovery_planState extends State<recovery_plan> {
  String Fracture =
      "•Don’t weight bearon the injured foot.\n\n•If there is wound,it must be coveredwith a sterile gauzeor cloth.\n\n" +
          "•Raise the leg and placeice on the swollen areafor less than 20 minutes.\n\n•See the doctor promptly.\n\n" +
          "•evaluate the stabilityof the joint.•inspect the knee joint.\n\n•Check neurovascularstatus of the limb.\n\n" +
          "•Pain relievingmedications";

  String Sprain =
      "•Keep the ankle elevated(raised up) above the levelof the heart wheneverpossible, to decrease ankleswelling by lying downand propping the footon pillows.\n\n" +
          "•Place ice on theswollen area but Icingshould not be appliedfor any longer than20 minutes repeatedevery hour.\n\n" +
          "•Pain relievingmedications.•Put ACE bandage.\n\n•See your doctorif the swellingand pain continue.";

  List<String> Symptoms = ['fff', 'ff', ' tks', 'alrf'];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                //   verticalDirection: VerticalDirection.down,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Image.asset('images/p2.png'),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Positioned(
                        top: 10,
                        left: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 35.0,
                            color: Color(0xFF4d8d6e),
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
                      //   Padding(padding: EdgeInsets.all(8))
                    ],
                  ),
                  SizedBox(height: 3),
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
                          "The recovery plan",
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
                            "Username: ${FirebaseController.listReport[FirebaseController.indexReport]["userName"]}",//+SignInScreen.userName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(width: 70),
                          Text(
                            "Gender: ${FirebaseController.listReport[FirebaseController.indexReport]["details"]["gender"]}",
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
                            "Name: ${FirebaseController.listReport[FirebaseController.indexReport]["details"]["name"]}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(width: 70),
                          Text(
                            "Date: ${DateFormat.yMd().format(FirebaseController.listReport[FirebaseController.indexReport]["date"].toDate())}",
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0
                    ),
                    child: Column(
                      children: [
                        Row(
                          children:
                          List.generate(5, (index) =>
                              Expanded(
                                flex: index == 0 ? 3 : 2,
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black)
                                    ),
                                    child: Text("${
                                        index == 0
                                            ? "Type/Phase"
                                            : index
                                    }")),
                              )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Text("${  widget.weberName  }"),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Row(
                                  children:
                                  List.generate(
                                      8,
                                          (index) =>
                                      index.isEven? Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(""
                                                  "${widget.weberList![index]}"
                                                  " - "
                                                  "${widget.weberList![index+1]}"),
                                            ],
                                          )
                                          ,),
                                      ):SizedBox())

                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black
                                  )
                              ),
                              child: Text('Phase'),
                            )),
                            Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Recovery Plan'),
                                )),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              4,
                                  (index) {
                                List revPlan = DetailsReport.recoveryPlan["Phases"] as List;
                                return Row(
                                  children: [
                                    Expanded(child: CircleAvatar(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(10.0),
                                        child: Text("${index+1}"),
                                      ),
                                    )),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: TextFormField(
                                            readOnly: widget.canEdit,
                                            onChanged: (val){},
                                            style: TextStyle(
                                                fontSize: 14
                                            ),
                                            initialValue: '${
                                                revPlan[index]
                                            }',
                                            minLines: 1,
                                            maxLines: 10,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        )),
                                  ],
                                );
                              }
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        mainLabel(
                            text: "Stage 1 Exercises & Advice.",
                            context: context
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Exercises'),
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Explanation'),
                                )),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              3,
                                  (index) {
                                List stage1 = DetailsReport.recoveryPlan["Stages"] as List;
                                List ex1 = stage1[0]["Exercises"];
                                List img1 = stage1[0]["Explanation"];
                                return Row(
                                  children: [
                                    Expanded(child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                            )
                                        ),
                                        child: TextFormField(
                                          readOnly: widget.canEdit,
                                          onChanged: (val){},
                                          style: TextStyle(
                                              fontSize: 14
                                          ),
                                          initialValue: '${
                                              ex1[index]
                                          }',
                                          minLines: 1,
                                          maxLines: 10,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        )
                                    )),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                            ),
                                            child:img1[index] == null?SizedBox()
                                                : Image.asset(
                                              "${
                                                  img1[index]
                                              }",
                                            )
                                        )),
                                  ],
                                );
                              }
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        childMainLabel(
                            text: "Advice",
                            context: context
                        ),
                        TextFormField( readOnly: widget.canEdit,
                          maxLines: 20,
                          initialValue: "${
                              DetailsReport.recoveryPlan['Advice']
                          }",
                          onChanged: (val){},
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        mainLabel(
                            text: "Stage 2 Exercises (3-4 times a day) ",
                            context: context
                        ),
                        childMainLabel(
                            text: "Ankle Stretches",
                            context: context
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Exercises'),
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Explanation'),
                                )),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              2,
                                  (index) {
                                List stage2 = DetailsReport.recoveryPlan["Stages"] as List;
                                List ex2 = stage2[1]["Exercises"];
                                List img2 = stage2[1]["Explanation"];
                                return Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black
                                                )
                                            ),
                                            child: TextFormField(
                                              readOnly: widget.canEdit,
                                              onChanged: (val){},
                                              style: TextStyle(
                                                  fontSize: 14
                                              ),
                                              initialValue: '${
                                                  ex2[index]
                                              }',
                                              minLines: 1,
                                              maxLines: 12,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                            )
                                        )),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                            ),
                                            child:img2[index] == null?SizedBox()
                                                : Image.asset(
                                              "${
                                                  img2[index]
                                              }",
                                            )
                                        )),
                                  ],
                                );
                              }
                          ),
                        ),
                        Divider(
                          color: Colors.green,
                        ),
                        childMainLabel(
                            text: "Balance Exercises",
                            context: context
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Exercises'),
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Explanation'),
                                )),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              2,
                                  (index) {
                                List balance = DetailsReport.recoveryPlan["BalanceExercises"] as List;
                                return Row(
                                  children: [
                                    Expanded(child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                            )
                                        ),
                                        child: TextFormField(
                                          readOnly: widget.canEdit,
                                          onChanged: (val){},
                                          style: TextStyle(
                                              fontSize: 14
                                          ),
                                          initialValue: '${
                                              balance[index]["text"]
                                          }',
                                          minLines: 1,
                                          maxLines: 25,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        )
                                    )),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                            ),
                                            child:Image.asset(
                                              "${
                                                  balance[index]["image"]
                                              }",
                                            )
                                        )),
                                  ],
                                );
                              }
                          ),
                        ),
                        Divider(
                          color: Colors.green,
                        ),
                        SizedBox(height: 15.0,),
                        childMainLabel(
                            text: "Heel Raises",
                            context: context
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                readOnly: widget.canEdit,
                                minLines: 3,
                                maxLines: 5,
                                initialValue: "${
                                    DetailsReport.recoveryPlan['Heel Raises']
                                }",
                                onChanged: (val){},
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()
                                ),
                              ),
                            ),
                            Expanded(child: Image.asset('assets/images/recoveryImages/h1R1.png'))
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        mainLabel(
                            text: "Stage 3 Exercises (3-4 times a day) ",
                            context: context
                        ),
                        Text("These are optional advanced exercises designed for sports rehabilitation.",style: TextStyle(
                            fontSize: getScreenSize(context).width * 0.04
                        ),),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Exercises'),
                                )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: Text('Explanation'),
                                )),
                          ],
                        ),
                        Column(
                          children: List.generate(
                              2,
                                  (index) {
                                List stage3 = DetailsReport.recoveryPlan["Stages"] as List;
                                List ex3 = stage3[2]["Exercises"];
                                List img3 = stage3[2]["Explanation"];
                                return Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black
                                                )
                                            ),
                                            child: TextFormField(
                                              readOnly: widget.canEdit,
                                              onChanged: (val){},
                                              style: TextStyle(
                                                  fontSize: 14
                                              ),
                                              initialValue: '${
                                                  ex3[index]
                                              }',
                                              minLines: 15,
                                              maxLines: 25,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                            )
                                        )),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                            ),
                                            child:img3[index] == null?SizedBox()
                                                : Image.asset(
                                              "${
                                                  img3[index]
                                              }",
                                            )
                                        )),
                                  ],
                                );
                              }
                          ),
                        ),
                        ///Accept button
                        // SizedBox(height: 15.0,),
                        // GestureDetector(
                        //   onTap: (){
                        //     Navigator.pushReplacement(context, MaterialPageRoute
                        //       (builder: (ctx)=>homePageDoctor()));
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     width: getScreenSize(context).width * 0.5,
                        //     height: getScreenSize(context).width * 0.15,
                        //     decoration: BoxDecoration(
                        //       color: Colors.black,
                        //       borderRadius: BorderRadius.circular(50.0),
                        //     ),
                        //     child: Text('Accept',style: TextStyle(
                        //         color: Colors.white
                        //     ),),
                        //   ),
                        // )

                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
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