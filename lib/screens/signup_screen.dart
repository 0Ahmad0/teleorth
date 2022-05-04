import 'package:_finalproject/Screens/doctor/homePageDoctor.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:_finalproject/reusable_widgets/reusable_widget.dart';
import 'package:_finalproject/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:_finalproject/screens/wlcome_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'edit_profile.dart';
import 'package:_finalproject/screens/patient/main_PagePatient.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String errorMessage;
  bool showSpinner = false;
  String myEmail = "";
  String myName = "";
  String myuserName = "";
  String myGender = "";
  static final TextEditingController _passwordTextController =
      TextEditingController();
  static final TextEditingController _emailTextController =
      TextEditingController();
  static final TextEditingController _userNameTextController =
      TextEditingController();
  static final TextEditingController _fullNameTextController =
      TextEditingController();
  static String _genderTextController = "";
  RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5aa681),
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Hero(
                tag: 'logo',
                child: SizedBox(
                  width: 240.0,
                  child: Image(
                    image: AssetImage("assets/images/logo1.png"),
                    //  width: 800.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              reusableTextField(
                  "Enter Your Full Name",
                  Icons.person_outline,
                  false, // call reusableTextField from the reusable widget
                  _fullNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Enter Your Username",
                  Icons.person_outline,
                  false, // call reusableTextField from the reusable widget
                  _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Enter Your Email",
                  Icons.person_outline,
                  false, // call reusableTextField from the reusable widget
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Enter Your Password",
                  Icons.lock_outlined,
                  true, // call reusableTextField from the reusable widget
                  _passwordTextController),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 410.0,
                height: 50.0,
                margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0, 0),
                child: DropdownButtonFormField(
                  iconDisabledColor: Color(0xFF4d8d6e),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  hint: const Text("Select your gender",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      )),
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
                  onChanged: (value) {
                    if (value == "1") {
                      _genderTextController = "Male";
                    } else {
                      _genderTextController = "Female";
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              firebaseUIButton(context, "Sign Up", () {

                FirebaseFirestore.instance.collection(WelcomeScreen.isDoctor?"doctor":"patient").
                  where("userName",isEqualTo: "${_userNameTextController.text}").get().
                then((value) => {
                  if(value.docs.length==0){
                    //call firebaseUIButton from the reusable widget, Sign up button
                    FirebaseAuth
                        .instance // create Firebase authentication function for email and password
                        .createUserWithEmailAndPassword(
                    email: _emailTextController.text, //email controller
                    password: _passwordTextController
                        .text) // showSpinner is waiting sign until the sign up
                    .then((value) async {
                  setState(() {
                    showSpinner = true;
                  });

                  // once the  account is created then go to home screen
                  User user = FirebaseAuth.instance.currentUser!;
                  _fetch();
                  print(user.displayName);
                  if (WelcomeScreen.isDoctor) {
                    await FirebaseFirestore.instance
                        .collection("doctor")
                        .doc(user.uid)
                        .set({
                      // create collection (table) and add users to it
                      'uid': user.uid,
                      'email': _emailTextController.text,
                      'password': _passwordTextController.text,
                      'displayName': _fullNameTextController.text,
                      'userName': _userNameTextController.text,
                      'gender': _genderTextController
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()/*homePageDoctor()*/),
                                (Route<dynamic> route) => true);
                        /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const homePageDoctor()));*/ // take me to home screen after sign up
                        setState(() {
                          showSpinner = false;
                        });
                      });
                    }); // take me to home screen after sign up
                  }
                  else {
                    await FirebaseFirestore.instance
                        .collection("patient")
                        .doc(user.uid)
                        .set({
                      // create collection (table) and add users to it
                      'uid': user.uid,
                      'email': _emailTextController.text,
                      'password': _passwordTextController.text,
                      'displayName': _fullNameTextController.text,
                      'userName': _userNameTextController.text,
                      'gender': _genderTextController
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      setState(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => main_PagePatient()),
                                (Route<dynamic> route) => true);
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const main_PagePatient()));*/ // take me to home screen after sign up
                        setState(() {
                          showSpinner = false;
                        });
                      });
                    }); // take me to home screen after sign up
                  }
                  print("Created New Account"); // print to console

                  setState(() {
                    showSpinner = false;
                  });
                }).onError((error, stackTrace) {
                  // if error
                  if (error != null) {
                    switch (error.toString()) {
                      case "[firebase_auth/email-already-in-use] The email address is already in use by another account.":
                        onClick("Email already used. Go to login page.");
                        break;
                      case "[firebase_auth/weak-password] Password should be at least 6 characters":
                        onClick("Password should be at least 6 characters");
                        break;
                      case "[firebase_auth/invalid-email] The email address is badly formatted.":
                        onClick("Email address is invalid.");
                        break;
                      default:
                        onClick("signup failed. Please try again.");
                        break;
                    }
                    print("${error.toString()}"); // print the error in console
                  }
                }),
                  }else{
                    print("user name already found!!"),
                    Dialog(child: SizedBox(width: 10,height: 10,),  ),
                  }
                });

              })
            ],
          ),
        ),
      ),
    );
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      onClick('Please Enter Password');
    } else {
      if (!regex.hasMatch(value)) {
        onClick('Enter Valid Password');
      } else {
        return null;
      }
    }
  }

  String? validateEmailPassword(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'Please Enter Email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter Valid Email';
      } else {
        return null;
      }
    }
  }

  void onClick(String errorMsg) {
    // show a notification at top of screen.
    showOverlayNotification((context) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        color: const Color.fromARGB(255, 245, 237, 216),
        child: ListTile(
          title: const Text("Error"),
          subtitle: Text(errorMsg),
          trailing: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                OverlaySupportEntry.of(context)?.dismiss();
              }),
          leading: IconButton(
              icon: const Icon(Icons.error_outline),
              color: const Color.fromARGB(255, 148, 63, 57),
              onPressed: () {
                OverlaySupportEntry.of(context)?.dismiss();
              }),
        ),
      );
    }, duration: const Duration(milliseconds: 10000));
  }

  _fetch() async {
    if (WelcomeScreen.isDoctor) {
      final firebaseUser = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('doctor')
          .doc(firebaseUser.uid) //pass the user id to get his information
          .get()
          .then((DocumentSnapshot ds) {
        myEmail = ds['email'];
        print(myEmail);
        myName = ds['displayName'];
        print(myName);
        myuserName = ds['userName'];
        myGender = ds['gender'];
        SignInScreen.email = "$myEmail";
        SignInScreen.fullName = "$myName";
        SignInScreen.userName = "$myuserName";
        SignInScreen.gender = "$myGender";
      }).catchError((e) {
        print(e);
      });
    } else {
      final firebaseUser = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('patient')
          .doc(firebaseUser.uid) //pass the user id to get his information
          .get()
          .then((DocumentSnapshot ds) {
        myEmail = ds['email'];
        print(myEmail);
        myName = ds['displayName'];
        print(myName);
        myuserName = ds['userName'];
        myGender = ds['gender'];
        SignInScreen.email = "$myEmail";
        SignInScreen.fullName = "$myName";
        SignInScreen.userName = "$myuserName";
        SignInScreen.gender = "$myGender";
      }).catchError((e) {
        print(e);
      });
    }
  }
}
