import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedGestWidget extends StatelessWidget {
  RoundedGestWidget({
    Key key,
    @required this.title,
    @required this.selected,
    @required this.onTap,
  }) : super(key: key);

  final String title;
  final RxBool selected;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey[200]),
                color: !selected.value ? Colors.grey[100] : Colors.blue[900],
              ),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: !selected.value ? Colors.black : Colors.white)),
            )),
      ),
    );
  }
}
