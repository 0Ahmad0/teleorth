// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers, unnecessary_null_comparison, unused_field, unused_local_variable

import 'dart:io';
import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/firebase/firebase.dart';
import 'package:_finalproject/report/Report.dart';
import 'package:_finalproject/screens/patient/recovery_Plan_Summary.dart';
import 'package:path/path.dart' as p;
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:_finalproject/screens/patient/quetions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import '../../firebase/firebase.dart';
import '../../report/details_report.dart';
import 'main_PagePatient.dart';
import 'questions_screen.dart';

///import 'package:image_picker/image_picker.dart';

//main() => runApp(MyApp());

class Upload_injury extends StatefulWidget {
  const Upload_injury({Key? key}) : super(key: key);

  @override
  UploadPic createState() => UploadPic();
}

class UploadPic extends State<Upload_injury> {
  File? _image;
  String? _url;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                color: Color(0xFF4d8d6e),
                child: Row(
                  children: [
                    Positioned(
                      top: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const main_PagePatient()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.photo_outlined,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Injury Picture Upload",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Image(
                        image: AssetImage("assets/images/2.png"),
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: pickImage,
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                        )),
                  ),
                  Positioned(
                    top: 180,
                    child: Text(
                      "press to upload the image",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Center(
                    child: _image == null
                        ? null
                        : Image.file(
                            _image!,
                            width: MediaQuery.of(context).size.width  - 20.0,
                            height: MediaQuery.of(context).size.width  ,
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Builder(
                    builder: (context) => RaisedButton(
                      onPressed: () {
                      //  uploadImage(context);
                        List injuryImages=[];
                        if(_image!=null){
                          injuryImages.add("${basename(_image!.path)}");
                          DetailsReport.report["injuryImages"]=injuryImages;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>   QuestionsScreen()),
                        );
                      },
                      color: Color(0xFF4d8d6e),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      elevation: 10,
                      child: Text(
                        "Upload ",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    // ImagePicker _picker = ImagePicker();
    ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery/*ImageSource.camera*/);

    //var image = await ImagePicker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }
    setState(() {
      _image = File(image.path);
      //===============================================//
      SReport.report.InjuryImages.add(Imager(_image!,DateTime.now()));
      print(SReport.report.InjuryImages[0].file);
      //===============================================//
      /*setState(() {
      _image = image;*/
    });

    /*   void pickImage() async {
    ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      _image = File(image.path);
    });*/
  }

  Future uploadImage(BuildContext context) async {
    try {
      String path = basename(_image!.path);

//FirebaseStorage storage = FirebaseStorage.instance.ref().child(path);
      Reference storage = FirebaseStorage.instance.ref().child('patient/$path');
      UploadTask storageUploadTask = storage.putFile(_image!);
      TaskSnapshot taskSnapshot = await storageUploadTask;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Image uploaded successfully'),
      ));
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please, upload the image"), //ex.message
      ));
    }
  }
}




/*

//////////////////////////
Stack(
                alignment: AlignmentDirectional.centerStart,
                children: <Widget>[
                  Container (
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                    child: Image(
                      image: AssetImage("images/frame.png"),
                      width: 100,
                      height: 100,
                    ),
                  ),

                  Positioned(
                    top: 35,
                    left: 53,
                    child: GestureDetector(
                        onTap: pickImage,
                        child: const Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.grey,
                        )),
                  ),

                  const Positioned(
                    top: 80,
                    left: 40,
                    child: Text(
                      "Add Photo",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
                    child: _image == null
                        ? null
                        : Image.file(
                      _image!,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),

                  void pickImage() async {
    ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      _image = File(image.path);
    });
*/

