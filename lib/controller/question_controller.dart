import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/answer_model.dart';
import '../model/flow_entry_model.dart';
import '../model/question_model.dart';
import '../model/report_status_model.dart';
import '../report/details_report.dart';
import '../report_stage_screen.dart';
import '../service/api_service.dart';
import '../ui_helper.dart';

class QuestionsController extends GetxController {
   final ApiService apiService;
  QuestionsController(this.apiService);

  @override
  void onInit() {
    super.onInit();
    fetchFlowEntry(1);
  }

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _sendingAnswers = false.obs;
  bool get sendingAnswers => _sendingAnswers.value;

  FlowEntry? flowEntry;
  Question? currentQuestion;
  ReportStage? reportStage;

  Future<void> fetchFlowEntry(int userId) async {
    try {
      _loading(true);
      flowEntry = await apiService.fetchFlowEntry(userId);
    } catch (e) {
      print("$e");
      UIHelper.showErrorSnackBar(e.toString());
    }
    _loading(false);
  }

  Future<void> fetchQuestion() async {
    try {
      _loading(true);
      currentQuestion = await apiService.fetchQuestion(flowEntry!.id);
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      UIHelper.showErrorSnackBar(e.toString());
    }
    _loading(false);
  }

  Future<void> sendAnswer(Answer answer) async {
    try {
      if (!answer.validate()) {
        UIHelper.showErrorSnackBar("You must answer the question");
        return;
      }
      _sendingAnswers(true);
      await apiService.sendAnswer(flowEntry!.id, answer);
      await fetchReportStage();
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      UIHelper.showErrorSnackBar(e.toString());
    }
    _sendingAnswers(false);
  }

  Future<bool> fetchReportStage() async {
    bool fetch=false;
    try {
      reportStage = await apiService.fetchReportStage(flowEntry!.id);
      if (reportStage != null) {
        if (reportStage!.terminateQuiz) {
          print(reportStage!.report.final_diagnose+"\n"+reportStage!.report.pre_diagnose);
          DetailsReport.setDetailsReport(reportStage!.report.final_diagnose,reportStage!.report.pre_diagnose);
          await FirebaseFirestore.instance.collection("reports").add(DetailsReport.report).
            then((value){
             fetch=true;
          });
          Get.to(
            () => const ReportStageScreen(),
            fullscreenDialog: true,
          );
        } else {
          fetchQuestion();
          fetch=true;
        }
      }
    } catch (e, s) {
      print("$e :: STACK TRACE $s");
      UIHelper.showErrorSnackBar("Couldn't Fetch Status Report");
    }
    return fetch;
  }

  void resetFlow() {
    flowEntry = null;
    currentQuestion = null;
    reportStage = null;
    fetchFlowEntry(1);
  }
}
