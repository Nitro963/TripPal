import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  final double size;
  final Color startingColor;
  final Function tapCallBack;
  final Color endingColor;
  final IconData startingIcon;
  final IconData endingIcon;

  Heart(
      {this.size = 30,
      this.startingColor = Colors.grey,
      this.tapCallBack,
      this.endingColor=Colors.red,
      this.endingIcon,
      this.startingIcon,
      });
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  Animation _curveAnimation;
  bool _isFav = false;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
    _colorAnimation =
        ColorTween(begin: widget.startingColor, end:widget.endingColor)
            .animate(_curveAnimation);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: widget.size, end: widget.size + 25),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin:  widget.size + 25, end: widget.size),
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
          onPressed: () {
            _isFav ? _controller.reverse() : _controller.forward();
            widget.tapCallBack(!_isFav);
          });
      },
    );
  }
}
