import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';

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
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final double size;
  final Color color;
  final bool isStatic;

  StarRating(
      {this.starCount = 5,
      this.isStatic = false,
      this.size = 15,
      this.rating = .0,
      this.onRatingChanged,
      this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: size,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: size,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: size,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: new List.generate(isStatic ? rating.ceil() : starCount,
            (index) => buildStar(context, index)));
  }
}
