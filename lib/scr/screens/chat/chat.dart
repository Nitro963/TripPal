import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/models/message.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'component/message_bubble.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(Icons.close),
          //     onPressed: () {
          //       //Implement logout functionality
          //     }),
        ],
        title: Text('Traveling Assistant'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print("Back to Login");
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(children: [
                MessageBubble(
                    message: Message(
                        text: 'Hello World!', sender: 'Me', isMe: true)),
                MessageBubble(
                    message: Message(
                        text: 'Hello World!', sender: 'other', isMe: false)),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black54),
                          hintText: 'Type your message here...'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                    child: IconButton(
                        onPressed: () {
                          //Implement send functionality.
                        },
                        icon: ImageIcon(
                          AssetImage("images/submit-2.png"),
                          // color: Color(0xFF3A5A98),
                          color: Colors.lightBlueAccent,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
