
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedAddButton extends StatelessWidget {
  const RoundedAddButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);
  final String title;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey[200]),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.plusCircle,
                      color: Colors.grey[500],
                      size: 18,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      title,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
