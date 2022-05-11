import 'package:_finalproject/firebase/user.dart';
import 'package:_finalproject/report/details_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../Screens/patient/Diagnosis_result.dart';
import 'chatting.dart';

class FirebaseController{
  static List listReport=[];
  static int indexReport=0;
  static int indexPatient=0;
  static String namePatient="";
  static String emailPatient="";
  static addReport() async {
    await FirebaseFirestore.instance.collection("reports").add(DetailsReport.report).then((value){
      print("done add report");
      return Diagnosis_result();
    });
    print("done not report");
  }
  static Future<bool> fetchReportsPatient() async {
    try{
      await FirebaseFirestore.instance.collection("reports").
      where("userName",isEqualTo: MyUser.USERNAME).
      get().
      then((value){
        listReport=value.docs;
        print("listReport : "+"${listReport.length}");
      });
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
  static Future<bool> fetchReportsDoctor() async {
    try{
      await FirebaseFirestore.instance.collection("reports").
      where("email",isEqualTo: emailPatient).
      get().
      then((value){
        listReport=value.docs;
        print("listReport : "+"${listReport.length}");
      });
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
  static changeTens(String typeTens,var additive){
    return {
    "${typeTens}":!additive["tensD"],
    "${((typeTens)=="tensD")?"tensP":"tensD"}":(typeTens=="tensD")?!additive["tensD"]:additive["tensD"],
    "tens":additive["tens"],
    "doctor_email":additive["doctor_email"],
    "patient_email":additive["patient_email"],
      "date_add":additive["date_add"],
  };
  }
  static String formatTimestamp(Timestamp timestamp) {
    var format =  new DateFormat('yMd'); // <- use skeleton here
    //return format.format(timestamp.toDate());
    return DateFormat.yMMMMd()
        .add_jms()
        .format(timestamp.toDate());
  }
}