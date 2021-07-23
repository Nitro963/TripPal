import 'package:flutter/material.dart';

class AnimatedSyncIconButton extends StatefulWidget {
  final void Function()? onPressed;
  final Duration duration;
  final Color? color;

  const AnimatedSyncIconButton(
      {Key? key,
      this.onPressed,
      this.duration = const Duration(milliseconds: 1500),
      this.color})
      : super(key: key);

  @override
  AnimatedSyncIconButtonState createState() => AnimatedSyncIconButtonState();
}

class AnimatedSyncIconButtonState extends State<AnimatedSyncIconButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  void initState() {
    animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: -1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    animationController.reset();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: animation,
        child: IconButton(
            icon: Icon(Icons.sync, color: widget.color),
            onPressed: widget.onPressed));
  }
}
