import 'package:_finalproject/firebase/user.dart';
import 'package:_finalproject/screens/doctor/homePageDoctor.dart';
import 'package:_finalproject/screens/wlcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:_finalproject/reusable_widgets/reusable_widget.dart'; // call the reusable widget
import 'package:_finalproject/screens/home_screen.dart';
import 'package:_finalproject/screens/reset_password.dart';
import 'package:_finalproject/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'edit_profile.dart';
import 'package:_finalproject/screens/patient/main_PagePatient.dart';

class SignInScreen extends StatefulWidget {
  static String id = "ssignin";
  static String email = "";
  static String fullName = "";
  static String userName = "";
  static String gender = "";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late String errorMessage;
  final TextEditingController _passwordTextController =
      TextEditingController();
  final TextEditingController _emailTextController =
      TextEditingController(); // Email Text Controller

  String myEmail = "";
  String myName = "";
    String myuserName = "";
    String myGender="";
    String typeUser="";
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff5aa681),
        elevation: 0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: <Widget>[
            const Expanded(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  width: 300,
                  child: Image(
                    image: AssetImage("assets/images/logo1.png"),
                    //  width: 800.0,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
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
                Icons.lock_outline,
                true, // call reusableTextField from the reusable widget
                _passwordTextController
            ),
            const SizedBox(
              height: 21,
            ),
            forgetPassword(
                context), // call forgetPassword function after "Enter Password" field to write the "Forgot Password?" and handle it
            firebaseUIButton(context, "Sign In", () {
              //call firebaseUIButton from the reusable widget, to make Sign In button
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      // sign in function
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
              )
                  .then((value) async {
                setState(() {
                  showSpinner = true;
                });

                User user = FirebaseAuth.instance.currentUser!;
                await _fetchUser();
                MyUser.EMAIL=_emailTextController.text;
               /* MyUser.FULLNAME = "$myName";
                MyUser.USERNAME = "$myuserName";
               MyUser.GENDER ="$myGender";*/
                if (WelcomeScreen.isDoctor) {
                  MyUser.TYPEUSER="doctor";
                  Future.delayed(const Duration(milliseconds: 2000), () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const homePageDoctor())); // take me to home screen after sign up
                      setState(() {
                        showSpinner = false;
                      });
                    });
                  });
                } else {
                  MyUser.TYPEUSER="patient";
                  Future.delayed(const Duration(milliseconds: 2000), () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const main_PagePatient())); // take me to home screen after sign up
                      setState(() {
                        showSpinner = false;
                      });
                    });
                  });
                }
              }).onError((error, stackTrace) {
                if (error != null) {
                  print("${error.toString()}"); // print the error in console
                  switch (error.toString()) {
                    case "[firebase_auth/invalid-email] The email address is badly formatted.":
                      {
                        onClick("Email is wrong");
                      }
                      break;

                    case "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.":
                      {
                        onClick("check your password again");
                      }
                      break;

                    case "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.":
                      {
                        onClick(
                            "No user found with this email, Go to signup page");
                      }
                      break;
                    case "[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.":
                      onClick(
                          "Too many requests to log into this account. Try again later.");
                      break;
                    default:
                      onClick("Login failed. Please try again.");
                      break;
                  }
                }
              });
            }),
            signUpOption() // call signUpOption
          ],
        ),
      ),
    );
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

  Row signUpOption() {
    return Row(
      // create row for the "Don't have account?" question
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const SignUpScreen())); // if the user press Sign Up SignUp Screen will open
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    // forgetPassword function
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        // text button
        child: const Text(
          "Forgot Password?", // Forgot Password question
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const ResetPassword())), // if pressed open Reset password screen
      ),
    );
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
      myuserName=ds['userName'];
      myGender=ds['gender'];
      SignInScreen.email = "$myEmail";
      SignInScreen.fullName = "$myName";
      SignInScreen.userName = "$myuserName";
       SignInScreen.gender ="$myGender";
    }).catchError((e) {
      print(e);
    });}
    else{final firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection('patient')
        .doc(firebaseUser.uid) //pass the user id to get his information
        .get()
        .then((DocumentSnapshot ds) {
      myEmail = ds['email'];
      print(myEmail);
      myName = ds['displayName'];
      print(myName);
      myuserName=ds['userName'];
      myGender=ds['gender'];
      SignInScreen.email = "$myEmail";
      SignInScreen.fullName = "$myName";
      SignInScreen.userName = "$myuserName";
      SignInScreen.gender ="$myGender";
    }).catchError((e) {
      print(e);
    });}
  }
  _fetchUser() async{
    WelcomeScreen.isDoctor? typeUser="doctor":typeUser="patient";
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection("${typeUser}").
    where("email",isEqualTo: firebaseUser.email).get().then((value){
       if(value.docs.isNotEmpty){
         MyUser.USERNAME=value.docs[0]["userName"];
         MyUser.GENDER=value.docs[0]["gender"];
         MyUser.FULLNAME=value.docs[0]["displayName"];
         MyUser.ID=value.docs[0]["uid"];
         return true;
       }
    });
    return false;
  }
}
