import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  const LabeledDivider({
    Key? key,
    required this.label,
    required this.height,
    this.color,
  }) : super(key: key);

  final String label;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final _color = color ?? Theme.of(context).dividerColor;
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: _color,
              height: height,
            )),
      ),
      Text(label),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 15.0, right: 10.0),
          child: Divider(
            color: _color,
            height: height,
          ),
        ),
      ),
    ]);
  }
}
