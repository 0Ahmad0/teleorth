import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'package:http/http.dart';
/*import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:async';*/
import 'List_of_Xray.dart';

// ignore: camel_case_types
class Xray_pic extends StatelessWidget {
  const Xray_pic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Positioned(
                        top: 10,
                        left: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: Color(0xFF4d8d6e),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const List_of_Xray()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      const Text(
                        "#1_6-7-2021",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27.0,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Positioned(
                        top: 10,
                        left: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                            size: 30.0,
                            color: Color(0xFF4d8d6e),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Image(
                  width: 400,
                  height: 500,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/AnkleSprain.jpg"),
                ),
              ),

              /* Image.network(
                get,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              FloatingActionButton(
                onPressed: () {
                  _onImageDownloadButtonPressed();
                },
                child: const Icon(
                  Icons.download,
                  size: 30.0,
                  color: Color(0xFF4d8d6e),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  /*void _onImageDownloadButtonPressed() async {
    _onLoading(true);
    print("_onImageSaveButtonPressed");
    var response = await http.get(get);
    filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
    _onLoading(false);
  }

  void _onLoading(bool t) {
    if (t) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: <Widget>[
                new CircularProgressIndicator(),
                new Text("Downloading"),
              ],
            );
          });
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: <Widget>[
                new Text("Done..."),
              ],
            );
          });
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
    }
  }*/
}
