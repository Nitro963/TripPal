import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';

class InfoContainer extends StatelessWidget {
  final String leading;
  final String trailling;
  InfoContainer({this.leading, this.trailling});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: SizeConfig.blockSizeVertical * 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(1.8, 1.8),
                  color: Theme.of(context).primaryColorLight)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(leading,
                style: TextStyle(
                    fontSize: 18,
                    shadows: [
                      Shadow(
                          blurRadius: 2,
                          offset: Offset(4, 4),
                          color: Colors.grey.withOpacity(0.2))
                    ],
                    color: Colors.purpleAccent,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700)),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
            Text(trailling,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black54.withOpacity(0.6),
                )),
          ],
        ),
      ),
      onTap: () async {},
    );
  }
}
