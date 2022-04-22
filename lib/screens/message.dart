//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:_finalproject/screens/List_of_doctors.dart';
import 'patient/main_PagePatient.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
  final _firestore = FirebaseFirestore.instance;
    late  User signedInUser; //this will hold the email

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final messageTextController= TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText; //this will hold the message
  @override
   void initState() {
    super.initState();
    getCurrentUser();
  }
// try it with fetch
  void getCurrentUser() {
    try {
      final user = _auth.currentUser; // get the user email and password
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  // void getMessages() async{
  //   final messages = await _firestore.collection('messages').get();
  //  for (var message in messages.docs){ //docs represent the docs in the collection
  //     print(message.data()); //data is the docs value
  //  }
  // }
   void messagesStreams() async{
     await for (var snapshot in  _firestore.collection('messages').snapshots()){ //bring messages in real time 
      for (var message in snapshot.docs){ //snapshot method listen and wait for messages
        print(message.data());
      }
     }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          actions: [
            IconButton(onPressed: ()async{
              await _sendMessage();
            }, icon: Icon(Icons.access_time)),
          ],
            backgroundColor: const Color(0xFF4d8d6e),
            title: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Image(
                  image: AssetImage("assets/images/doctor.png"),
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                const Text('Dr. Ali Khaled')
              ],
            ),
            leading: IconButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const List_of_dotors()),
                );
              },
              icon: const Icon(Icons.arrow_back),
            )),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            messageStreamBuilder(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFF4d8d6e),
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText=value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                   
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Color(0xFF4d8d6e),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage() async{
    try{
      await FirebaseFirestore.instance
          .collection('messages').doc("2Ph0SdvtmQzhQ5SA8kGs").collection('chat').
      add({
        "date_message":DateTime.now(),
        "sender_email": "sender@gmail.com",
        "text": "text_message",
      });
    } catch(e){
      print(e);
    }

  }
}

class messageStreamBuilder extends StatelessWidget{
    const messageStreamBuilder({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>( //prints the messages to the screen
              stream: _firestore.collection('messages')
                  .orderBy('time')
                  .snapshots(),
              builder: (context,snapshot){
                List<messageLine> messageWidgets=[];// all the messages saved here
                if (!snapshot.hasData) { //is there data(messages) or not 
                  //////////add spinner 1:48
                }
                final messages=snapshot.data!.docs.reversed;
                for (var message in messages) { //print each message
                  final messageText = message.get('text'); //get the text
                  final messageSender = message.get('sender');//  the sender email
                  final currentUser= signedInUser.email; //the user currently signed in email
                  final messageWidget = 
                  messageLine(sender:messageSender, 
                  text:messageText,
                   isMe: messageSender==currentUser,
                   );
                  messageWidgets.add(messageWidget);             
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageWidgets,
                  ),
                );
              },
              
              );


  }
}





class messageLine extends StatelessWidget{
    const messageLine({required this.isMe,this.text, this.sender, Key? key}) : super(key: key);
final String? sender;
final String ?text;
final bool isMe;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$sender', 
          style: TextStyle(fontSize: 12, color: Colors.black45),),
          Material(
            elevation: 5,
            borderRadius: isMe? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ) 
            :
            BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ) ,
            color: isMe? Colors.blue[800]:Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,   horizontal: 20),
              child: Text('$text ',
                            style: TextStyle(fontSize: 15, color:isMe?Colors.white:Colors.black ),
                            ),
            ),
          ),
        ],
      ),
    );
  }
}