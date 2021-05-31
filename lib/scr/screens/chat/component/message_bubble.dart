import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key key, @required this.message}) : super(key: key);

  Row buildRow(BuildContext context) {
    var rowChildren = [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0.0),
        child: Text(message.sender,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .apply(color: Colors.black54)),
      ),
      Material(
          borderRadius: BorderRadius.only(
              topRight: !message.isMe ? Radius.circular(30.0) : Radius.zero,
              topLeft: message.isMe ? Radius.circular(30.0) : Radius.zero,
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
          elevation: 5.0,
          color: message.isMe ? Colors.lightBlueAccent : Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(message.text,
                style: Theme.of(context).textTheme.bodyText1),
          ))
    ];

    return Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: message.isMe ? rowChildren.reversed.toList() : rowChildren);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.0), child: buildRow(context));
  }
}
