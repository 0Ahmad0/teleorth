import 'package:flutter/material.dart';
import 'Diagnosis_result.dart';
import 'allreport_Patient.dart';
List<Map<String,dynamic>> questions = [
  {
    "question":"what is your name?",
    "answers":[
      "1",
      "2",
      "3",
    ],
  },
  {
    "question":"what is your Age",
    "answers":[
      "15",
      "20",
      "35",
    ],
  },
  {
    "question":"what is your Phone Number?",
    "answers":[
      "+963 xxx xxx xxx",
      "+966 5xx xxx xxx",
      "+967 xxx xxx xxx",
    ],
  },
  {
    "question":"what is your FatherName?",
    "answers":[
      "AHMAD",
      "MOHAMED",
      "MALEK",
    ],
  }
];

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4d8d6e),
      ),
      body: SingleChildScrollView(
        child: ListQuestion(),
      ),
    );
  }
}

class ListQuestion extends StatefulWidget {
  const ListQuestion({Key? key}) : super(key: key);

  @override
  _ListQuestionState createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      questions.map((e) {
        var title;

        List ans = e['answers'];
        return Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFF4d8d6e),
                  )
              )
          ),
          child: ExpansionTile(
            key: GlobalKey(),
            subtitle: Text('${
               title
            }'),
            title: Text('${e['question']}'),
            children: ans.map((ee){
              return ListTile(
                title: Text('${ee}'),
                onTap: (){
                print(ee);
                setState(() {

                });
                },
              );
            }).toList(),
          ),
        );
      }).toList()
      ,
    );
  }
}
