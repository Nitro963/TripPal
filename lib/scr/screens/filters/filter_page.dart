import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Trip/trip_resulte_screen.dart';
import 'package:travel_app/scr/shared/constants.dart';

import 'components/rounded_button.dart';
import 'components/rounded_check_box.dart';
import 'components/rounded_gesture_widget.dart';
import 'components/rounded_widget.dart';
import 'components/trip_types_widget.dart';



class FiltersPageV2 extends StatefulWidget {
  FiltersPageV2({Key key, @required this.content}) : super(key: key);
  final List<String> content;
  final List<String> types = [
    'Historic',
    'Cultural',
    'Natural',
    'Religion',
    'Sport',
    'Architecture',
  ];
  @override
  _FiltersPageV2State createState() => _FiltersPageV2State();
}

class _FiltersPageV2State extends State<FiltersPageV2> {
  bool foodsChecked = false;
  bool shopsChecked = false;
  RxBool _exSelected = false.obs;
  RxBool _fuSelected = false.obs;
  double _value = 3;

  List<Widget> _content = List<Widget>.empty(growable: true).obs;

  Map<String, RxBool> _contentCheck = Map<String, RxBool>();
  @override
  void initState() {
    super.initState();
    for (String type in widget.types) {
      _contentCheck[type] = false.obs;
      _content.add(new RoundedGestWidget(
        title: type,
        selected: _contentCheck[type],
        onTap: () {
          _contentCheck[type] = _contentCheck[type].toggle();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var roundedSliderTheme = SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.blue[700],
                            inactiveTrackColor: Colors.blue[100],
                            trackShape: RoundedRectSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8.0),
                            thumbColor: Colors.blue[900],
                            overlayColor: Colors.blueAccent.withAlpha(32),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 8.0),
                            tickMarkShape: RoundSliderTickMarkShape(),
                            activeTickMarkColor: Colors.blue[700],
                            inactiveTickMarkColor: Colors.blue[100],
                            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: Colors.blueAccent,
                            valueIndicatorTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Slider(
                            value: _value,
                            min: 1,
                            max: 14,
                            divisions: 13,
                            label: '$_value',
                            onChanged: (value) {
                              setState(
                                () {
                                  _value = value;
                                },
                              );
                            },
                          ),
                        );
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                              child: Text(
                                'Tell us your preferences',
                                style: kPrimaryFiltersTitleStyle,
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.rocket,
                              size: 24.0,
                              color: Colors.blue[900],
                            )
                          ],
                        ),
                        Text('And we will help to build best trips special for you',
                            style: kSeconderyFiltersTitleStyle),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        child: Text(
                          'Countries',
                          textAlign: TextAlign.left,
                          style: kFiltersSubTitle
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        height: 50.0,
                        child: ListView.builder(
                          itemCount: widget.content.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return RoundedWidget(
                              title: widget.content[index],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        child: Text(
                          'Place Types',
                          textAlign: TextAlign.left,
                          style: kFiltersSubTitle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        height: 50.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _content,
                        ),
                      ),
                      TripTypeRow(exSelected: _exSelected, fuSelected: _fuSelected),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 10.0),
                        child: Text(
                          'Tourist Facilities',
                          textAlign: TextAlign.left,
                          style: kFiltersSubTitle
                        ),
                      ),
                      FilterCheckBox(
                        title: 'Foods Inculded',
                        icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                        onTap: (selected) {
                          setState(() {
                            foodsChecked = !foodsChecked;
                          });
                        },
                      ),
                      FilterCheckBox(
                        title: 'Shops Inculded',
                        icon: Icon(Icons.check, color: Colors.white, size: 18.0),
                        onTap: (selected) {
                          setState(() {
                            shopsChecked = !shopsChecked;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 50.0),
                        child: Text(
                          'Number of Days',
                          textAlign: TextAlign.left,
                          style: kFiltersSubTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: roundedSliderTheme,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('1 day'),
                        Text('2 weeks'),
                      ],
                    ),
                  ),
                  RoundedButton(
                      title: 'Save Preferences',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TripPage()),
                        );
                      },
                      color: Colors.blue[800],
                      textColor: Colors.white),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
