import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.color,
    @required this.textColor,
    @required this.icon
  }) : super(key: key);
  final String title;
  final onPressed;
  final Color color;
  final Color textColor;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
          onPressed:onPressed,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                SizedBox(width: 8.0,),
                Text(
                  title,
                  style: TextStyle(
                      color: textColor, fontSize: 18.0, fontFamily: 'Montserrat'),
                ),
              ],
            ),
          )),
    );
  }
}
