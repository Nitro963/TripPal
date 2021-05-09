import 'package:flutter/material.dart';
class TextWithAnmation extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  TextWithAnmation({this.child,this.padding});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: child,
      tween: Tween<double>(begin:0,end:1),
      duration: Duration(seconds: 10),
      builder: (context ,double _val,Widget child){
        return Opacity(
          opacity: _val,
          child: child
          ,);
      },
      );
      

  }
}