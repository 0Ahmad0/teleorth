import 'package:flutter/material.dart';
import 'Diagnosis_result.dart';
import 'allreport_Patient.dart';

class quetions extends StatelessWidget {
  const quetions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: Column(
            children: [
              Text(" "),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 125)),
                  MaterialButton(
                    minWidth: 120.0,
                    color: Color(0xFF4d8d6e),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Diagnosis_result()),
                      );
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
