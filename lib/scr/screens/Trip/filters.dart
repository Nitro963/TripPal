

import 'package:flutter/material.dart';
import 'package:travel_app/scr/screens/Home/place_details.dart';
import 'package:travel_app/scr/screens/Main/Componenet/constants.dart';
import 'package:travel_app/scr/screens/Trip/Component/rounded_button.dart';
import 'package:travel_app/scr/screens/Trip/Component/rounded_widget.dart';
import 'package:travel_app/scr/screens/Trip/trips.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen({Key key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  double _value = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Preferences',
                  textAlign: TextAlign.center,
                  style: kPrimaryTitleStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 70.0, bottom: 40.0, right: 20.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Places Type',
                    style: kSecondaryTitleStyle,
                  ),
                  Row(
                    children: <Widget>[
                      RoundedWidget(title: 'Historic'),
                      RoundedWidget(title: 'Cultural'),
                      RoundedWidget(title: 'Natural'),
                    ],
                  ),
                  Row(
                      children: <Widget>[
                        RoundedWidget(title: 'Religion'),
                        RoundedWidget(title: 'Sport'),
                        RoundedWidget(title: 'Architecture'),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      'Number Of days ',
                      style: kSecondaryTitleStyle,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.pink[700],
                      inactiveTrackColor: Colors.pink[100],
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      thumbColor: Colors.pinkAccent,
                      overlayColor: Colors.pinkAccent.withAlpha(32),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.pink[700],
                      inactiveTickMarkColor: Colors.pink[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.pinkAccent,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '1 day',
                          style: kSecondaryTitleStyle,
                        ),
                        Text(
                          '2 weeks',
                          style: kSecondaryTitleStyle,
                        ),
                        
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 38.0),
                    child: Text(
                      'Basics places',
                      style: kSecondaryTitleStyle,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RoundedWidget(title: 'Include foods'),
                      RoundedWidget(title: 'Include shops'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top : 38.0),
                    child: Text(
                      'Trip Mode',
                      style: kSecondaryTitleStyle,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RoundedWidget(title: 'Extended trip'),
                      RoundedWidget(title: 'ocused trip'),
                    ],
                  ),
                  SizedBox(height: 50.0,),
                  SizedBox(height: 50.0,),

                  RoundedButton(title: 'Confirem', onPressed: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TripPage()),
                        );
                  }, color: Colors.pink, textColor: Colors.white,),
                  RoundedButton(title: 'Reset', onPressed: (){
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlaceDetails()),
                        );
                  }, color: Colors.blueAccent, textColor: Colors.black,)
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
