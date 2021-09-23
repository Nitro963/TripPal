import 'package:flutter/material.dart';

class FiltersSlider extends StatelessWidget {
  const FiltersSlider({
    Key? key,
    required this.count,
    required this.onChanged,
    required this.maxRange,
    required this.divisions,
    required this.minLabel,
    required this.maxLabel,
    required this.label,
  }) : super(key: key);

  final double count;
  final onChanged;
  final int maxRange;
  final int divisions;
  final String minLabel;
  final String maxLabel;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: CustomSliderTheme(
                currentSliderValue: count,
                label: label,
                minRange: 1,
                maxRange: maxRange,
                divisions: divisions,
                onChanged: onChanged)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(minLabel),
              Text(maxLabel),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSliderTheme extends StatelessWidget {
  const CustomSliderTheme(
      {Key? key,
      required this.currentSliderValue,
      required this.onChanged,
      required this.maxRange,
      required this.minRange,
      required this.divisions,
      required this.label})
      : super(key: key);

  final double currentSliderValue;
  final onChanged;
  final int minRange;
  final int maxRange;
  final int divisions;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
          value: currentSliderValue,
          min: minRange.toDouble(),
          max: maxRange.toDouble(),
          divisions: divisions,
          label: currentSliderValue.round().toString() + label,
          onChanged: onChanged),
    );
  }
}
