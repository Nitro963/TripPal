import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/screens/filters/filter_page.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:get/get.dart';

import 'components/rounded_button.dart';
import 'components/rounded_gesture_widget.dart';

class CitiesPage extends StatefulWidget {
  CitiesPage({Key key}) : super(key: key);

  // final List<String> cities = List<String>.empty(growable: true).obs;
  // final RxBool _selected = false.obs;
  final List<String> cities = [
    'Bangkok',
    'Paris',
    'London',
    'Dubai',
    'Milan',
    'Singapore',
    'Kuala Lumpur',
    'New York',
    'Istanbul',
    'Tokyo',
    'Antalya',
    'Seoul',
    'Osaka',
    'Makkah',
    'Phuket',
    'Pataya',
    'Barcelona',
    'Palma De Mallorca',
    'Bali',
    'Hong Kong',
  ];
  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  List<Widget> _content = List<Widget>.empty(growable: true).obs;
  Map<String, RxBool> _contentCheck = Map<String, RxBool>();
  List<String> _selectedCities;
  @override
  void initState() {
    super.initState();
    for (String city in widget.cities) {
      _contentCheck[city] = false.obs;
      _content.add(new RoundedGestWidget(
        title: city,
        selected: _contentCheck[city],
        onTap: () {
          _contentCheck[city] = _contentCheck[city].toggle();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Center(
                      child: Text(
                        'Country',
                        style: kPrimaryFiltersTitleStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.angleLeft,
                                size: 20,
                              ),
                              Text('back')
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                    child: Text(
                      'Choose prefered countries',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'We\'ll use these countries as base for seaching places for you',
                  style: kSeconderyFiltersTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Wrap(
                    spacing: 10.0,
                    alignment: WrapAlignment.center,
                    runSpacing: 20.0,
                    children: _content),
              ),
              RoundedButton(
                  title: 'Add Countries',
                  onPressed: () {
                      _selectedCities = List<String>.empty(growable: true).obs;
                      for (String city in _contentCheck.keys)
                        if (_contentCheck[city] == true.obs)
                          _selectedCities.add(city);

                    if (_selectedCities.length > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FiltersPageV2(content: _selectedCities)),
                      );
                    }
                  },
                  color: Colors.blue[800],
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
