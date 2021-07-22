import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';

class AvatarOverFlowView extends StatelessWidget {
  final data = ['9.jpg', '10.jpg', '11.jpg', '12.jpg', '12.jpg'];
  final void Function()? onTap;

  AvatarOverFlowView({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MySize.getScaledSizeWidth(150),
      child: OverflowView(
        spacing: -5,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            CircleAvatar(
              child: InkWell(onTap: onTap),
              backgroundImage: AssetImage('assets/images/${data[i]}'),
            ),
        ],
        builder: (context, remaining) {
          return CircleAvatar(
            backgroundColor: Colors.black45,
            child: InkWell(
              onTap: onTap,
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
