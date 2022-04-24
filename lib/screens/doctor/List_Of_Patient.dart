import 'package:_finalproject/firebase/user.dart';
import 'package:flutter/material.dart';
import '../../firebase/chatting.dart';
import 'Message.dart';
import 'homePageDoctor.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class List_Of_Patient extends StatefulWidget {
  const List_Of_Patient({Key? key}) : super(key: key);
  @override
  _List_of_dotorsState createState() => _List_of_dotorsState();
}

// ignore: camel_case_types
class _List_of_dotorsState extends State<List_Of_Patient> {
  final _search = TextEditingController();
  Future<String?> getName({email,typeUser})async{
    return await Chatting.getNameEmail(
      email: email,
      typeUser: typeUser
    );
  }



  @override
  Widget build(BuildContext context) {
    // Chatting.DOCTOR_EMAIL="doctor@gmail.com";
    Chatting.DOCTOR_EMAIL=MyUser.EMAIL;
    Chatting.EMAIL=MyUser.EMAIL;
    Chatting.DOCTOR_NAME=MyUser.FULLNAME;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(children: [
        Stack(
          children: [
            ClipPath(
              child: Container(
                height: 150,
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
                        builder: (context) => homePageDoctor()),
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
                image: AssetImage('assets/images/patient.png'),
                color: Colors.white,
              ),
            ),
            const Positioned(
              top: 65,
              bottom: 8,
              left: 125,
              child: Text(
                'My patients',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                //  controller: _search,
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: "  Patient name/username",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        Chatting.name=_search.text.toLowerCase();
                        Chatting.getAdditives();
                       // print("length : "+"${Chatting.listHellper.length}");
                        setState(() {});
                      },
                      icon: Icon(Icons.search),
                    ),
                    hintStyle:
                    TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 6,
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
    child: FutureBuilder(
      future: Chatting.getAdditives(),
      builder: (context,snapshot){

        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          //print(Chatting.listHellper.length);
          return ListView.builder(
            itemCount: Chatting.listHellper.length,
            itemBuilder: (_,index){
              return FutureBuilder(
                future: getName(
                            email: Chatting.listHellper[index]['patient_email'],
                            typeUser:"patient"
                  ),
                  builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return SizedBox();
                  }else{
                    return snapshot.data.toString().contains(Chatting.name)?
                        doctor('${snapshot.data}',Chatting.listHellper[index]['patient_email']):
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
      },
    )
        ),
      ]),
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
              image: AssetImage('assets/images/patient.png'),
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
                Chatting.PATIENT_EMAIL=email;
                //print(Chatting.PATIENT_EMAIL);
                Chatting.PATIENT_NAME="${name}";
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
