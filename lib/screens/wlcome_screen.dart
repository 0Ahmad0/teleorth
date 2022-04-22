import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase/chatting.dart';
import 'login_register_screen.dart';

void main() {
  runApp(const WelcomeScreen());
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Image.asset('images/p2.png'),
                
                const Image(
                  image: AssetImage("assets/images/p2.png"),
                  width: 500.0,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //<Widget>[],
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Chatting.getPatients();
                          /*  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login_Register()));*/
                            isDoctor = true;
                            print(isDoctor);
                          }, // if pressed open Reset password screen
                          child: const Image(
                            image: AssetImage("assets/images/1.PNG"), // doctor
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          /*
 onPressed: () { Navigator.push(
                            
                              context, MaterialPageRoute(builder: (context) =>  const Login_Register())), // if pressed open Reset password screen
                              isDoctor=false;
                            print(isDoctor);
                             },
                          */
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const Login_Register())); // if pressed open Reset password screen
                            isDoctor = false;
                            print(!isDoctor);
                          },
                          child: const Image(
                            image:
                                AssetImage("assets/images/11.PNG"), // patient
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
