import 'dart:async';

import 'package:_finalproject/const/get_size.dart';
import 'package:_finalproject/recovery_plan_screen2.dart';
import 'package:flutter/material.dart';

import 'report/details_report.dart';



class RecoveryPlanScreen1 extends StatefulWidget {
  @override
  State<RecoveryPlanScreen1> createState() => _RecoveryPlanScreen1State();
}

class _RecoveryPlanScreen1State extends State<RecoveryPlanScreen1> {
  String selectWeber = "";
  var c = [];
  bool showGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recovery Plan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
          ),
          child: Column(
            children: [
            /*
              mainLabel(
                text: "Recommendations",
                context: context
              ),
              Divider(
                color: Colors.green,
              ),
              childMainLabel(
                text: "Ankle Fracture",
                context: context
              ),
              Divider(
                color: Colors.green,
              ),
              Text(
                  '${DetailsReport.recommendations["Fracture"]}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1.4,
                  fontSize: getScreenSize(context).width * 0.042
                ),
              ),
              childMainLabel(
                  text: "Ankle Sprain",
                  context: context
              ),
              Divider(
                color: Colors.green,
              ),
              Text(
                '${DetailsReport.recommendations["Sprain"]}',
                textAlign: TextAlign.start,
                style: TextStyle(
                    height: 1.4,
                    fontSize: getScreenSize(context).width * 0.042
                ),
              ),
              Divider(
                color: Colors.green,
                height: getScreenSize(context).width * 0.1,
              ),
              mainLabel(
                  text: "Recovery Plan",
                  context: context
              ),

              childMainLabel(
                  text: "Ankle Fracture",
                  context: context
              ),
              Divider(
                color: Colors.green,
              ),
             */
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select Webar"
                ),
                  items: ["WeberA","WeberB"].map((e) => DropdownMenuItem(
                      child: Text("${e}"),
                    value: e,
                  )).toList(),
                  onChanged: (val){

                  selectWeber = val.toString();
                  print(selectWeber);
                  c = DetailsReport.recoveryPlan[selectWeber] as List;
                  setState(() {
                    print(c);
                    showGrid = true;
                    Timer(Duration(milliseconds: 100), (){
                      showGrid = false;
                      setState(() {

                      });
                    });
                  });
                  }
              ),
              showGrid
                  ?CircularProgressIndicator():Container(
                alignment: Alignment.center,
                height: getScreenSize(context).height / 2,
                padding: EdgeInsets.only(
                    top: 15.0
                ),
                child: selectWeber.trim().isEmpty
                    ?Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularProgressIndicator(),
                    Text("Select Weber Please",style: TextStyle(
                        fontSize: getScreenSize(context).width * 0.06
                    ),),
                  ],
                )
                    :GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: getScreenSize(context).width * 0.22

                    ),
                    itemCount: 8,
                    itemBuilder: (_,index){
                      return Container(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            initialValue: "${c[index]}",
                            onChanged: (val){
                              c[index] = val;
                              print(c);
                              setState(() {

                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ));
                    }
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>
                      RecoveryPlanScreen2(
                    weberList: c,
                        weberName: selectWeber,
                  )));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: getScreenSize(context).width * 0.5,
                  height: getScreenSize(context).width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text('Go>>',style: TextStyle(
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
