import 'package:flutter/material.dart';
import 'package:_finalproject/screens/signin_screen.dart';
import 'package:_finalproject/screens/signup_screen.dart';


class Login_Register extends StatefulWidget {
  static const String id = "HOMESCREEN";
  const Login_Register({Key? key}) : super(key: key);
  @override
  LoginRegisterState createState() => LoginRegisterState();
}
class LoginRegisterState extends State<Login_Register> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Flutter Demo',
//       theme: ThemeData.light(), //.dark(),
//       initialRoute: MyHomePage.id,
//       routes: {
//         MyHomePage.id: (context) => MyHomePage(),
//         Registration.id: (context) => Registration(),
//         Login.id: (context) => Login(),
//         // Chat.id: (context) => Chat()
//       },
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage("assets/images/p2.png"),
                width: 500.0,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15.0,
              ),

              CustomButton(
                text: 'Create Account',
                callback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()));              },
              ),

              const SizedBox(
                height: 10,
              ),

              CustomButton(
                text: 'Log In',
                callback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key? key, required this.callback, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: const Color(0xFF4d8d6e),
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 270,
          height: 50,
          textColor: Colors.white,
          child: Text(text),
        ),
      ),
    );
  }
}
