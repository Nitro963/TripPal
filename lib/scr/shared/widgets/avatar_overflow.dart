import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:travel_app/scr/screens/review/reviews.dart';
import 'package:travel_app/scr/shared/constants.dart';

class AvatarOverFlowView extends StatelessWidget {
  final data = ['9.jpg', '10.jpg', '11.jpg', '12.jpg', '12.jpg'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 40,
      child: OverflowView(
        spacing: -5,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            CircleAvatar(
              child: InkWell(onTap: () {
                Get.to(() => Reviews());
              }),
              backgroundImage: AssetImage('images/${data[i]}'),
            ),
        ],
        builder: (context, remaining) {
          return CircleAvatar(
            backgroundColor: Colors.black45,
            child: InkWell(
              onTap: () {
                Get.to(() => Reviews());
              },
              child: Center(
                child: Text('$remaining+',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
          );
        },
      ),
    );
  }
}
