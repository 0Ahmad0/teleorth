import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/report/Report.dart';

import '../firebase/user.dart';

class DetailsReport{
  static var recommendations={
    "fracture":
        "•Don’t weight bear on the injured foot.\n•If there is wound,it must be covered with a sterile gauze or cloth.\n" +
        "•Raise the leg and place ice on the swollen area for less than 20 minutes.\n•See the doctor promptly.\n" +
        "•evaluate the stability of the joint.\n•inspect the knee joint.\n•Check neurovascular status of the limb.\n" +
        "•Pain relieving medications",
    "sprain":
        "•Keep the ankle elevated(raised up) above the level of the heart when ever possible, to decrease ankle swelling by lying down and propping the foot on pillows.\n" +
        "•Place ice on the swollen area but Icing should not be applied for any longer than20 minutes repeated every hour.\n" +
        "•Pain relieving medications.•Put ACE bandage.\n•See your doctor if the swelling and pain continue.",
   };
  static var recoveryPlan={
    "WeberA":[
      "0",
      "4",
      "4",
      "6",
      "6",
      "12",
      "12",
      "13"
    ],
    "WeberB":[
      "0",
      "6",
      "6",
      "8",
      "8",
      "12",
      "12",
      "13"
    ],
    "Phases":[
      //phase1
      "•	Wear the cast with TENS all of the time when walking. You do not need to wear it in bed or when resting at home.\n"+
      "•	Use the crutches to take some of the weight off your foot, as required.\n"+
      "•	Start Stage 1 Exercises & Advice.",

      //phase2
      "•	Gradually discontinue using the boot and elbow crutches. Try walking around the house without them first.\n"+
      "•	Wear the boot with TENS when walking longer distances outdoors.\n"+
      "•	Move on to Stage 2 Exercises.",

      //phase3
      "•	Fracture should be largely united (healed).\n"+
      "•	Gradually resume normal activities as pain allows.\n"+
      "•	Heavier or more strenuous tasks, including long walks, may still be difficult and cause discomfort and swelling at this stage.\n"+
      "•	Begin Stage 3 Exercises if required.",

      //phase4
      "•	Symptoms will continue to improve over the next few months.\n"+
      "•	If you are still experiencing significant pain and / or stiffness please contact us for further advice / management .",
    ],
    "Stages":[
      {
        "text":"Exercises & Advice.",
        "text2":"",
        "Exercises":[
          "1.	Point your injured foot up and down within a comfortable range of movement. Repeat 10 times.",
          "2.	Alternately turn your foot outwards leading with the outer bored of your foot (little toe) and then turn your foot inwards leading with the inner border of your foot (big toe), as shown in the picture. Make sure you keep the rest of your leg still. Repeat 10 times.",
          "3.	Make circles with your foot in one direction, then repeat in the other direction. Repeat 10 times.",
        ],
        "Explanation":[
          "assets/images/recoveryImages/s1E1.png",
          "assets/images/recoveryImages/s1E2.png",
          null
        ]
      },
      {
        "text":"Exercises (3-4 times a day) ",
        "text2":"",
        "Exercises":[
          "1.	Sit with your injured leg straight out in front of you. Place a towel or dressing gown cord around your foot and pull it towards you until you feel a stretch in the back of your calf. Hold for 30 seconds. Repeat 3 times.",
          "2.	Sit on a chair. Cross your injured ankle over your other knee. Place your hand over the top of your ankle and stretch the top of your foot and ankle, pointing your toes downwards. Hold for 30 seconds. Repeat 3 times.\nOR\n"+
              "Place your foot on a chair behind you, as shown in the picture. Hold onto something for balance. Point your foot and ankle downwards. You should feel a stretch at the front of your foot & ankle. Hold or 30 seconds. Repeat 3 times.",
        ],
        "Explanation":[
          "assets/images/recoveryImages/s2E1.png",
          "assets/images/recoveryImages/s2E2.png",
        ]
      },
      {
        "text":"Exercises (3-4 times a day)",
        "text2":"These are optional advanced exercises designed for sports rehabilitation.",
        "Exercises":[
          "Level 1: \n"+
            "a)	Stand on your injured leg on an uneven surface (such as a pillow or a wobble board / cushion). Aim to hold this position for 30 seconds. Once you can achieve this pain-free, move onto exercise Level 1b).\n"+
            "b)	Progress to attempting the above exercise with your eyes closed. Always stand in a safe environment with a firm surface nearby should you require it. Aim to balance for 10 seconds.",
          "Level 2:\n"+
            "a)	Stand on your injured leg, with your hands together. Swing your arms in a figure of 8 in both directions for 30 seconds.\n"+
            "b)	As above, but with your eyes closed. Aim to balance for 10 seconds.",
        ],
        "Explanation":[
          "assets/images/recoveryImages/s3E1.png",
          "assets/images/recoveryImages/s3E2.png",
          null
        ]
      },
    ],
    "BalanceExercises":[
      //level 1
      {
        "text": "Level 1: (for those who could not balance on 1 leg prior to this injury)\n"+
            "a)	Stand with your feet as close together as possible. Hold onto something for balance. Hold this for position for 30 seconds. If you can do this, move on to exercise Level 1b)\n"+
            "b)	As above but do not hold onto anything for balance. Hold this for position for 30 seconds. If you can do this, move on to exercise Level 1c)\n"+
            "c)	Put one foot in front of the other as close as you feel comfortable with. Hold onto something for balance. Hold this for position 30 seconds. Repeat with the other foot in front. If you can do this comfortably & safely, try this without holding onto anything.",
        "image": "assets/images/recoveryImages/b1E1.png"
      },
      //level 2
      {
        "text":"Level 2: (for those who could balance on 1 leg prior to this injury)\n"+
            "a)	Holding on to a firm surface for balance, aim to stand on just your injured leg, making sure it doesn’t increase your pain. Hold this position for 30 seconds. Once you can achieve this pain-free, move on to exercise Level 2b).\n"+
            "b)	As above but without holding on to anything for balance. Hold this position for 30 seconds. If you can do this, move onto exercise Level 2c).\n"+
            "c)	Progress to attempting the above exercise with your eyes closed. Always stand in a safe environment with a firm surface nearby should you require it. Hold this position for 10 seconds.",
        "image": "assets/images/recoveryImages/b1E2.png"
      },
    ],

    "Heel Raises":"Stand. Hold on to a stable object for support. Push up onto your toes, lifting your heels. Repeat 10 times.",
  "Advice":
    "Smoking cessation:\n"+
    "Stopping smoking during the healing phase of your fracture will help ensure optimal recovery from this injury."

    "Cold packs:\n"+
    "A cold pack (ice pack or frozen peas wrapped in a damp towel) can provide short-term pain relief. Apply this to the sore area for up to 15 minutes every few hours, ensuring the ice is never in direct contact with the skin."

    "Rest and elevation:\n"+
    "Try to rest the foot for the first 24-72 hours after your injury to allow the early stage of healing to begin."

    "Raise your ankle above the level of your hips to reduce swelling. You can use pillows or a stool to keep your foot up."

    "Early movement and exercise:\n"+
    "Early movement of the ankle and foot is important to promote circulation and reduce the risk of developing a DVT (blood clot). Early weight bearing (putting weight through your injured foot) helps increase the speed of healing. Try to walk as normally as possible as this will help with your recovery."
  ,
};
  static var recoveryPlan1={
    "WeberA":[
      "0",
      "4",
      "4",
      "6",
      "6",
      "12",
      "12",
      "13"
    ],
    "WeberB":[
      "0",
      "6",
      "6",
      "8",
      "8",
      "12",
      "12",
      "13"
    ],
    "Phases":[
      //phase1
      "•	Wear the cast with TENS all of the time when walking. You do not need to wear it in bed or when resting at home.\n"+
          "•	Use the crutches to take some of the weight off your foot, as required.\n"+
          "•	Start Stage 1 Exercises & Advice.",

      //phase2
      "•	Gradually discontinue using the boot and elbow crutches. Try walking around the house without them first.\n"+
          "•	Wear the boot with TENS when walking longer distances outdoors.\n"+
          "•	Move on to Stage 2 Exercises.",

      //phase3
      "•	Fracture should be largely united (healed).\n"+
          "•	Gradually resume normal activities as pain allows.\n"+
          "•	Heavier or more strenuous tasks, including long walks, may still be difficult and cause discomfort and swelling at this stage.\n"+
          "•	Begin Stage 3 Exercises if required.",

      //phase4
      "•	Symptoms will continue to improve over the next few months.\n"+
          "•	If you are still experiencing significant pain and / or stiffness please contact us for further advice / management .",
    ],
    "Stages":[
      {
        "text":"Exercises & Advice.",
        "text2":"",
        "Exercises":[
          "1.	Point your injured foot up and down within a comfortable range of movement. Repeat 10 times.",
          "2.	Alternately turn your foot outwards leading with the outer bored of your foot (little toe) and then turn your foot inwards leading with the inner border of your foot (big toe), as shown in the picture. Make sure you keep the rest of your leg still. Repeat 10 times.",
          "3.	Make circles with your foot in one direction, then repeat in the other direction. Repeat 10 times.",
        ],
        "Explanation":[
          "assets/images/recoveryImages/s1E1.png",
          "assets/images/recoveryImages/s1E2.png",
          null
        ]
      },
      {
        "text":"Exercises (3-4 times a day) ",
        "text2":"",
        "Exercises":[
          "1.	Sit with your injured leg straight out in front of you. Place a towel or dressing gown cord around your foot and pull it towards you until you feel a stretch in the back of your calf. Hold for 30 seconds. Repeat 3 times.",
          "2.	Sit on a chair. Cross your injured ankle over your other knee. Place your hand over the top of your ankle and stretch the top of your foot and ankle, pointing your toes downwards. Hold for 30 seconds. Repeat 3 times.\nOR\n"+
              "Place your foot on a chair behind you, as shown in the picture. Hold onto something for balance. Point your foot and ankle downwards. You should feel a stretch at the front of your foot & ankle. Hold or 30 seconds. Repeat 3 times.",
        ],
        "Explanation":[
          "assets/images/recoveryImages/s2E1.png",
          "assets/images/recoveryImages/s2E2.png",
        ]
      },
      {
        "text":"Exercises (3-4 times a day)",
        "text2":"These are optional advanced exercises designed for sports rehabilitation.",
        "Exercises":[
          "Level 1: \n"+
              "a)	Stand on your injured leg on an uneven surface (such as a pillow or a wobble board / cushion). Aim to hold this position for 30 seconds. Once you can achieve this pain-free, move onto exercise Level 1b).\n"+
              "b)	Progress to attempting the above exercise with your eyes closed. Always stand in a safe environment with a firm surface nearby should you require it. Aim to balance for 10 seconds.",
          "Level 2:\n"+
              "a)	Stand on your injured leg, with your hands together. Swing your arms in a figure of 8 in both directions for 30 seconds.\n"+
              "b)	As above, but with your eyes closed. Aim to balance for 10 seconds.",
        ],
        "Explanation":[
          "assets/images/recoveryImages/s3E1.png",
          "assets/images/recoveryImages/s3E2.png",
          null
        ]
      },
    ],
    "BalanceExercises":[
      //level 1
      {
        "text": "Level 1: (for those who could not balance on 1 leg prior to this injury)\n"+
            "a)	Stand with your feet as close together as possible. Hold onto something for balance. Hold this for position for 30 seconds. If you can do this, move on to exercise Level 1b)\n"+
            "b)	As above but do not hold onto anything for balance. Hold this for position for 30 seconds. If you can do this, move on to exercise Level 1c)\n"+
            "c)	Put one foot in front of the other as close as you feel comfortable with. Hold onto something for balance. Hold this for position 30 seconds. Repeat with the other foot in front. If you can do this comfortably & safely, try this without holding onto anything.",
        "image": "assets/images/recoveryImages/b1E1.png"
      },
      //level 2
      {
        "text":"Level 2: (for those who could balance on 1 leg prior to this injury)\n"+
            "a)	Holding on to a firm surface for balance, aim to stand on just your injured leg, making sure it doesn’t increase your pain. Hold this position for 30 seconds. Once you can achieve this pain-free, move on to exercise Level 2b).\n"+
            "b)	As above but without holding on to anything for balance. Hold this position for 30 seconds. If you can do this, move onto exercise Level 2c).\n"+
            "c)	Progress to attempting the above exercise with your eyes closed. Always stand in a safe environment with a firm surface nearby should you require it. Hold this position for 10 seconds.",
        "image": "assets/images/recoveryImages/b1E2.png"
      },
    ],

    "Heel Raises":"Stand. Hold on to a stable object for support. Push up onto your toes, lifting your heels. Repeat 10 times.",
    "Advice":
    "Smoking cessation:\n"+
        "Stopping smoking during the healing phase of your fracture will help ensure optimal recovery from this injury."

            "Cold packs:\n"+
        "A cold pack (ice pack or frozen peas wrapped in a damp towel) can provide short-term pain relief. Apply this to the sore area for up to 15 minutes every few hours, ensuring the ice is never in direct contact with the skin."

            "Rest and elevation:\n"+
        "Try to rest the foot for the first 24-72 hours after your injury to allow the early stage of healing to begin."

            "Raise your ankle above the level of your hips to reduce swelling. You can use pillows or a stool to keep your foot up."

            "Early movement and exercise:\n"+
        "Early movement of the ankle and foot is important to promote circulation and reduce the risk of developing a DVT (blood clot). Early weight bearing (putting weight through your injured foot) helps increase the speed of healing. Try to walk as normally as possible as this will help with your recovery."
    ,
  };
  static Map<String,dynamic> report={
    "tensD":false,
    "tensP":false,
    "tens":0,
    "isVisible":false,
    "date":DateTime.now(),
    "userName":"",
    "email":"",
    "details":
      {
      "name":"",
      "gender":"",
      "symptoms":"",
      "possibleInjury":"",
      "recommendation":"",
        "type":"",
      },
    "doctor":{
      "weber":"A",
      "date":DateTime.now(),
      "email":"",
      "name":"",
      "userName":"",
    },
    "recoveryPlan":{
    },

    "injuryImages":[],
    "xrayImages":[],
  };

