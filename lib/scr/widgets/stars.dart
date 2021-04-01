import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';

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
