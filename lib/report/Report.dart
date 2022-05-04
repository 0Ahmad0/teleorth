class Report{
  List<Image> InjuryImages=[];
  List<Image> XrayImmages=[];
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
class Image{
  late String path;
  late DateTime date;
}