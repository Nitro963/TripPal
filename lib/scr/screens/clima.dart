import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:travel_app/scr/models/weather_info.dart';
import 'package:travel_app/scr/services/transformers.dart';
import 'package:intl/intl.dart';

class Clima extends StatefulWidget {
  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  var controller = TransformerPageController(itemCount: 1);

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   print(controller.page);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                // Navigator.pop(context);
              }),
          actions: [
            // IconButton(
            //   icon: Icon(Icons.add, color: Colors.white),
            //   onPressed: () {
            //     // controller.jumpToPage(2);
            //     // controller.animateToPage(2,
            //     //     duration: Duration(milliseconds: 500),
            //     //     curve: Curves.easeInCubic);
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(children: [
          Image.asset(
            'images/night.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            colorBlendMode: BlendMode.darken,
            color: Colors.black38,
          ),
          Positioned(
              top: 90,
              left: 20,
              child: SmoothPageIndicator(
                controller: controller,
                count: controller.itemCount,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotWidth: 16,
                  dotHeight: 4,
                  spacing: 3,
                  expansionFactor: 2,
                ),
              )),
          TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              pageController: controller,
              itemCount: controller.itemCount,
              itemBuilder: (context, index) {
                return WeatherItem(
                  weatherInfo: WeatherInfo(),
                );
              }),
        ]));
  }
}

class WeatherItem extends StatelessWidget {
  final textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 35);

  final WeatherInfo weatherInfo;

  WeatherItem({Key key, @required this.weatherInfo}) : super(key: key);

  String _formatDateTime() {
    DateTime dt = DateTime.now().toUtc();
    if (weatherInfo.timeZoneShift < 0) {
      dt.subtract(Duration(seconds: -1 * weatherInfo.timeZoneShift));
    } else {
      dt.add(Duration(seconds: weatherInfo.timeZoneShift));
    }
    var formatter = DateFormat('hh:mm a - EEEE, d MMM y');
    return formatter.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
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
                      Text(_formatDateTime(),
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
                            "images/SVG/${weatherInfo.weatherIcon}.svg",
                            height: 45,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('${weatherInfo.weatherMainCondition}',
                                style: textStyle.copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
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
                          Text('Wind', style: textStyle.copyWith(fontSize: 16)),
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
        ),
      ),
    );
  }
}
