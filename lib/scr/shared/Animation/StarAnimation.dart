import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarsAnimation extends StatefulWidget {
  final IconData startWidget;
  final IconData endWidget;
  final Color beginColor;
  final Color endColor;
  final double size;
  StarsAnimation(
      {required this.startWidget,
      required this.beginColor,
      required this.size,
      required this.endColor,
      required this.endWidget});
  @override
  _StarsAnimationState createState() => _StarsAnimationState();
}

class _StarsAnimationState extends State<StarsAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _curveAnimation;
  late Animation<double> _sizeAnimation;
  bool _isRated = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _colorAnimation = ColorTween(begin: widget.beginColor, end: widget.endColor)
        .animate(_curveAnimation);
    _rotationAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 2 * math.pi), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2 * math.pi, end: 0), weight: 50)
    ]).animate(_curveAnimation);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.size, end: widget.size + 14),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.size + 14, end: widget.size),
          weight: 50),
    ]).animate(_curveAnimation);
    _controller.addListener(() {});
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        setState(() {
          _isRated = true;
        });
      else if (status == AnimationStatus.dismissed)
        setState(() => _isRated = false);
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        _controller.forward();
        return GestureDetector(
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Icon(
                _isRated ? widget.startWidget : widget.endWidget,
                size: _sizeAnimation.value,
                color: _colorAnimation.value,
              ),
            ),
            onTap: () {
              _controller.forward();
              if (_isRated) {
                _controller.forward();
                _isRated = true;
              } else {
                _controller.reverse();
                _isRated = false;
              }
            });
      },
    );
  }
}
