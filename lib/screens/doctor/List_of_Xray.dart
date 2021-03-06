// ignore_for_file: camel_case_types, file_names, deprecated_member_use, avoid_print, prefer_const_constructors

import 'package:_finalproject/const/get_size.dart';
import 'dart:io';

import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/screens/doctor/Mypatients.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import '../../report/details_report.dart';
import 'EachReportOfPatient.dart';
import 'Xray_pic.dart';

// Add loop when there is a pic in firebase then generate Card and display the pic in screen
class List_of_Xray extends StatefulWidget {
  const List_of_Xray({Key? key}) : super(key: key);

  @override
  State<List_of_Xray> createState() => _List_of_XrayState();
}

class _List_of_XrayState extends State<List_of_Xray> {
   PickedFile? image=null;
    void openCamera(BuildContext context)  async{
     final pickedFile = await ImagePicker().getImage(
       source: ImageSource.camera ,
     );
     image = pickedFile!;
     Navigator.pop(context);
     await uploadImage(context);

   }

    void openGallery(BuildContext context) async{
     final pickedFile = await ImagePicker().getImage(
       source: ImageSource.gallery ,
     );

     image = pickedFile!;
     Navigator.pop(context);
     await uploadImage(context);

   }
   ///
    Future<void> showChoiceDialog(BuildContext context) {
     return showDialog(context: context,builder: (BuildContext context){

       return AlertDialog(
         title: Text("Choose option",style: TextStyle(
             color:                           Color(0xFF4d8d6e)
         ),),
         content: SingleChildScrollView(
           child: ListBody(
             children: [
               Divider(height: 1,color: Color(0xFF4d8d6e),),
               ListTile(
                 onTap: (){
                   openGallery(context);
                 },
                 title: Text("Gallery"),
                 leading: Icon(Icons.account_box,
                   color: Color(0xFF4d8d6e),),
               ),

               Divider(height: 1,color: Color(0xFF4d8d6e),),
               ListTile(
                 onTap: (){
                   openCamera(context);
                 },
                 title: Text("Camera"),
                 leading: Icon(Icons.camera,
                   color: Color(0xFF4d8d6e),),
               ),
             ],
           ),
         ),);
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Xray Pictures",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getScreenSize(context).width * 0.075
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_photo_alternate_rounded),
        onPressed: ()async{
          await showChoiceDialog(context);
          print(image!.path);
        },
      ),
      body:  FutureBuilder(
    future: FirebaseController.fetchReportDoctor(),
    builder: (context, snapShot) {
    if (!snapShot.hasData) {
    return Center(child: CircularProgressIndicator());
    } else{
      var list=FirebaseController.report["xrayImages"];
      return list==null
          ?Center(child: Text('No doctors found!'),)
          :ListView.builder(
          padding: EdgeInsets.all(10.0),
          //TODO : Set Your List Here Nagel
          itemCount:  FirebaseController.report["xrayImages"].length,
          itemBuilder: (_,index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Xray_pic()),
                );
              },
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF4d8d6e), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                color: Colors.white70,
                child: Expanded(
                  child: FlatButton(
                    onPressed: () {
                      FirebaseController.indexXrayImages=index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Xray_pic()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 7),
                      child: Row(
                        children: [
                          Icon(
                            Icons.microwave_outlined,
                            color: Color(0xFF3b6b54),
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "#${(index + 1)}_" +
                                "${DateFormat.yMd().format(FirebaseController.report["xrayImages"][index]["date"].toDate())}",
                            //"#1_06-07-2021",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      );
    }}),
    );
  }
   Future uploadImage(BuildContext context) async {
     try {
       String path = basename(image!.path);
       File _image=File(image!.path);
//FirebaseStorage storage = FirebaseStorage.instance.ref().child(path);
       Reference storage = FirebaseStorage.instance.ref().child('xray/$path');
       UploadTask storageUploadTask = storage.putFile(_image);
       TaskSnapshot taskSnapshot = await storageUploadTask;
      /* Scaffold.of(context).showSnackBar(SnackBar(
         content: Text('Image uploaded successfully'),
       ));*/
       String url = await taskSnapshot.ref.getDownloadURL();
       List xrayImages=FirebaseController.report["xrayImages"];;
       xrayImages.add({"image":url,"date":DateTime.now()});
       final awt=await FirebaseFirestore.instance.collection("reports").
       doc(FirebaseController.listReport[FirebaseController.indexReport].id).
       update({
         "xrayImages":xrayImages,
       }).then((value) => {
         print('url $url'),
       //  FirebaseController.fetchReportDoctor(),

       });
       Navigator.pop(context);
       //Navigator.push(context, Mypatients());
     } catch (ex) {
       print(ex);
       /*Scaffold.of(context).showSnackBar(SnackBar(
         content: Text("Please, upload the image"), //ex.message
       ));*/
     }
   }
}
