import 'package:flutter/material.dart';

class GrowingIcon extends StatefulWidget {
  final double size;
  final Color startingColor;
  final void Function(bool)? tapCallBack;
  final Color endingColor;
  final IconData startingIcon;
  final IconData endingIcon;

  GrowingIcon({
    this.size = 25,
    this.startingColor = Colors.grey,
    this.tapCallBack,
    this.endingColor = Colors.red,
    required this.endingIcon,
    required this.startingIcon,
  });
  @override
  _GrowingIconState createState() => _GrowingIconState();
}

class _GrowingIconState extends State<GrowingIcon>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curveAnimation;
  bool _isFav = false;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
    _colorAnimation =
        ColorTween(begin: widget.startingColor, end: widget.endingColor)
            .animate(_curveAnimation);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.size, end: widget.size + 25),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.size + 25, end: widget.size),
          weight: 50),
    ]).animate(_curveAnimation);
    _controller.addListener(() {});
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        setState(() {
          _isFav = true;
        });
      else if (status == AnimationStatus.dismissed)
        setState(() => _isFav = false);
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
        return IconButton(
            icon: Icon(
              _isFav ? widget.endingIcon : widget.startingIcon,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () async {
              await (_isFav ? _controller.reverse() : _controller.forward());
              _isFav = !_isFav;
              if (widget.tapCallBack != null) {
                widget.tapCallBack!(_isFav);
              }
            });
      },
    );
  }
}
