import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedGestWithIconWidget extends StatelessWidget {
  RoundedGestWithIconWidget({
    Key key,
    @required this.title,
    @required this.selected,
    @required this.onTap,
    @required this.iconName,
  }) : super(key: key);

  final String title;
  final IconData iconName;
  final RxBool selected;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Obx(() => Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            // height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                  color: !selected.value ? Colors.grey[100] : Colors.grey[200]),
              color: !selected.value ? Colors.white : Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                iconName != null ?Icon(
                  iconName,
                  color: !selected.value ? Colors.blueGrey[900] : Colors.blueGrey[700],
                  size: 16.0,
                ): SizedBox(),
                SizedBox(
                  width: iconName != null ?8.0 : 0.0,
                ),
                Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: !selected.value ? Colors.black : Colors.blueGrey[700],
                        fontWeight: !selected.value ? FontWeight.normal : FontWeight.bold
                        )),
              ],
            ))),
      ),
    );
  }
}
