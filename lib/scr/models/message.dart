import 'package:flutter/cupertino.dart';

class Message {
  String sender;
  String text;
  bool isMe;

  Message({@required this.sender, @required this.text, @required this.isMe});
}
