import 'package:_finalproject/firebase/chatting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'List_Of_Patient.dart';

//import 'package:firebase_auth/firebase_auth.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final text_msg = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Chatting.EMAIL = "sender@gmail.com";
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF4d8d6e),
          title: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Image(
                image: AssetImage("assets/images/patient.png"),
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
             // const Text('Ali Khaled')
              Text('${Chatting.NAME}')
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => List_Of_Patient()),
              );
            },
            icon: const Icon(Icons.arrow_back),
          )),
      body: FutureBuilder(
        future: Chatting.getIdMessages(),
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('messages')
                        .doc("${Chatting.ID_CHAT}")
                        .collection('chat')
                        .snapshots(),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        var messages = snapShot.data!.docs;
                        List<MSG> msg = [];
                        DateTime? oldMessage=DateTime.now();
                        List<Map<String,dynamic>> newDay = [
                          {
                            "index": 0,
                            "date":DateTime.now(),
                          }
                        ];
                        for (var message in messages) {
                          print(message['text']);
                          final text_messages = message['text'];
                          final sender_messages = message['sender_email'];
                          final id_messages = message.id;
                          Timestamp date_messages = message['date_message'];
                          if (sender_messages != ""){
                            msg.add(MSG(
                                message: text_messages,
                                sender_email: sender_messages,
                                date_message:date_messages.toDate(),
                                id: id_messages
                            ));
                            if(oldMessage==null||oldMessage.isAtSameMomentAs(date_messages.toDate())){
                              print("${oldMessage}"+"trur");
                            }
                            oldMessage=date_messages.toDate();
                          }
                        }
                        msg.sort((a,b) => a.date_message!.compareTo(b.date_message!));
                        return Expanded(
                          child: ListView(
                            padding: EdgeInsets.all(12.0),
                            children: msg.map((e) {
                              return GestureDetector(
                                onLongPress: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(15.0),
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            margin: EdgeInsets.all(25),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              'Delete Message',style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: MediaQuery.of(context).size.width * 0.04
                                                          ),),
                                                        ),

                                                        Expanded(
                                                          child: Text(
                                                              'Delete This Message?'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [

                                                    TextButton(onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text('No',style: TextStyle(
                                                      color: Colors.red
                                                    ),)),
                                                    TextButton(onPressed: (){
                                                      Chatting.ID_MESSAGE=e.id;
                                                      Chatting.deleteMessage();
                                                      Navigator.pop(context);
                                                    }, child: Text('Yes',
                                                      style: TextStyle(
                                                          color: Colors.green
                                                      ),)),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  margin: EdgeInsets.only(
                                      left: Chatting.EMAIL == e.sender_email
                                          ? MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2
                                          : 10,
                                      top: 10,
                                      right: Chatting.EMAIL != e.sender_email
                                          ? MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2
                                          : 10,
                                      bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Chatting.EMAIL != e.sender_email
                                          /*Doctor Color Message*/? Colors.red
                                          /*Patient Color*/: Color(0xFF4d8d6e).withOpacity(.5),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft:
                                            Chatting.EMAIL != e.sender_email
                                                ? Radius.zero
                                                : Radius.circular(20.0),
                                        bottomRight:
                                            Chatting.EMAIL == e.sender_email
                                                ? Radius.zero
                                                : Radius.circular(20.0),
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        '${e.message}',
                                        textAlign:
                                            Chatting.EMAIL != e.sender_email
                                                ? TextAlign.end
                                                : TextAlign.start,
                                      ),
                                      Text(
                                        '${
                                        DateFormat().add_jm().format(
                                            e.date_message!
                                        )
                                        }',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(fontSize: 10.0,color: Colors.white),

                                      )
                                    ],
                                  ),
                                ),
                              );
                            }

                            ).toList(),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
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
                          child: Form(
                            key: _key,
                            child: TextFormField(
                              controller: text_msg,
                              // onChanged: (value) {
                              //   Chatting.TEXT_MESSAGE = value;
                              // },
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
                        ),
                        TextButton(
                          onPressed: () {
                            if(_key.currentState!.validate()){
                              Chatting.TEXT_MESSAGE = text_msg.text;
                              if(Chatting.TEXT_MESSAGE!.trim().isEmpty){
                                text_msg.clear();
                              }else{
                                Chatting.sendMessage();
                                text_msg.clear();
                              }

                            }
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
            );
          }
        },
      ),
    );
  }
}
