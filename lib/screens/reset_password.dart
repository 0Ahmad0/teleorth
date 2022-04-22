import 'package:firebase_auth/firebase_auth.dart';
import 'package:_finalproject/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5aa681),
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("TeleOrtho"),
      //   backgroundColor: Color(0xFF5aa681),
      // ),
      body: Column(
        children: <Widget>[
          // Expanded(
          //   child: Hero(
          //     tag: 'logo',
          //     child: Container(
          //       width: 250,
          //       child: Image(
          //         image: AssetImage("assets/images/logo1.png"),
          //         //  width: 800.0,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 150,
          ),
          reusableTextField("Enter Email Id", Icons.person_outline, false,
              _emailTextController), // should have validation for email here
          const SizedBox(
            height: 20,
          ),
          firebaseUIButton(context, "Reset Password", () {
            // Reset button using firebaseUIButton function from reusable widget
            FirebaseAuth.instance
                .sendPasswordResetEmail(
                    email: _emailTextController
                        .text) // using Firebase Auth call sendPasswordResetEmail to send an email to reset the password
                .then((value) => Navigator.of(context).pop())
                .onError((error, stackTrace) {
              print("${error.toString()}");
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
                    onClick("No user found with this email, Go to signup page");
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
            });
          })
        ],
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
}
