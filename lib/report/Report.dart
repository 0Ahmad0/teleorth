
import 'dart:io';


class Report{
  List<Imager> InjuryImages=[];
  List<Imager> XrayImmages=[];
  RecoveryPlan? recoveryPlan;
  Details? details;
  late String userNameDoctor,nameDoctor;
  late String userNamePatient,namePatient,gender;
  late DateTime date;
 // List injuryImage=[];


}
class RecoveryPlan{
}
class Details{
  late String symptoms,possibleInjury,recommendation;
}
class Imager{
   File file;
  DateTime date;
  Imager(this.file,this.date);
}

class SReport{
  static Report report=Report();
}