// ignore_for_file: prefer_const_constructors_in_immutables, file_names, camel_case_types, duplicate_ignore
// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable
//import 'dart:ui';

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable
import 'package:_finalproject/firebase/user.dart';
import 'package:_finalproject/screens/reset_password.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:_finalproject/screens/wlcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'custom_shape.dart';
import 'help.dart';
import 'main_PagePatient.dart';

class Edit_Profile extends StatefulWidget {
  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  String? fullName="",gender="",email="";

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child:SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                ClipPath(
                  clipper: Customshape(),
                  child: Container(
                    height: 200,
                    width: 392.7,
                    color: Color(0xFF4d8d6e),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const main_PagePatient()),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 74,
                  right: 35,
                  left: 20,
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 90.0,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 128,
                  child: Text(
                    MyUser.FULLNAME,
                    //SignInScreen.fullName,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                /*Positioned(
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
                  ),*/
              ]),
              /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title:
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Ahmad Khaled',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
              /*Card(
                  elevation: 0,
                  child: ListTile(
                    title:
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Ahmad0504',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
              /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      '055-458-8086',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: buildTextField('Name', MyUser.FULLNAME/*SignInScreen.fullName*/, false),
              ),
              Container(
                width: 350.0,
                height: 14.0,
                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 20.0,
                margin: const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 8.0),
                child: Text(
                  MyUser.USERNAME,
                  //SignInScreen.userName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                width: 350.0,
                height: 14.0,
                child: Divider(
                  thickness: 1.3,
                  color: Colors.grey[400],
                ),
              ),

              Container(
                width: 350.0,
                height: 14.0,
                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 20.0,
                margin: const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 8.0),
                child: Text(
                  MyUser.EMAIL,
                  //SignInScreen.gender,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                width: 350.0,
                height: 1.0,
                child: Divider(
                  thickness: 1.3,
                  color: Colors.grey[400],
                ),
              ),


              Container(
                width: 350.0,
                height: 14.0,
                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 18.0,
                margin: const EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 8.0),
                child: Text(
                  MyUser.GENDER,
                  //SignInScreen.gender,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                width: 350.0,
                height: 1.0,
                child: Divider(
                  thickness: 1.3,
                  color: Colors.grey[400],
                ),
              ),




              // Container(
              //   width: 350.0,
              //   height: 50.0,
              //   margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
              //   child: DropdownButtonFormField(
              //     iconDisabledColor: Color(0xFF4d8d6e),
              //     decoration: const InputDecoration(
              //       isDense: true,
              //       contentPadding: EdgeInsets.all(12),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //         borderSide: BorderSide(
              //           color: Colors.grey,
              //         ),
              //       ),
              //     ),
              //     hint: const Text("Select your gender",
              //         style: TextStyle(
              //           fontSize: 16.0,
              //           color: Colors.black,
              //         )),
              //     items: const [
              //       DropdownMenuItem(
              //         child: Text('Male',
              //             style: TextStyle(
              //               fontSize: 16.0,
              //               color: Colors.black,
              //             )),
              //         value: '1',
              //       ),
              //       DropdownMenuItem(
              //         child: Text('Female',
              //             style: TextStyle(
              //               fontSize: 16.0,
              //               color: Colors.black,
              //             )),
              //         value: '2',
              //       ),
              //     ],
              //     onChanged: (_) {},
              //   ),
              // ),
              Container(
                width: 350.0,
                height: 14.0,
                margin: const EdgeInsets.fromLTRB(4.0, 10.0, 0, 0),
                child: Text(
                  'Language',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Container(
                width: 350.0,
                height: 50.0,
                margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
                child: DropdownButtonFormField(
                  iconDisabledColor: Color(0xFF4d8d6e),
                  decoration: const InputDecoration(
                    isDense: true,
                    //contentPadding: EdgeInsets.all(12),
                    /*enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),*/
                  ),
                  /*hint: const Text("Select your gender",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),*/
                  items: const [
                    DropdownMenuItem(
                      child: Text('Arabic',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                      value: '1',
                    ),
                    DropdownMenuItem(
                      child: Text('English',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                      value: '2',
                    ),
                  ],
                  onChanged: (_) {},
                ),
              ),
              /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Male',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
              /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'How to use TeleOrtho?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),*/
              SizedBox(
                width: 350.0,
                height: 15.0,
                /*child: Divider(
                    color: Colors.grey,
                  ),*/
              ),
              SizedBox(
                width: 320,
                height: 45,
                child: OutlinedButton(
                  style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)))),
                  child: Text(
                    'Update & Save',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showSpinner=true;
                    });
                    _updateUser();
                  },
                ),
              ),
              SizedBox(
                width: 350.0,
                height: 8.0,
              ),
              SizedBox(
                width: 320,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)))),
                  child: Text(
                    'Reset Password',
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
                              builder: (context) => const ResetPassword()));

                      // when Signed Out clicked go back to Sign In Screen
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.help_outline,
                      size: 30.0,
                      color: Color(0xFF4d8d6e),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => help()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.login,
                      size: 30.0,
                      color: Color(0xFF4d8d6e),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        // Firebase sign out function
                        print("Signed Out"); //print to console
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const WelcomeScreen())); // when Signed Out clicked go back to Sign In Screen
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        onChanged:(value){
          if(labelText=="Name")fullName=value;
          else if(labelText=="gender") gender=value;
          else if(labelText=="E-mail")email=value;
        },
        //obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  _updateUser() async {
    (fullName=="")?fullName=MyUser.FULLNAME:"";
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection("${MyUser.TYPEUSER}").doc(MyUser.ID).update({
      "displayName":fullName,
    }).then((value){
      MyUser.FULLNAME=fullName!;
      print("done update");
      setState(() {
        showSpinner=false;
      });
      return true;
    });
    return false;
  }
}

