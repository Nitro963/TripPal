import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/weather_buddy_controller.dart';
import 'package:travel_app/scr/models/weather_info.dart';
import 'package:intl/intl.dart' as intl;
import 'package:travel_app/scr/shared/Widgets/loading_spinner.dart';

class WeatherPage extends GetView<WeatherBuddyController> {
  final textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 35);

  final int index;

  WeatherPage({Key key, @required this.index}) : super(key: key);

  String _formatDateTime(WeatherInfo weatherInfo) {
    DateTime dt = DateTime.now().toUtc();
    dt = dt.add(Duration(seconds: weatherInfo.timeZoneShift));
    var formatter = intl.DateFormat('hh:mm a - EEEE, d MMM y');
    return formatter.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = controller.weatherStatus[index];
    return SafeArea(
      child: Obx(() => Padding(
          padding: EdgeInsets.all(20),
          child: controller.hasInfo[index]
              ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(weatherInfo.cityName, style: textStyle),
                        Text(_formatDateTime(weatherInfo),
                            style: textStyle.copyWith(fontSize: 14))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${weatherInfo.temperature.toInt()}\u00B0C',
                          style: textStyle.copyWith(
                              fontSize: 85, fontWeight: FontWeight.w300),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "images/The Weather Buddy/SVG/${weatherInfo.weatherIcon}.svg",
                              height: 45,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                  '${weatherInfo.weatherMainCondition}',
                                  style: textStyle.copyWith(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('Wind',
                                style: textStyle.copyWith(fontSize: 16)),
                            Text(
                                '${(weatherInfo.windSpeed * 3.6).toStringAsPrecision(2)} km/h',
                                style: textStyle.copyWith(fontSize: 24)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Cloudiness',
                                style: textStyle.copyWith(fontSize: 16)),
                            Text('${weatherInfo.cloudiness} %',
                                style: textStyle.copyWith(fontSize: 24)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Humidity',
                                style: textStyle.copyWith(fontSize: 16)),
                            Text('${weatherInfo.humidity} %',
                                style: textStyle.copyWith(fontSize: 24)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
              : LoadingSpinner())),
    );
  }
}
