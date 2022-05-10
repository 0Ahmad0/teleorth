import 'package:_finalproject/firebase/firebase.dart';
import 'package:flutter/material.dart';

import 'Each_report.dart';

class Injury_Image extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Injury_Image_();
  }
}

class Injury_Image_ extends State<Injury_Image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: const Color(0xFF4d8d6e),
            child: Row(
              children: [
                Positioned(
                  top: 10,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Each_report()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 35.0),
                const Text(
                  "Injury image",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),

              ],
            ),
          ),
          FirebaseController.listReport[FirebaseController.indexReport]["injuryImages"].length==1? SizedBox(height: 140):SizedBox(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(15.0),
              itemCount: FirebaseController.listReport[FirebaseController.indexReport]["injuryImages"].length,
              itemBuilder: (_,index){
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.all(8),
                  //  padding: EdgeInsets.all(10),
                  child: Image.network(FirebaseController.listReport[FirebaseController.indexReport]["injuryImages"][index]),/*Image.asset(
                "assets/images/injury.png",
                //width: 500,
                //height: 700,
              ),*/
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
/*
class ImageLead extends StatelessWidget {
  final String imageLoad;
  ImageLead({this.imageLoad});
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("images/cat.jpg"),
    );
  }
}
*/