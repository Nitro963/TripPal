import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, required this.title, this.onPressed, required this.icon})
      : super(key: key);
  final String title;
  final void Function()? onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height:  6.5 * SizeConfig.blockSizeVertical,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(
                width: 8.0,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Montserrat'),
              ),
            ],
          )),
    );
  }
}
