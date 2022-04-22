// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable
//import 'dart:ui';

import 'package:flutter/material.dart';

import '../../firebase/chatting.dart';
import 'AllReportOfPatient.dart';
import 'homePageDoctor.dart';
import 'myPatient.dart';

class Mypatients extends StatefulWidget {
  @override
  State<Mypatients> createState() => _MypatientsState();
}

class _MypatientsState extends State<Mypatients> {
  final _search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Chatting.DOCTOR_EMAIL="doctor@gmail.com";
    return Scaffold(
      appBar: AppBar(
        title: Text('My Patient',style: TextStyle(
          fontSize: 25
        )),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[50],
      body:   FutureBuilder(
        future: Chatting.getPatients1(),
        builder: (context,snapShot){
          if(!snapShot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{

            print(Chatting.listHellper.length);
            return Column(children: [

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _search,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              Chatting.name=_search.text.toLowerCase();
                              Chatting.getPatients();
                              setState(() {
                              });
                            },
                            icon: Icon(Icons.search),
                          ),
                          hintText: "Patient name",
                          border: OutlineInputBorder(),
                          hintStyle:
                          TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                      ),
                    ),
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child:
                  ListView.builder(
                    itemCount: Chatting.listHellper.length,
                    itemBuilder: (_,index){
                      Chatting.PATIENT_EMAIL=Chatting.listHellper[index]['email'];
                      return patient("${
                          Chatting.listHellper[index]['displayName']
                      }", context);

                    },


                  )
              )

              ,
            ]);
          }
        },
      ),
    );
  }

  Widget patient(String name, BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      shadowColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        child: Row(
          children: [
            Image(
              width: 30,
              height: 30,
              image: AssetImage('assets/images/patient.png'),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 150,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              width: 60,
            ),
            SizedBox(
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right_outlined),
                color: Color(0xFF2d5240),
                iconSize: 35,
                onPressed: () {
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
            ),

            /*  SizedBox(
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
            ),*/
          ],
        ),
      ),
    );
  }
}
