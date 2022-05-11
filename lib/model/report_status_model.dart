// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class ReportStage {
  final bool terminateQuiz;
  final Report report;
  final List<Symptom> symptoms;

  ReportStage({
    required this.terminateQuiz,
    required this.report,
    required this.symptoms,
  });

  ReportStage copyWith({
    bool? terminate,
    Report? report,
    List<Symptom>? symptoms,
  }) {
    return ReportStage(
      terminateQuiz: terminate ?? this.terminateQuiz,
      report: report ?? this.report,
      symptoms: symptoms ?? this.symptoms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'terminate_quiz': terminateQuiz,
      'diagnose_report_data': report.toMap(),
      'symptoms': symptoms.map((x) => x.toMap()).toList(),
    };
  }

  factory ReportStage.fromMap(Map<String, dynamic> map) {
    return ReportStage(
      terminateQuiz: map['terminate_quiz'] ?? false,
      report: Report.fromMap(map['diagnose_report_data']),
      symptoms: List<Symptom>.from(map['symptoms']?.map((x) => Symptom.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportStage.fromJson(String source) => ReportStage.fromMap(json.decode(source));

  @override
  String toString() => 'ReportStatus(terminate: $terminateQuiz, report: $report, symptoms: $symptoms)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportStage &&
        other.terminateQuiz == terminateQuiz &&
        other.report == report &&
        listEquals(other.symptoms, symptoms);
  }

  @override
  int get hashCode => terminateQuiz.hashCode ^ report.hashCode ^ symptoms.hashCode;
}

class Report {
  final int id;
  final String user_id;
  final String stage;
  final String pre_diagnose;
  final String final_diagnose;

  Report({
    required this.id,
    required this.user_id,
    required this.stage,
    required this.pre_diagnose,
    required this.final_diagnose,
  });

  Report copyWith({
    int? id,
    String? user_id,
    String? stage,
    String? pre_diagnose,
    String? final_diagnose,
  }) {
    return Report(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      stage: stage ?? this.stage,
      pre_diagnose: pre_diagnose ?? this.pre_diagnose,
      final_diagnose: final_diagnose ?? this.final_diagnose,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'stage': stage,
      'pre_diagnose': pre_diagnose,
      'final_diagnose': final_diagnose,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id'] ?? '',
      stage: map['stage'] ?? '',
      pre_diagnose: map['pre_diagnose'] ?? '',
      final_diagnose: map['final_diagnose'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Report(id: $id, user_id: $user_id, stage: $stage, pre_diagnose: $pre_diagnose, final_diagnose: $final_diagnose)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Report &&
        other.id == id &&
        other.user_id == user_id &&
        other.stage == stage &&
        other.pre_diagnose == pre_diagnose &&
        other.final_diagnose == final_diagnose;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        stage.hashCode ^
        pre_diagnose.hashCode ^
        final_diagnose.hashCode;
  }
}

class Symptom {
  final String symptom;
  Symptom({
    required this.symptom,
  });

  Symptom copyWith({
    String? symptom,
  }) {
    return Symptom(
      symptom: symptom ?? this.symptom,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'symptom': symptom,
    };
  }

  factory Symptom.fromMap(Map<String, dynamic> map) {
    return Symptom(
      symptom: map['symptom'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Symptom.fromJson(String source) => Symptom.fromMap(json.decode(source));

  @override
  String toString() => 'Symptom(symptom: $symptom)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Symptom && other.symptom == symptom;
  }

  @override
  int get hashCode => symptom.hashCode;
}
