import 'package:_finalproject/report/details_report.dart';
import 'package:_finalproject/reusable_widgets/reusable_widget.dart';
import 'package:_finalproject/screens/patient/main_PagePatient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/doctor/homePageDoctor.dart';
import 'const/get_size.dart';

class RecoveryPlanScreen2 extends StatefulWidget{
  List? weberList;
  String? weberName;
  bool canEdit = false;

  RecoveryPlanScreen2({this.weberList, this.weberName,this.canEdit = false});

  @override
  _RecoveryPlanScreen2State createState() => _RecoveryPlanScreen2State();
}

class _RecoveryPlanScreen2State extends State<RecoveryPlanScreen2> {
  @override
  Widget build(BuildContext context) {
    print(widget.weberList);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: 15.0,),
              GestureDetector(
                onTap: (){
                 Navigator.pushReplacement(context, MaterialPageRoute
                   (builder: (ctx)=>homePageDoctor()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: getScreenSize(context).width * 0.5,
                  height: getScreenSize(context).width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text('Accept',style: TextStyle(
                      color: Colors.white
                  ),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
