import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FiltersSlider extends StatelessWidget {
  const FiltersSlider(
      {Key key,
      @required this.count,
      @required this.onChanged,
      @required this.sliderType
      })
      : super(key: key);

  final RxDouble count;
  final onChanged;
  final String sliderType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: CustomSliderTheme(
                currentSliderValue: count, 
                minRange: 1,
                maxRange: sliderType == 'Days' ? 14 : 10,
                divisions: sliderType == 'Days' ? 13 : 9,
                onChanged: onChanged)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(sliderType == 'Days' ? '3 Days' : '1'),
              Text(sliderType == 'Days' ? '2 Weeks' : 10.toString()),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomSliderTheme extends StatelessWidget {
  const CustomSliderTheme({
    Key key,
    @required this.currentSliderValue,
    @required this.onChanged,
    @required this.maxRange,
    @required this.minRange,
    @required this.divisions,
  }) : super(key: key);

  final RxDouble currentSliderValue;
  final onChanged;
  final int minRange;
  final int maxRange;
  final int divisions;
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
        child: Obx(() =>Slider(
            value: currentSliderValue.value,
            min: minRange.toDouble(),
            max: maxRange.toDouble(),
            divisions: divisions,
            label: currentSliderValue.value.round().toString(),
            onChanged: onChanged)),
      ),
    );
  }
}
