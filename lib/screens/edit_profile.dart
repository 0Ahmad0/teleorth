import 'package:_finalproject/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:_finalproject/reusable_widgets/custom_shape.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:_finalproject/screens/signin_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ////////////////////////////
 
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  ClipPath(
                    clipper: Customshape(),
                    child: Container(
                      height: 229,
                      width: 800,
                      color: const Color(0xFF4d8d6e),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  
                   
             
                  const Positioned(
                    bottom: 74,
                    right: 40,
                    left: 30,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 90.0,
                      color: Colors.white,
                    ),
                  ),
                   Positioned(
                    bottom: 55,
                    left: 125,
                    child: Text(
                      SignInScreen.email,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),



            
                  const Positioned(
                    bottom: 40,
                    left: 150,
                    child: Text(
                      'Ahmad0504',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
                Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: const Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: const Text(
                      'Ahmad Khaled',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                 Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      SignInScreen.userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: const Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: const Text(
                      '055-458-8086',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: const Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle:  Text(
                       SignInScreen.gender,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: const Text(
                      'How to use TeleOrtho?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 350.0,
                  height: 10.0,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                    child: const Text(
                      'Change password',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 350.0,
                  height: 10.0,
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        // Firebase sign out function
                        print("Signed Out"); //print to console
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignInScreen())); // when Signed Out clicked go back to Sign In Screen
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.help_outline,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  
  }

}
