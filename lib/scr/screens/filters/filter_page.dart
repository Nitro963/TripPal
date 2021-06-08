import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Trip/trip_resulte_screen.dart';
import 'components/filter_sub_title.dart';
import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_check_box.dart';
import 'components/rounded_gesture_widget.dart';
import 'components/rounded_widget.dart';

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

enum TripMode { extendedTrip, focusedTrip }

class _FiltersPageV2State extends State<FiltersPageV2> {
  bool foodsChecked = false;
  bool shopsChecked = false;
  double _value = 3;
  TripMode _tripMode = TripMode.extendedTrip;

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
              FiltersHeader(
                title: 'Tell us your preferences',
                subTitle:
                    'And we will help to build best trips special for you',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FilterSubTitle(filterName: 'Selected Countries',),
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
                  FilterSubTitle(filterName: 'Place Types',),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _content,
                    ),
                  ),
                  FilterSubTitle(filterName: 'Tourist Facilities',),
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
                  FilterSubTitle(filterName: 'Trip Mode',),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Extended Trip',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Transform.scale(
                          scale: 1.4,
                          child: Radio<TripMode>(
                            value: TripMode.extendedTrip,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.blue[800]),
                            groupValue: _tripMode,
                            onChanged: (TripMode value) {
                              setState(() {
                                _tripMode = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Focused Trip',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Transform.scale(
                          scale: 1.4,
                          child: Radio<TripMode>(
                            value: TripMode.focusedTrip,
                            groupValue: _tripMode,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.blue[800]),
                            onChanged: (TripMode value) {
                              setState(() {
                                _tripMode = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilterSubTitle(filterName: 'Trip Duration',),
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
                      icon: Icon(FontAwesomeIcons.solidSave,
                      color: Colors.white, size: 18.0),
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
