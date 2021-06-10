import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Trip/trip_resulte_screen.dart';
import 'components/filter_sub_title.dart';
import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_check_box.dart';
import 'components/rounded_gesture_widget.dart';
import 'components/rounded_slider.dart';
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
  bool _visible = false;

  bool foodsChecked = false;
  bool shopsChecked = false;

  TripMode _tripMode = TripMode.extendedTrip;

  List<Widget> _content = List<Widget>.empty(growable: true).obs;
  Map<String, RxBool> _contentCheck = Map<String, RxBool>();

  

  double _daysCount = 3;

  double _historic = 5;
  double _cultural = 5;
  double _natural = 5;
  double _religion = 5;
  double _sport = 5;
  double _architecture = 5;
  double _foods = 5;
  double _shops = 5;
  double _placesPerDay = 3;

  List<Widget> sliders = List<Widget>.empty(growable: true);

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

    // here is the problem :(
    List<Widget> buildSliders() {
      List<Widget> res = List<Widget>.empty(growable: true);
      for (String type in _contentCheck.keys) {
        if (_contentCheck[type].isTrue) {
          res.add(FilterSubTitle(
              filterName: 'How interested are you in ' + type + ' places?'));
          if (type == 'Sport') {
            res.add(FiltersSlider(
                count: _sport,
                min: '1',
                max: '10',
                sliderType: 'Rate',
                onChanged: (newValue) {
                  setState(() {
                    _sport = newValue;
                  });
                }));
          } else if (type == 'Historic') {
            res.add(FiltersSlider(
                count: _historic,
                sliderType: 'Rate',
                min: '1',
                max: '10',
                onChanged: (newValue) {
                  setState(() {
                    _historic = newValue;
                  });
                }));
          } else if (type == 'Cultural') {
            res.add(FiltersSlider(
                count: _cultural,
                sliderType: 'Rate',
                min: '1',
                max: '10',
                onChanged: (newValue) {
                  setState(() {
                    _cultural = newValue;
                  });
                }));
          } else if (type == 'Religion') {
            res.add(FiltersSlider(
                count: _religion,
                sliderType: 'Rate',
                min: '1',
                max: '10',
                onChanged: (newValue) {
                  setState(() {
                    _religion = newValue;
                  });
                }));
          } else if (type == 'Architecture') {
            res.add(FiltersSlider(
                count: _architecture,
                sliderType: 'Rate',
                min: '1',
                max: '10',
                onChanged: (newValue) {
                  setState(() {
                    _architecture = newValue;
                  });
                }));
          } else if (type == 'Natural') {
            res.add(FiltersSlider(
                count: _natural,
                sliderType: 'Rate',
                min: '1',
                max: '10',
                onChanged: (newValue) {
                  setState(() {
                    _natural = newValue;
                  });
                }));
          }
        }
      }
      res.add(FilterSubTitle(filterName: 'How many places would you like to go to in one day?'));
        res.add(FiltersSlider(
            count: _placesPerDay,
            sliderType: 'Rate',
            min: '1',
            max: '10',
            onChanged: (newValue) {
              setState(() {
                _placesPerDay = newValue;
              });
            }));
      if (foodsChecked) {
        res.add(FilterSubTitle(filterName: 'Your interest in foods'));
        res.add(FiltersSlider(
            count: _foods,
            sliderType: 'Rate',
            min: '1',
            max: '10',
            onChanged: (newValue) {
              setState(() {
                _foods = newValue;
              });
            }));
      }
      if (shopsChecked) {
        res.add(FilterSubTitle(filterName: 'Your interest in shopping'));
        res.add(FiltersSlider(
            count: _shops,
            sliderType: 'Rate',
            min: '1',
            max: '10',
            onChanged: (newValue) {
              setState(() {
                _shops = newValue;
              });
            }));
      }      
      return res;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: FiltersHeader(
                          title: 'Tell us your preferences',
                          subTitle:
                              'And we will help to build best trips special for you',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.slidersH,
                                size: 18.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  _visible = true;
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FilterSubTitle(
                        filterName: 'Selected Countries',
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
                      FilterSubTitle(
                        filterName: 'Place Types',
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        height: 50.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _content,
                        ),
                      ),
                      FilterSubTitle(
                        filterName: 'Tourist Facilities',
                      ),
                      FilterCheckBox(
                        title: 'Foods Inculded',
                        icon:
                            Icon(Icons.check, color: Colors.white, size: 18.0),
                        onTap: (selected) {
                          setState(() {
                            foodsChecked = !foodsChecked;
                          });
                        },
                      ),
                      FilterCheckBox(
                        title: 'Shops Inculded',
                        icon:
                            Icon(Icons.check, color: Colors.white, size: 18.0),
                        onTap: (selected) {
                          setState(() {
                            shopsChecked = !shopsChecked;
                          });
                        },
                      ),
                      FilterSubTitle(
                        filterName: 'Trip Mode',
                      ),
                      Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        padding:
                            const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
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
                        padding:
                            const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
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
                      FilterSubTitle(
                        filterName: 'Trip Duration',
                      ),
                      FiltersSlider(
                        count: _daysCount,
                        min: '3 Days',
                        max: '2 weeks',
                        sliderType: 'Days',
                        onChanged: (newValue) {
                          setState(() {
                            _daysCount = newValue;
                          });
                        },
                      ),
                      
                      SizedBox(
                        height: 30.0,
                      ),
                      RoundedButton(
                          title: 'Save Preferences',
                          icon: Icon(FontAwesomeIcons.solidSave,
                              color: Colors.white, size: 18.0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripPage()),
                            );
                          },
                          color: Colors.blue[800],
                          textColor: Colors.white),
                    ],
                  )
                ],
              ),
            ),
            Visibility(
              visible: _visible,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FiltersHeader(
                        title: 'Preferences Control',
                        subTitle:
                            'Tell us more about your preferences, and we\'ll build a trip specialized for you',
                      ),
                      Expanded(
                        child: ListView(
                            children: _visible == true ? buildSliders() : []),
                      ),
                
                      RoundedButton(
                          title: 'Save Controls',
                          onPressed: () {
                            setState(() {
                              _visible = false;
                            });
                          },
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          icon: Icon(
                            FontAwesomeIcons.save,
                            color: Colors.white,
                            size: 18.0,
                          ))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
