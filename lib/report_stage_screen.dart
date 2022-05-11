import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller/question_controller.dart';

class ReportStageScreen extends GetView<QuestionsController> {
  const ReportStageScreen({Key? key}) : super(key: key);
static var diagnosis="";
  @override
  Widget build(BuildContext context) {
    final subTitleStyle = TextStyle(
      fontSize: 20,
      color: Theme.of(context).primaryColor,
    );
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            controller.resetFlow();
            Navigator.maybePop(context);
          },
        ),
        title: const Text("Status Report"),
        backgroundColor: const Color(0xFF5aa681),
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(20),
        
        child: ListView(
          children: [
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     // ignore: prefer_const_constructors
            //     Text(
            //       "Pre Diagonse",
                  
            //     style: const TextStyle(
            //     color: Color(0xFF4d8d6e),
            //     fontSize: 20,
            //   ),
            //     ),
            //     const SizedBox(height: 10),
              

            //     Text(
            //       controller.reportStage!.report.pre_diagnose,
            //       style: Theme.of(context).textTheme.subtitle2,
            //     ),
            //   ],
            // ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Text(
                  "Final Diagonse",
                style: const TextStyle(
                color: Color(0xFF4d8d6e),
                fontSize: 20,
              ),
                ),
                const SizedBox(height: 10),
                Text(
                  controller.reportStage!.report.final_diagnose,
                  
                  style: Theme.of(context).textTheme.subtitle2,

                  
                ),
                 Text(
                  controller.reportStage!.report.pre_diagnose,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     // ignore: prefer_const_constructors
            //     Text(
            //       "Stage",
            //       style: const TextStyle(
            //     color: Color(0xFF4d8d6e),
            //     fontSize: 20,
            //   ),
            //     ),
            //     const SizedBox(height: 10),
            //     Text(
            //       controller.reportStage!.report.stage,
            //       style: Theme.of(context).textTheme.subtitle2,
            //     ),
            //   ],
            // ),
             const SizedBox(height: 20),
                  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Symptoms",
                  style: subTitleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  controller.reportStage!.symptoms.join(", "),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
                        
        ),
        
      ),
      
    );
    
  }
}
