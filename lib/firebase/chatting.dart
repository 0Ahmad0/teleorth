import 'package:_finalproject/firebase/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Chatting {
  static String name="";
  static String userName="";
  static String? EMAIL;
  static String? NAME;
  static String? ID_CHAT;
  static String? ID_MESSAGE;
  static String? DOCTOR_EMAIL;
  static String? PATIENT_EMAIL;
  static String? DOCTOR_NAME;
  static String? PATIENT_NAME;
  static String? TEXT_MESSAGE;
  static String? TYPE_USER;
  static String? TYPE_USER2;
  static DateTime? TEXT_DATE;
  static var listHellper;
  static var LISTUSER=[];
  
  static Future<bool> getIdMessages() async {
    try {
      await FirebaseFirestore.instance
          .collection('messages')
          //.where("doctor_email", isEqualTo: "doctor@gmail.com")
          .where("doctor_email", isEqualTo: "${DOCTOR_EMAIL}")
          //.where("patient_email", isEqualTo: "patient@gmail.com")
           .where("patient_email", isEqualTo: "${PATIENT_EMAIL}")
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          print("id : " + value.docs[0].id);
          ID_CHAT = value.docs[0].id;
          return true;
        } else {
          ID_CHAT ="null";
         addChat();
          return false;
        }
     // print('Heelllo');
      });
    } on FirebaseException catch (e) {
      print(e.message);
  }
  return false;
}

  static Future<void> sendMessage() async {
    try {
      if(ID_CHAT=="null") {
        await addChat();
      }else{

        await FirebaseFirestore.instance
            .collection('messages')
        //  .doc("2Ph0SdvtmQzhQ5SA8kGs")
            .doc("${ID_CHAT}")
            .collection('chat',)
            .add({
          "date_message": DateTime.now(),
          // "sender_email": "sender@gmail.com",
          "sender_email": "${EMAIL}",
          // "text": "text_message",
          "text": "${TEXT_MESSAGE}",
        }).then((value) => {print("done send message")});
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addChat() async {
    try {

      await FirebaseFirestore.instance.collection('messages').add({
        // "doctor_email": "doctor3@gmail.com",
        "doctor_email": "${DOCTOR_EMAIL}",
        // "patient_email": "patient3@gmail.com",
        "patient_email": "${PATIENT_EMAIL}",
      }).then((value) => value.collection("chat").add({
            "date_message": DateTime.now(),
            "sender_email": "",
            "text": "create",
          }).then((value) => {
                print("Done Add Chat!"),
                getIdMessages(),
              }));
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  static Future<bool> deleteMessage() async {
    bool isDeleted = false;
    try {
      await FirebaseFirestore.instance
          .collection('messages')
          .doc('${ID_CHAT}')
          .collection('chat')
          .doc('${ID_MESSAGE}')
          .delete()
          .then((value) {
        isDeleted = true;
        print("done delete chat");
      });
    } on FirebaseException catch (e) {
      print(e.message);
    }
    return isDeleted;
  }

  static  getMessages() async {
  try {
      final snapshot = await FirebaseFirestore.instance
          .collection('messages')
          .doc("${ID_CHAT}")
          .collection('chat').snapshots();
      if(snapshot!=null){
        print("length messages : " + "${snapshot.length}");
  }
      return snapshot;
    /*.get()
          .then((value) => {
                print("length messages : " + "${value.docs.length}"),
              });*/
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
  
  static String formatTimestamp(Timestamp timestamp) {
    var format =  new DateFormat('yMMMMd'); // <- use skeleton here
    //return format.format(timestamp.toDate());
    return DateFormat.yMMMMd()
        .add_jms()
        .format(timestamp.toDate());
  }
  
  static Future<bool> addPatient()async{

    try{
     // await getPatient().docs.isNotEmpty;
      true?
      await FirebaseFirestore.instance
          .collection("additives")
          .add({
         "doctor_email": "doctor@gmail.com",
        //"doctor_email": "${DOCTOR_EMAIL}",
        //  "patient_email": "patient@gmail.com",
        "patient_email": "${PATIENT_EMAIL}",
       /* "doctor_name": "doctor",
        //"doctor_email": "${DOCTOR_EMAIL}",
        "patient_name": "patient",
        //"patient_email": "${PATIENT_EMAIL}",*/
        "date_add":DateTime.now(),
      }).then((value) => print("done add patient"))
          :print("a patient already found");
    }on FirebaseException catch(e){
      print(e.message);
    }
    return true;
  }

  static getPatient()async{
    try{
      final snapshot =  await FirebaseFirestore.instance
          .collection("additives")
          .where("patient_email",isEqualTo: "${PATIENT_EMAIL}")
          .where("doctor_email",isEqualTo:"${DOCTOR_EMAIL}")
         // .where("patient_email",isEqualTo: "patient@gmail.com")
          //.where("doctor_email",isEqualTo:"doctor@gmail.com")
          .get();
      if(snapshot.docs.isNotEmpty){
        // print("length addvities : ${snapshot}");
         // print("done fetch pateint : "+snapshot.docs[0]['patient_email']);
          return true;
      }
    }on FirebaseException catch(e){
      print(e.message);
    }
    return false;
  }
  static Future<bool> getPatients1()async{
    try{
      if(name==""){
        await FirebaseFirestore.instance
            .collection("patient").get().then((snapshot) {
          if(snapshot.docs.isNotEmpty){
            // print("length addvities : ${snapshot}");
            if(snapshot.docs.isNotEmpty)
              print("done fetch pateints ");
            snapshot.docs.forEach((element) {
             //* print(element['displayName']);
            });
          }else{
            print("NOT FOUND PATIENS");
          }
          listHellper=snapshot.docs;
          return true;
        });
      }else{
        await FirebaseFirestore.instance
            .collection("patient").get().then((snapshot) {
          if(snapshot.docs.isNotEmpty){
            // print("length addvities : ${snapshot}");
            if(snapshot.docs.isNotEmpty)
              print("done fetch pateints ");
            snapshot.docs.forEach((element) {
           //*   print(element['displayName']);
            });
          }else{
            print("NOT FOUND PATIENS");
          }
          var list=[];
          list.clear();
          snapshot.docs.forEach((element) {
            //print("name : "+element['displayName'].toLowerCase());
            //print("ok : "+"${ element['displayName'].toLowerCase().contains(name)}");
            element['displayName'].toLowerCase().contains(name)?list.add(element):"";
          });
          //print("length : "+"${list.length}");
          listHellper=list;
          //print("length : "+"${listHellper.length}");
          return true;
        });
      }



    }on FirebaseException catch(e){
      print(e.message);
    }
    return false;
  }

  static Future<bool> getPatients()async{
    try{

        await FirebaseFirestore.instance
            .collection("patient").where("userName",isEqualTo: userName).get().then((snapshot) {
          if(snapshot.docs.isNotEmpty){
            // print("length addvities : ${snapshot}");
            if(snapshot.docs.isNotEmpty)
              print("done fetch pateints i");
            snapshot.docs.forEach((element) {
          //*    print(element['userName']);
            });
          }else{
            print("NOT FOUND PATIENS");
          }
          listHellper=snapshot.docs;
          //print(listHellper.length);
          return true;
        });




    }on FirebaseException catch(e){
      print(e.message);
    }
    return false;
  }
  static Future<bool> getAdditives() async{
  //  name="";
    LISTUSER=[];
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('additives')
          //.where('doctor_email',isEqualTo: "doctor@gmail.com")
         .where('${MyUser.TYPEUSER}_email',isEqualTo:"${EMAIL}")
          .get();
            if(snapshot.docs.isNotEmpty){
              print("done emails additives :" );
              for(int i=0;i<snapshot.docs.length;i++){
                //print(snapshot.docs[i]["${TYPE_USER2}"]);
                print(snapshot.docs[i]["patient_email"]);
              }
              listHellper=snapshot.docs;
              /*for(int i=0;i<snapshot.docs.length;i++){
                print(i);
                String? name=await getNameEmail(
                  //email: listHellper[i]["${TYPE_USER2}"],
                  email: listHellper[i]["patient_email"],
                  typeUser: "patient",
                );
                listHellper[i]["name"]=name;
                print("name : "+ listHellper[i]["name"]);
                //print("name"+listHellper[i]['doctor_email']);
              }*/
              return true;
            }else{
              print("NOT FOUND Eamil");
            }
    } on FirebaseException catch (e) {
      print(e.message);
    }
    return false;
  }
  static Future<bool> getAdditives1() async{
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('additives')
      //.where('doctor_email',isEqualTo: "doctor@gmail.com")
          .where('${MyUser.TYPEUSER}_email',isEqualTo:"${EMAIL}")
          .get();
      if(snapshot.docs.isNotEmpty){
        print("done emails additives :" );
        for(int i=0;i<snapshot.docs.length;i++){
          //print(snapshot.docs[i]["${TYPE_USER2}"]);
          print(snapshot.docs[i]["patient_email"]);
        }
        listHellper=snapshot.docs;
        /*for(int i=0;i<snapshot.docs.length;i++){
                print(i);
                String? name=await getNameEmail(
                  //email: listHellper[i]["${TYPE_USER2}"],
                  email: listHellper[i]["patient_email"],
                  typeUser: "patient",
                );
                listHellper[i]["name"]=name;
                print("name : "+ listHellper[i]["name"]);
                //print("name"+listHellper[i]['doctor_email']);
              }*/
        return true;
      }else{
        print("NOT FOUND Eamil");
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
    return false;
  }
  /*static Future<bool> getAdditives1()async{
    try{
      if(name==""){
        await FirebaseFirestore.instance
            .collection("additives")
           //.where('doctor_email',isEqualTo: "doctor@gmail.com")
            .where('${MyUser.TYPEUSER}_email',isEqualTo:"${EMAIL}")
            .get().then((snapshot) {
          if(snapshot.docs.isNotEmpty){
            print("done emails additives :" );
            for(int i=0;i<snapshot.docs.length;i++){
              //print(snapshot.docs[i]["${TYPE_USER2}"]);
              print(snapshot.docs[i]["patient_email"]);
            }
            listHellper=snapshot.docs;
          }else{
            print("NOT FOUND PATIENS");
          }
          return true;
        });
      }
      else{
        await FirebaseFirestore.instance
            .collection("additives")
        //.where('doctor_email',isEqualTo: "doctor@gmail.com")
            .where('${MyUser.TYPEUSER}_email',isEqualTo:"${EMAIL}")
            .get().then((snapshot) {
          if(snapshot.docs.isNotEmpty){
            print("done emails additives :" );
          }else{
            print("NOT FOUND PATIENS");
          }
          var list=[];
          //list.clear();
          snapshot.docs.forEach((element) {
            element['patient_email'].toLowerCase().contains(name)?list.add(element):"";
          });
          //print("length : "+"${list.length}");
          listHellper=list;
          for(int i=0;i<list.length;i++){
            //print(snapshot.docs[i]["${TYPE_USER2}"]);
            print(list[i]["patient_email"]);
          }
          //print("length : "+"${listHellper.length}");
          return true;
        });
      }



    }on FirebaseException catch(e){
      print(e.message);
    }
    return false;
  }*/
  static Future<String?> getNameEmail({email,typeUser}) async {
    try{
      final snapshot =  await FirebaseFirestore.instance
          .collection("${typeUser}")
          .where("email",isEqualTo: "${email}")
          .get();
      if(snapshot.docs.isNotEmpty){
        LISTUSER.add(snapshot.docs[0]);
        // print("length addvities : ${snapshot}");
      //*  print("done fetch name : "+snapshot.docs[0]['displayName']);
        return snapshot.docs[0]['displayName'];
      }else{
        print("failed fetch name");
        return "";
      }
    }on FirebaseException catch(e){
      print(e.message);
    }
  }
}

class MSG{
  final DateTime? date_message;
  final String? message;
  final String? sender_email;
  final String? id;
  MSG({this.message,this.date_message,this.sender_email,this.id});
}

class Additives{
}