/*

























import 'package:flutter/material.dart';
import 'custom_shape.dart';
import 'package:main_page/screens/main_PagePatient.dart';

class Edit_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  ClipPath(
                    clipper: Customshape(),
                    child: Container(
                      height: 200,
                      width: 392.7,
                      color: Color(0xFF4d8d6e),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
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
                              builder: (context) => const main_PagePatient()),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 74,
                    right: 35,
                    left: 20,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 90.0,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 128,
                    child: Text(
                      'My profile',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  /*Positioned(
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
                  ),*/
                ]),
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: 
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Ahmad Khaled',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    title: 
                    Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Ahmad0504',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'Phone Number',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      '055-458-8086',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: buildTextField('Name', 'Ahmad Khaled', false),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: buildTextField('Username', 'Ahmad0504', false),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: buildTextField('E-mail', 'AhmadK@gmailcom', false),
                ),
                Container(
                  width: 350.0,
                  height: 12.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 10.0, 0, 0),
                  child: Text(
                    'Gender',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 50.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
                  child: DropdownButtonFormField(
                    iconDisabledColor: Color(0xFF4d8d6e),
                    decoration: const InputDecoration(
                      isDense: true,
                      //contentPadding: EdgeInsets.all(12),
                      /*enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),*/
                    ),
                    /*hint: const Text("Select your gender",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),*/
                    items: const [
                      DropdownMenuItem(
                        child: Text('Male',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('Female',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '2',
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 12.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 10.0, 0, 0),
                  child: Text(
                    'Language',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  width: 350.0,
                  height: 50.0,
                  margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
                  child: DropdownButtonFormField(
                    iconDisabledColor: Color(0xFF4d8d6e),
                    decoration: const InputDecoration(
                      isDense: true,
                      //contentPadding: EdgeInsets.all(12),
                      /*enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),*/
                    ),
                    /*hint: const Text("Select your gender",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),*/
                    items: const [
                      DropdownMenuItem(
                        child: Text('Arabic',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text('English',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                        value: '2',
                      ),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      'Male',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),*/
                /*Card(
                  elevation: 0,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30.0,
                        color: Color(0xFF4d8d6e),
                      ),
                      onPressed: () {},
                    ),
                    title: Text(
                      'How to use TeleOrtho?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),*/
                SizedBox(
                  width: 350.0,
                  height: 15.0,
                  /*child: Divider(
                    color: Colors.grey,
                  ),*/
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                    child: Text(
                      'Change password',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  height: 8.0,
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
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

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        //obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}



/*  Positioned(
                    top: 14,
                    left: 8,
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const main_PagePatient()),
                        );
                      },
                    ),
                  ),*/ 

*/





