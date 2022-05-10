import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/report/Report.dart';

import '../firebase/user.dart';

class DetailsReport{
  static var recommendations={
    "fracture":
        "•Don’t weight bearon the injured foot.\n•If there is wound,it must be coveredwith a sterile gauzeor cloth.\n" +
        "•Raise the leg and placeice on the swollen areafor less than 20 minutes.\n•See the doctor promptly.\n" +
        "•evaluate the stabilityof the joint.•inspect the knee joint.\n•Check neurovascularstatus of the limb.\n" +
        "•Pain relievingmedications",
    "sprain":
        "•Keep the ankle elevated(raised up) above the levelof the heart wheneverpossible, to decrease ankleswelling by lying downand propping the footon pillows.\n" +
        "•Place ice on theswollen area but Icingshould not be appliedfor any longer than20 minutes repeatedevery hour.\n" +
        "•Pain relievingmedications.•Put ACE bandage.\n•See your doctorif the swellingand pain continue.",
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
  static var report={
    "details":{
      "userName":"",
      "name":"",
      "gender":"",
      "date":DateTime.now(),
      "symptoms":"",
      "possibleInjury":"",
      "recommendation":"",
      "type":"",
    },
    "doctor":{
      "weber":"A",
      "date":DateTime.now(),
    },
    "recoveryPlan":{
    },
    "injuryImages":[],
    "xrayImages":[],
  };

  static setDetailsReport(String final_diagnose,String pre_diagnose){
    var details={
      "userName":MyUser.USERNAME,
      "name":MyUser.FULLNAME,
      "gender":MyUser.GENDER,
        "date":DateTime.now(),
        "symptoms":"${final_diagnose}"+"\n"+"${pre_diagnose}",
        "possibleInjury":"",
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
  }
}