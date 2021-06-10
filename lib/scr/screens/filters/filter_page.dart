import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/controllers/filters_controller.dart';
import 'package:travel_app/scr/screens/Trip/trip_resulte_screen.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'components/filters_header.dart';
import 'components/rounded_button.dart';
import 'components/rounded_check_box.dart';
import 'components/rounded_gesture_widget.dart';
import 'components/rounded_radio_button.dart';
import 'components/rounded_slider.dart';
import 'components/rounded_widget.dart';

class FiltersPageV2 extends StatefulWidget {
  FiltersPageV2({Key key, @required this.content}) : super(key: key);

  final FilterController controller = FilterController();
  final List<String> content;

  @override
  _FiltersPageV2State createState() => _FiltersPageV2State();
}

class _FiltersPageV2State extends State<FiltersPageV2> {
  FilterController controller = Get.put(FilterController());

  List<Widget> buildSliders() {
    List<Widget> res = List<Widget>.empty(growable: true);
    for (String type in controller.contentCheck.keys) {
      if (controller.contentCheck[type].value) {
        res.add(FilterSubTitle(filterName: 'How interested are you in ' + type + ' places?'));
        res.add(FiltersSlider(
            count: controller.contentValues[type],
            sliderType: 'Rate',
            min: '1',
            max: '10',
            onChanged: (newValue) {
              setState(() {
                controller.contentValues[type] = newValue;
              });
            }));
      }
    }
    res.add(FilterSubTitle(filterName: 'How many places would you like to go to in one day?'));
    res.add(FiltersSlider(
        count: controller.placesPerDay,
        sliderType: 'Rate',
        min: '1',
        max: '10',
        onChanged: (newValue) {
          setState(() {
             controller.placesPerDay = newValue;
          });
           
        }));
    if (controller.foodsChecked) {
      res.add(FilterSubTitle(filterName: 'Your interest in Foods & Drinks'));
      res.add(FiltersSlider(
          count: controller.foods,
          sliderType: 'Rate',
          min: '1',
          max: '10',
          onChanged: (newValue) {
            setState(() {
              controller.foods = newValue;
            });
              
          }));
    }
    if (controller.shopsChecked) {res.add(FilterSubTitle(filterName: 'Your interest in Shopping'));
      res.add(FiltersSlider(
          count: controller.shops,
          sliderType: 'Rate',
          min: '1',
          max: '10',
          onChanged: (newValue) {
            setState(() {
               controller.shops = newValue;
            });
             
          }));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
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
                                  controller.visible = true;
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
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.placeType.length,
                              itemBuilder: (ctx, i) {
                                var type = controller.placeType[i];
                                return RoundedGestWidget(
                                  title: type,
                                  selected: controller.contentCheck[type],
                                  onTap: () {
                                    controller.contentCheck[type].toggle();
                                  },
                                );
                              })),
                      FilterSubTitle(
                        filterName: 'Tourist Facilities',
                      ),
                      FilterCheckBox(
                        title: 'Foods Inculded',
                        icon:
                            Icon(Icons.check, color: Colors.white, size: 18.0),
                        onTap: (selected) {
                          setState(() {
                            controller.foodsChecked = !controller.foodsChecked;
                          });
                        },
                      ),
                      FilterCheckBox(
                        title: 'Shops Inculded',
                        icon:
                            Icon(Icons.check, color: Colors.white, size: 18.0),
                        onTap: (selected) {
                          setState(() {
                            controller.shopsChecked = !controller.shopsChecked;
                          });
                        },
                      ),
                      FilterSubTitle(
                        filterName: 'Trip Mode',
                      ),
                      RoundedRadioButton(idx : 0, title: 'Extended Trip', controller: controller),
                      RoundedRadioButton(idx : 1, title: 'Focused Trip', controller: controller),
                      FilterSubTitle(
                        filterName: 'Trip Duration',
                      ),
                      FiltersSlider(
                        count: controller.daysCount,
                        min: '3 Days',
                        max: '2 weeks',
                        sliderType: 'Days',
                        onChanged: (newValue) {
                          setState(() {
                            controller.daysCount = newValue;
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
              visible: controller.visible,
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
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
                            children: controller.visible == true
                                ? buildSliders()
                                : []),
                      ),
                      RoundedButton(
                          title: 'Save Controls',
                          onPressed: () {
                            setState(() {
                              controller.visible = false;
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
