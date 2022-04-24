// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, avoid_unnecessary_containers, camel_case_types

import 'package:_finalproject/firebase/user.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'List_Of_Patient.dart';
import 'emergency_request.dart';

import 'Mypatients.dart';
import 'Myprofile.dart';
import 'help.dart';
import 'myPatient.dart';

class homePageDoctor extends StatelessWidget {
  const homePageDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child :Column(
          //      verticalDirection: VerticalDirection.down,
          //      mainAxisAlignment: MainAxisAlignment.start,
          //      crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image.asset('images/p2.png'),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(15.0),
              // padding: EdgeInsets.all(10.0),
              color: Color(0xFF4d8d6e),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 60.0,
                ),
                title: Text(
                  MyUser.FULLNAME,
                  //SignInScreen.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(
                  MyUser.USERNAME,
                  //SignInScreen.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            /*  Container(
                //  margin: EdgeInsets.all(9.0),
                // padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      print("fffff");
                    },
                    child: Image(
                      image: AssetImage("images/my profile d.png"),
                      width: 290.0,
                    ),
                  ),
                ),
              ),*/

            InkWell(
              child: Image(
                image: AssetImage("assets/images/my_profile.PNG"),
                width: 300.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Myprofile()),
                );
              },
            ),

            SizedBox(
              height: 5.0,
            ),

            InkWell(
              child: Image(
                image: AssetImage("assets/images/my_patients.PNG"),
                width: 300.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => myPatient()),
                );
              },
            ),

            SizedBox(
              height: 5.0,
            ),

            InkWell(
              //  borderRadius: BorderRadius.circular(30),
              child: Image(
                image: AssetImage("assets/images/emergency_request.PNG"),
                width: 300.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => emergency_request()),
                );
              },
            ),

            SizedBox(
              height: 5.0,
            ),

            InkWell(
              //  borderRadius: BorderRadius.circular(30),
              child: Image(
                image: AssetImage("assets/images/msg.PNG"),
                width: 300.0,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => List_Of_Patient()),
                );
              },
            ),
            /*  Container(
                //    margin: EdgeInsets.symmetric(horizontal: .0),
                // padding: EdgeInsets.symmetric(horizontal: 40),
                color: Colors.white,
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      print("fffff");
                    },
                    child: Image(
                      image: AssetImage("images/msg d.png"),
                      width: 290.0,
                    ),
                  ),
                ),
              ),
*/
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => help()),
                      );
                    },
                    child: Icon(
                      Icons.help,
                      color: Color(0xFF4d8d6e),
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
