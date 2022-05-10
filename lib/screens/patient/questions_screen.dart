import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/question_controller.dart';
import 'question_item.dart';

class QuestionsScreen extends GetView<QuestionsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Initial Diagnosis"),
        backgroundColor: const Color(0xFF5aa681),
      ),
      
      body: Obx(
        () {
          return Center(
            child: controller.loading
                ? const CircularProgressIndicator.adaptive()
                : controller.currentQuestion == null
                    ? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF4d8d6e)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)))),
                        child: const Text("Start Initial Diagnosis"),
                        onPressed: () {
                          controller.fetchQuestion();
                        },
                      )
                    : QuestionItem(),
          );
        },
      ),
    );
  }
}
