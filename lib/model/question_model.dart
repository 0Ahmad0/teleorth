import 'dart:convert';

class Question {
  final int id;
  final String question;
  final String image;
  final int group;
  final bool calcBMI;

  Question({
    required this.id,
    required this.question,
    required this.image,
    required this.group,
    required this.calcBMI,
  });

  Question copyWith({
    int? id,
    String? question,
    String? image,
    int? group,
    bool? calcBMI,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      image: image ?? this.image,
      group: group ?? this.group,
      calcBMI: calcBMI ?? this.calcBMI,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question_text': question,
      'question_image': image,
      'group': group,
      'calc_bmi': calcBMI,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id']?.toInt() ?? 0,
      question: map['question_text'] ?? '',
      image: map['question_image'] ?? '',
      group: map['group']?.toInt() ?? 0,
      calcBMI: map['calc_bmi'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(id: $id, question: $question, image: $image, group: $group, calc_BMI: $calcBMI)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.question == question &&
        other.image == image &&
        other.group == group &&
        other.calcBMI == calcBMI;
  }

  @override
  int get hashCode {
    return id.hashCode ^ question.hashCode ^ image.hashCode ^ group.hashCode ^ calcBMI.hashCode;
  }
}
