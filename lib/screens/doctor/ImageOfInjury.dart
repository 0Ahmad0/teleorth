import 'package:flutter/material.dart';

import 'EachReportOfPatient.dart';

class ImageOfInjury extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Injury_Image_();
  }
}

class Injury_Image_ extends State<ImageOfInjury> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                              builder: (context) => EachReportOfPatient()),
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
            SizedBox(height: 80),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(8),
              //  padding: EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/images.jpg",
                width: 400,
                height: 400,
              ),
            ),
          ],
        ),
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