// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:_finalproject/model/answer_model.dart';
import 'package:_finalproject/model/flow_entry_model.dart';
import 'package:_finalproject/model/question_model.dart';
import 'package:_finalproject/model/report_status_model.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../exceptions.dart';
const baseUrl = "expert-system-v2.herokuapp.com";


final user2 = FirebaseAuth.instance.currentUser;
final userid = user?.uid;
final user = FirebaseAuth.instance.currentUser;

class ApiService {
  Uri _parseUrl(String url, {Map<String, String>? queryParams}) {
    return Uri.https(baseUrl, url, queryParams);
    
  }

  Future<FlowEntry> fetchFlowEntry(int userId) async {
    

    try {
      final uri = _parseUrl(
        APIs.flowEntry,
        queryParams: {
          "userId": "$userid",
        },
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return FlowEntry.fromJson(response.body);
      }
      throw ServerException(message: response.body, statusCode: response.statusCode);
    } on ServerException catch (e, s) {
      print("${e.statusCode} :: ${e.message} \n STACK TRACE $s");
      throw e.statusCode;
    } on SocketException {
      throw "No Internet Connection";
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      throw "Something Went Wrong";
    }
  }

  Future<Question> fetchQuestion(int diagnoseReportId) async {
    try {
      final uri = _parseUrl(
        APIs.questions,
        queryParams: {
          "diagnoseReportId": diagnoseReportId.toString(),
        },
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Question.fromJson(response.body);
      }
      throw ServerException(message: response.body, statusCode: response.statusCode);
    } on ServerException catch (e, s) {
      print("${e.statusCode} :: ${e.message} \n STACK TRACE $s");
      throw e.statusCode;
    } on SocketException {
      throw "No Internet Connection";
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      throw "Something Went Wrong";
    }
  }

  Future<void> sendAnswer(int diagnoseReportId, Answer answer) async {
    try {
      final uri = _parseUrl(
        APIs.answers,
      );

      var formData = FormData.fromMap({
        'diagnoseReportId': diagnoseReportId,
        'questionId': answer.questionId,
      });
      formData.fields.addAll(answer.toMap().entries);

      final response = await Dio().post(uri.toString(), data: formData);
      if (response.statusCode == 200) {
        return;
      }
    } on DioError catch (e, s) {
      print("${e.response?.statusCode ?? ''} :: ${e.message} \n STACK TRACE $s");
      throw e.message;
    } on SocketException {
      throw "No Internet Connection";
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      throw "Something Went Wrong";
    }
  }

  Future<ReportStage> fetchReportStage(int diagnoseReportId) async {
    try {
      final uri = _parseUrl(
        APIs.reportStatus,
        queryParams: {
          "diagnoseReportId": diagnoseReportId.toString(),
        },
      );

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return ReportStage.fromJson(response.body);
      }
      throw ServerException(message: response.body, statusCode: response.statusCode);
    } on ServerException catch (e, s) {
      print("${e.statusCode} :: ${e.message} \n STACK TRACE $s");
      throw e.statusCode;
    } on SocketException {
      throw "No Internet Connection";
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      throw "Something Went Wrong";
    }
  }
}

class APIs {
  static const flowEntry = "diagnose-report/report-intializer";
  static const questions = "quiz/questions";
  static const answers = "quiz/answers";
  static const reportStatus = "diagnose-report/report-stage-checker";
}
