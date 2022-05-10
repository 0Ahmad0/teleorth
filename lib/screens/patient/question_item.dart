import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/question_controller.dart';
import '../../model/answer_model.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({
    Key? key,
  }) : super(key: key);

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  final controller = Get.find<QuestionsController>();
  late final question = controller.currentQuestion!;

  late final Answer answer;

  @override
  void initState() {
    super.initState();
    answer = question.calcBMI
        ? BMIAnswer(questionId: question.id, weight: "", height: "")
        : YesNoAnswer(questionId: question.id, answerOption: AnswerOption.notSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                question.image.isEmpty ? const SizedBox.shrink() : Image.network(question.image),
                const SizedBox(height: 10),
                Text(
                  question.question,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 20),
                question.calcBMI ? buildBMIFields(context) : buildYesNoOption(context)
              ],
            ),
          ),
          buildSendButton(context),
        ],
      ),
    );
  }

  Widget buildBMIFields(BuildContext context) {
    final bmiAnswer = answer as BMIAnswer;

    return Form(
      child: Column(
        children: [
          TextField(
            onChanged: (weight) {
              bmiAnswer.weight = weight;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Weight in Kg",
              hintStyle: Theme.of(context).textTheme.caption,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(16.0),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: (height) {
              bmiAnswer.height = height;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Height in cm",
              hintStyle: Theme.of(context).textTheme.caption,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }

  Row buildYesNoOption(BuildContext context) {
    final yesNoAnswer = answer as YesNoAnswer;
    return Row(
      children: [
        Container(
          decoration: yesNoAnswer.answerOption == AnswerOption.yes
              ? BoxDecoration(
                  color:  Color.fromARGB(255, 215, 248, 232),
                  shape: BoxShape.circle,
                )
              : null,
          child: TextButton(
            onPressed: () {
              yesNoAnswer.answerOption = AnswerOption.yes;
              setState(() {});
            },
             child: Text(
                      "YES",
                      style: TextStyle(color: Color(0xFF4d8d6e)),
                    ),
          ),
        ),
        Container(
          decoration: yesNoAnswer.answerOption == AnswerOption.no
              ? BoxDecoration(
                  color: Color.fromARGB(255, 215, 248, 232),
                  shape: BoxShape.circle,
                )
              : null,
          child: TextButton(
            
            onPressed: () {
              yesNoAnswer.answerOption = AnswerOption.no;
              setState(() {});
            },
            child: Text(
                      "NO",
                      style: TextStyle(color: Color(0xFF4d8d6e)),
                    ),
                    ),
        )
      ],
    );
  }

  Padding buildSendButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Obx(
        () => TextButton(
          style: ButtonStyle(
            backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF4d8d6e)),
            elevation: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return 6;
                }
                return 2;
              },
            ),
          ),
          onPressed: () {
            controller.sendAnswer(answer);
          },
          child: controller.sendingAnswers
              ? const Center(
                  child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ))
              : const SizedBox(
                  height: 30,
                  child: Center(
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
