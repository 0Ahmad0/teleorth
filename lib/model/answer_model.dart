import 'dart:convert';

abstract class Answer {
  final int questionId;

  Answer(this.questionId);

  bool validate();
  Map<String, String> toMap();
  String toJson();
}

class BMIAnswer extends Answer {
  String weight;
  String height;
  BMIAnswer({
    required int questionId,
    required this.weight,
    required this.height,
  }) : super(questionId);

  @override
  Map<String, String> toMap() {
    return {
      'weight': weight,
      'height': height,
      'answer': 'no',
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  bool validate() => weight.isNotEmpty && height.isNotEmpty;
}

class YesNoAnswer extends Answer {
  AnswerOption answerOption;
  YesNoAnswer({
    required int questionId,
    required this.answerOption,
  }) : super(questionId);

  @override
  Map<String, String> toMap() {
    return {
      'answer': answerOption.name,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  bool validate() => answerOption != AnswerOption.notSelected;
}

enum AnswerOption {
  yes,
  no,
  notSelected,
}

extension Name on AnswerOption {
  String get name {
    if (this == AnswerOption.yes) {
      return "yes";
    }
    if (this == AnswerOption.no) {
      return "no";
    }
    return "Not Selected";
  }
}
