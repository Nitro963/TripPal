import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final RxDouble count;
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
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
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

  final RxDouble currentSliderValue;
  final onChanged;
  final int minRange;
  final int maxRange;
  final int divisions;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.blue[700],
          inactiveTrackColor: Colors.blue[100],
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 4.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          thumbColor: Colors.blue[900],
          overlayColor: Colors.blueAccent.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          activeTickMarkColor: Colors.blue[700],
          inactiveTickMarkColor: Colors.blue[100],
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.blueAccent,
          valueIndicatorTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        child: Obx(() => Slider(
            value: currentSliderValue.value,
            min: minRange.toDouble(),
            max: maxRange.toDouble(),
            divisions: divisions,
            label: currentSliderValue.value.round().toString() + label,
            onChanged: onChanged)),
      ),
    );
  }
}
