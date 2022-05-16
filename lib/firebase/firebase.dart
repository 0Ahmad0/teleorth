import 'package:_finalproject/firebase/user.dart';
import 'package:_finalproject/report/details_report.dart';
import 'package:_finalproject/screens/patient/recovery_plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../Screens/patient/Diagnosis_result.dart';
import 'chatting.dart';

class FirebaseController{
  static List listReport=[];
  static var report;
  static int indexReport=0;
  static int indexPatient=0;
  static int indexXrayImages=0;
  static String namePatient="";
  static String emailPatient="";
  static int indexReportPage=-1;
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
  static Future<bool> fetchReportDoctor() async {
    try{
      FirebaseFirestore.instance.collection("reports").
      doc(FirebaseController.listReport[FirebaseController.indexReport].id).
      get().
      then((value){
        report=value;
        print("listXray : "+"${report["xrayImages"].length}");
        return true;
      });
    }catch(e){
      print(e);
      return false;
    }
    return false;
  }

  static updateRecoveryPlan() async {
    try{
      await FirebaseFirestore.instance.collection("reports").
      doc(listReport[indexReport]).
      update({
        "recoveryPlan":DetailsReport.recoveryPlan,
        "doctor":DetailsReport.report["doctor"],
        "isVisible":true,
      }).
      then((value){
        print("done update recovery plan");
        return true;
      });

    }catch(e){
      print(e);
      print("dont update recovery plan");
      return false;
    }
    print("dont update recovery plan");
    return false;
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
  static changeTensP(String typeTens,var additive){
    return {
      "${typeTens}":!additive["tensD"],
      "${((typeTens)=="tensD")?"tensP":"tensD"}":(typeTens=="tensD")?!additive["tensD"]:additive["tensD"],
      "tens":additive["tens"],
      "doctor_email":additive["doctor_email"],
      "patient_email":additive["patient_email"],
      "date_add":additive["date_add"],
    };
  }
  static changeTensC(var additive){
    return {
      "tensD":false,
      "tensP":false,
      "tens":additive["tens"],
      "doctor_email":additive["doctor_email"],
      "patient_email":additive["patient_email"],
      "date_add":additive["date_add"],
    };
  }
  static changeTensHz(int tens,var additive){
    return {
      "tensD":!additive["tensD"],
      "tensP":additive["tensP"],
      "tens":tens,
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
  static String getPhase(){
    String phase="Not found plan !";
    indexReportPage=-1;
    for(int i=0;i<listReport.length;i++){
      if(listReport[i]["isVisible"]){
        if(indexReportPage==-1){
          num subtract=Timestamp.now().seconds-listReport[i]["date"].seconds;
          if(subtract<0)return phase;
          indexReportPage=i;
          subtract=subtract/60/60/24/7;
          phase=getPhaseHelper(subtract, listReport[i]["recoveryPlan"]["Weber${listReport[i]["doctor"]["weber"]}"]);
         // subtract=int.parse(listReport[i]["recoveryPlan"]["WeberA"][0]);
          print("index ${indexReportPage} ,${subtract}");
          print(phase);
          return phase;
        }
      }
    }
    print(phase);
    return phase;
  }
  static String getPhaseHelper(num subtract,var weber){
    String phase="Not found plan !";
    int numphase=1;
    for(int i=0;i<weber.length;i+=2){
      if(subtract-int.parse(weber[i])>=0&&int.parse(weber[i+1])-subtract>0){
        return "Phase${numphase} : Week ${(subtract-int.parse(weber[i])).ceil()}";
      }
      numphase++;
    }
    return phase;
  }
}