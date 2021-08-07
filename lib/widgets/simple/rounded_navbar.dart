import 'package:flutter/material.dart';

class RoundedNavBar extends StatelessWidget {
  const RoundedNavBar(
      {Key? key,
      required this.size,
      required this.actions,
      required this.color,
      required this.centerFloatingButton})
      : super(key: key);

  final Size size;
  final List<Widget> actions;
  final FloatingActionButton centerFloatingButton;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: size.width,
        height: 80,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(this.color),
            ),
            Center(heightFactor: 0.6, child: centerFloatingButton),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: actions),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  final Color color;

  BNBCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class RoundedNavBarItem extends StatelessWidget {
  const RoundedNavBarItem({
    Key? key,
    required this.itemColor,
    required this.ontap,
    required this.textStyle,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  final Color itemColor;
  final ontap;
  final TextStyle textStyle;
  final String label;
  final iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData, size: 20.0, color: itemColor),
            SizedBox(height: 4.0),
            Text(label, style: textStyle)
          ],
        ));
  }
}
