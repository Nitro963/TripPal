import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/Animation/Heart.dart';
import 'package:travel_app/scr/shared/Animation/StarAnimation.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
/*
class StarsModel {
  final int starCount;
  final double starSize;

  const StarsModel(this.starCount, this.starSize);
}

class StaticStars extends StatelessWidget {
  final int active;
  final StarsModel starsModel;
  final MainAxisAlignment mainAxisAlignment;

  const StaticStars(
      {Key key,
      this.active,
      this.starsModel = const StarsModel(5, 20),
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        for (int i = 0; i < starsModel.starCount; i++)
          Icon(Icons.star,
              size: starsModel.starSize,
              color: i < active ? starsActivationColor : starsDeactivationColor)
      ],
    );
  }
}

class ClickableStars extends StatefulWidget {
  final void Function(int indicator) callback;
  final StarsModel starsModel;
  final MainAxisAlignment mainAxisAlignment;

  const ClickableStars(
      {Key key,
      this.callback,
      this.starsModel = const StarsModel(5, 20),
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  _ClickableStarsState createState() => _ClickableStarsState();
}

class _ClickableStarsState extends State<ClickableStars> {
  List<bool> states;

  @override
  void initState() {
    super.initState();
    states = [for (int i = 0; i < widget.starsModel.starCount; i++) false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        for (int i = 0; i < states.length; i++)
          InkWell(
              child: Icon(Icons.star,
                  size: widget.starsModel.starSize,
                  color: states[i]
                      ? starsActivationColor
                      : starsDeactivationColor),
              onTap: () {
                setState(() {
                  for (int j = 0; j < states.length; j++)
                    if (j <= i)
                      states[j] = true;
                    else
                      states[j] = false;
                });
                if (widget.callback != null) widget.callback(i + 1);
              })
      ],
    );
  }
}*/

typedef void RatingChangeCallback(double rating);

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final double size;
  final Color color;
  final bool isStatic;
  final MainAxisAlignment mainAxisAlignment;

  StarRating(
      {this.starCount = 5,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.isStatic = false,
      this.size = 15,
      this.rating = .0,
      this.onRatingChanged,
      this.color});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> with TickerProviderStateMixin {
  AnimationController rotationController;
  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 5500), vsync: this);
    super.initState();
  }

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= widget.rating) {
      icon = new Icon(
        Icons.star_border,
        size: widget.size,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > widget.rating - 1 && index < widget.rating) {
     /* icon = new Icon(
        Icons.star_half,
        size: widget.size,
        color: widget.color ?? starsActivationColor,*/
        icon = StarsAnimation(
          startWidget: Icons.star_half,
          endWidget: Icons.star_border,
          beginColor: Colors.grey,
          endColor: widget.color ?? starsActivationColor,
          size: widget.size

      );
    } else if (index == widget.rating - 1) {
      icon = StarsAnimation(
          startWidget: Icons.star,
          endWidget: Icons.star_border,
          beginColor: Colors.grey,
          endColor: widget.color ?? starsActivationColor,
          size: widget.size);
    } else {
      icon = new Icon(
        Icons.star,
        size: widget.size,
        color: widget.color ?? starsActivationColor,
      );
    }
    return new InkResponse(
        onTap: widget.onRatingChanged == null
            ? null
            : () => widget.onRatingChanged(index + 1.0),
        onDoubleTap: widget.onRatingChanged == null
            ? null
            : () => widget.onRatingChanged(index + .5),
        child:
            icon //SizedBox(height: widget.size,width:widget.size,child: icon),
        );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: new List.generate(
            widget.isStatic ? widget.rating.ceil() : widget.starCount,
            (index) => buildStar(context, index)));
  }
}
