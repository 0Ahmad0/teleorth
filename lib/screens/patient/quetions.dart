import 'package:_finalproject/firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Diagnosis_result.dart';
import 'allreport_Patient.dart';

class quetions extends StatefulWidget {
  const quetions({Key? key}) : super(key: key);

  @override
  State<quetions> createState() => _quetionsState();
}

class _quetionsState extends State<quetions> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: Column(
            children: [
              Text("  gf"),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 125)),
                  MaterialButton(
                    minWidth: 120.0,
                    color: Color(0xFF4d8d6e),
                    onPressed: () async {
                      setState(() {
                      showSpinner = true;
                    });
                      await FirebaseController.addReport();
                     /* Future.delayed(const Duration(milliseconds: 2000), () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return Diagnosis_result();
                                }),
                          );
                          setState(() {
                            showSpinner = false;
                          });
                        });
                      });*/
                      setState(() {
                        showSpinner = false;
                      });

                    },
                    child: Text(
                      "ok", // quiz.choices[questionNumber][0],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
