import 'package:_finalproject/model/report_status_model.dart';
import 'package:_finalproject/report/details_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Screens/patient/Diagnosis_result.dart';

class FirebaseController{
  static  addReport() async {
    await FirebaseFirestore.instance.collection("reports").add(DetailsReport.report).then((value){
      print("done add report");
      return Diagnosis_result();
    });
    print("done not report");
  }
}