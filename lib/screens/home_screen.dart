import 'package:firebase_auth/firebase_auth.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String myEmail = "";
  String myName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text("Logout"),
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
            FutureBuilder(
              future: _fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return Text("Loading data...Please wait");
                return Text("Email : $myEmail");
              },
            ),
          ],
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      //if the user signed in
      await FirebaseFirestore.instance
          .collection('patient')
          .doc(firebaseUser.uid) //pass the user id to get his information
          .get()
          .then((DocumentSnapshot ds) {
        myEmail = ds['email'];
        print(myEmail);
        myName = ds['displayName'];
        print(myName);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
