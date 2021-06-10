import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/screens/filters/components/filters_header.dart';
import 'package:travel_app/scr/screens/filters/filter_page.dart';
import 'package:get/get.dart';

import 'components/custom_appbar.dart';
import 'components/rounded_button.dart';
import 'components/rounded_gesture_widget.dart';

class CitiesPage extends StatefulWidget {
  CitiesPage({Key key}) : super(key: key);

  final List<String> cities = dummyCities;
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomAppbar(
          title: 'Country',
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              FiltersHeader(
                  title: 'Choose prefered countries',
                  subTitle:
                      'We\'ll use these countries as base for seaching places for you'),
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
                  icon: Icon(FontAwesomeIcons.plus,
                      color: Colors.white, size: 14.0),
                  onPressed: () {
                    _selectedCities = List<String>.empty(growable: true).obs;
                    for (String city in _contentCheck.keys)
                      if (_contentCheck[city] == true.obs)
                        _selectedCities.add(city);
                    if (_selectedCities.length > 0) {
                      Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                FiltersPageV2(content: _selectedCities)),
                      );
                    }
                  },
                  color: Colors.blue[800],
                  textColor: Colors.white),
              SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }
}