  static setDetailsReport(String final_diagnose,String pre_diagnose,List symptoms){
    var details={
      "name":MyUser.FULLNAME,
      "gender":MyUser.GENDER,
        "symptoms":convertSymptoms(symptoms),
        "possibleInjury":"${pre_diagnose}"+"\n"+"${final_diagnose}",
        "recommendation":"",
        "type":"normal",
    };
    if(pre_diagnose.contains("fracture")){
      details["recommendation"]="${recommendations["fracture"]}";
      details["type"]="fracture";
    }else if(pre_diagnose.contains("sprain")){
      details["recommendation"]="${recommendations["sprain"]}";
      details["type"]="sprain";
    }
    report["details"]=details;
    report["userName"]=MyUser.USERNAME;
    report["email"]=MyUser.EMAIL;
    report["date"]=DateTime.now();
  }
  static setReport(var sReport){
    report={
      "email":sReport["email"],
      "tens":sReport["tens"],
      "tensD":sReport["tensD"],
      "tensP":sReport["tensP"],
      "isVisible":sReport["isVisible"],
      "date":sReport["date"].toDate(),
      "userName":sReport["userName"],
      "details":sReport["details"],
      "doctor":sReport["doctor"],
      "recoveryPlan":sReport["recoveryPlan"],
      "injuryImages":sReport["injuryImages"],
      "xrayImages":sReport["xrayImages"],
    };
  }
  static setecoveryplane(var sRecoveryPlan){
    recoveryPlan["WeberA"]=sRecoveryPlan["WeberA"];
    recoveryPlan["WeberB"]=sRecoveryPlan["WeberB"];
    recoveryPlan["Phases"]=sRecoveryPlan["Phases"];
    recoveryPlan["Stages"]=sRecoveryPlan["Stages"];
    recoveryPlan["BalanceExercises"]=sRecoveryPlan["BalanceExercises"];
    recoveryPlan["Heel Raises"]=sRecoveryPlan["Heel Raises"];
    recoveryPlan["Advice"]=sRecoveryPlan["Advice"];
  }
  static setRecoveryPlane(var recoveryPlan,var doctor){
    report["recoveryPlan"]=recoveryPlan;
    report["doctor"]=doctor;
    report["isVisible"]=true;
  }
  static setDoctor(var doctor){
    report["recoveryPlan"]=recoveryPlan;
    report["doctor"]=doctor;
    report["isVisible"]=true;
  }
  static  String convertSymptoms(List symptoms){
    String convert="";
    symptoms.forEach((element) {
      String element1=element.toString();
      if(element1.contains("Do you smoke")) {
          convert+="Smoking:";
          element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have pain")) {
        convert += "Pain:";
        element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have Ecchymosis")) {convert+="Ecchymosis:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have an osteoporosis")) {convert+="Osteoporosis:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have Absent pulse")) {convert+="Absent pulse:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have discolouration of the skin")) {convert+="Discolouration of the skin:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have a deformity of the ankle")) {convert+="Deformity of the ankle:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have joint swelling?")) {convert+="joint swelling:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      //else if(element1.contains("Enter the weight in Kg and the height in cm")) convert+="Overweight:";
      else if(element1.contains("Do you have stiffness in your ankle")) {convert+="Stiffness in ankle:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have difficulty and pain while walkin")){ convert+="Difficulty and pain while walking:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have bruising")) {convert+="Bruising:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Do you have swelling accompanied by pain right away")){ convert+="Swelling accompanied by pain:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Are you twisted your ankle")) {convert+=" Ankle twist:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else if(element1.contains("Are your age")) {convert+=" Age less 18:";
      element1.toLowerCase().contains("yes")?convert+=" yes\n":convert+=" no\n";}
      else convert+="${element1}\n";
    });
    return convert;
  }
}