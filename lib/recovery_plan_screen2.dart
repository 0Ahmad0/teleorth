import 'package:_finalproject/report/details_report.dart';
import 'package:_finalproject/reusable_widgets/reusable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecoveryPlanScreen2 extends StatefulWidget {
  List? weberList;
  String? weberName;

  RecoveryPlanScreen2({this.weberList, this.weberName});

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
              Column(
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
