import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/models/trip.dart';
import 'package:travel_app/scr/screens/trip/trip_result_screen.dart';
import 'components/custom_appbar.dart';
import 'components/saved_trips_header.dart';
import 'components/trip_widget.dart';

class UsersTripsScreen extends StatefulWidget {
  UsersTripsScreen({Key key, this.content}) : super(key: key);
  final List<Trip> content;

  @override
  _UsersTripsScreenState createState() => _UsersTripsScreenState();
}

class _UsersTripsScreenState extends State<UsersTripsScreen> {
  List<Widget> _content = List<Widget>.empty(growable: true);
  ScrollController controller = ScrollController();
  bool closeHeader = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    dummyTrips.forEach((element) {
      String _city = element.city;
      String _country = element.country;
      _content.add(
        new TripWidget(
          days: element.days,
          imgPath: 'images/$_city.jpg'.toLowerCase(),
          tripType: element.type,
          location: '$_city, $_country',
          details: element.details,
          onTap: () => Get.to(TripPage())
        ),
      );
    });
    controller.addListener(() {
      double value = controller.offset / 230.0;
      setState(() {
        topContainer = value;
        closeHeader = controller.offset > 3.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: UserTripsAppBar(),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AnimatedOpacity(
                opacity: closeHeader ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  height: closeHeader
                      ? 0
                      : MediaQuery.of(context).size.height * 0.1,
                  child: SavedTripsHeader(
                    title: 'Most Popular Plans',
                    subTitle: 'See some trips planned Manualy by other users',
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                controller: controller,
                itemCount: _content.length,
                itemBuilder: (BuildContext context, int index) {
                  double scale = 1.0;
                  if (topContainer > 0.5) {
                    scale = index + 0.5 - topContainer;
                    if (scale < 0) {
                      scale = 0;
                    } else if (scale > 1) {
                      scale = 1;
                    }
                  }
                  return Opacity(
                    opacity: scale,
                    child: Transform(
                        transform: Matrix4.identity()..scale(scale, scale),
                        alignment: Alignment.bottomCenter,
                        child: _content[index]),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
