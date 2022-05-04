import 'package:flutter/material.dart';
import '../../firebase/chatting.dart';
import '../../firebase/user.dart';
import 'main_PagePatient.dart';
import 'Message.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class List_of_doctors extends StatefulWidget {
  const List_of_doctors({Key? key}) : super(key: key);
  @override
  _List_of_doctorsState createState() => _List_of_doctorsState();
}

// ignore: camel_case_types
class _List_of_doctorsState extends State<List_of_doctors> {
  final _search = TextEditingController();
  Future<String?> getName({email,typeUser})async{
    return await Chatting.getNameEmail(
        email: email,
        typeUser: typeUser
    );
  }
  @override
  Widget build(BuildContext context) {
    Chatting.PATIENT_EMAIL=MyUser.EMAIL;
    Chatting.EMAIL=MyUser.EMAIL;
    Chatting.PATIENT_NAME=MyUser.FULLNAME;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  ClipPath(
                    child: Container(
                      height: 150,
                      width: 392.7,
                      color: Color(0xFF4d8d6e),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(

                              builder: (context) =>  const main_PagePatient()),
                        );
                      },
                    ),
                  ),
                  const Positioned(
                    top: 30,
                    bottom: 8,
                    left: 60,
                    child: Image(
                      width: 60,
                      height: 60,
                      image: AssetImage('assets/images/doctor.png'),
                    ),
                  ),
                  const Positioned(
                    top: 65,
                    bottom: 8,
                    left: 125,
                    child: Text(
                      'My doctors',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
                      child: TextField(
                        controller: _search,
                        decoration: InputDecoration(
                          hintText: "  Doctor name/username",
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
                        Chatting.name=_search.text.toLowerCase();
                        Chatting.getAdditives();
                        // print("length : "+"${Chatting.listHellper.length}");
                        setState(() {});
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: 500,
              child: FutureBuilder(
                future: Chatting.getAdditives(),
                builder: (context,snapshot){

                if(!snapshot.hasData){
                return Center(
                child: CircularProgressIndicator(),
                );
                }else{
                  return ListView.builder(
                    itemCount: Chatting.listHellper.length,
                    itemBuilder: (_,index){
                      return FutureBuilder(
                          future: getName(
                              email: Chatting.listHellper[index]['doctor_email'],
                              typeUser:"doctor"
                          ),
                          builder: (context,snapshot){
                            if(!snapshot.hasData){
                              return SizedBox();
                            }else{
                              return snapshot.data.toString().toLowerCase().contains(Chatting.name)?
                              doctor('${snapshot.data}',Chatting.listHellper[index]['doctor_email']):
                              SizedBox.fromSize();
                              // return doctor(Chatting.listHellper[index]['patient_email']);
                            }
                          });
                      //  print(
                      //      "NAMMMMMMMEEEE"
                      //          "${  getsss(
                      //          email: Chatting.listHellper[index]['patient_email'],
                      //          typeUser:"patient"
                      //      )}");
                      //  Chatting.PATIENT_EMAIL=Chatting.listHellper[index]['patient_email'];
                      // // print("hhhh"+Chatting.PATIENT_EMAIL!);patient_email
                      //  return doctor("${
                      //      getsss(
                      //          email: Chatting.listHellper[index]['patient_email'],
                      //          typeUser:"patient"
                      //      )
                      //  }");
                    },
                  );

                }
                }
              ),
              )

            ]),
          ),
        ),
      ),
    );
  }

  Widget doctor(String name,String email) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 0, 8, 8),
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const Image(
              width: 40,
              height: 40,
              image: AssetImage('assets/images/doctorBlack.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 200,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            /* const SizedBox(
              width: 10,
            ),*/
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right,
                size: 30.0,
                color: Color(0xFF4d8d6e),
              ),
              onPressed: () {
                Chatting.DOCTOR_EMAIL=email;
                //print(Chatting.PATIENT_EMAIL);
                Chatting.DOCTOR_NAME="${name}";
                Chatting.NAME="${name}";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Message()),
                );
              },
            ),
            /*SizedBox(
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
