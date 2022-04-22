// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable
//import 'dart:ui';

import 'package:_finalproject/firebase/chatting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myPatient.dart';

class AddPatient extends StatefulWidget {
  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Chatting.DOCTOR_EMAIL="doctor@gmail.com";
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patient',style: TextStyle(
          fontSize: 40
        ),),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[50],
      body: FutureBuilder(
        future: Chatting.getPatients(),
        builder: (context,snapShot){
          if(!snapShot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{

            print(Chatting.listHellper.length);
            return Column(children: [


              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(8.0, 10.0, 0, 10),
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: _search,
                        decoration: InputDecoration(
                          hintText: "  Patient name",
                          hintStyle:
                          TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    TextButton(
                      onPressed: () {
                        //Chatting.listHellper.clear();
                        Chatting.userName=_search.text.toLowerCase();
                        Chatting.getPatients();
                        setState(() {
                        });
                      },
                      child: Text("Search",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF4d8d6e),
                          )),
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
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: Chatting.listHellper.length,
                    itemBuilder: (_,index){
                      Chatting.PATIENT_EMAIL=Chatting.listHellper[index]['email'];
                      return patient(
                          name: '${
                              Chatting.listHellper[index]['displayName']
                          }',
                          email: '${
                              Chatting.listHellper[index]['email']
                          }',

                      );
                    }
                ),
              ),
            ]);
          }
        },
      ),
    );
  }

  Widget patient({name,email,isAdd =false}) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      shadowColor: Colors.grey,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(20),
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
                Expanded(
                  child: FutureBuilder(
                  future: Chatting.getPatient(),
                  builder: (context,snapshat2){
                    // print("${Chatting.PATIENT_EMAIL}"+"${snapshat2.data}");
                    if(!snapshat2.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else{
                      return (snapshat2.data ==true)
                          ?Icon(Icons.check)
                          :ElevatedButton(
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
                        onPressed: () {
                          // print("${
                          // email
                          // }");
                          Chatting.PATIENT_EMAIL = email;
                          Chatting.addPatient();
                          setState(() {

                          });
                        },
                      );
                    }
                  },
              ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
