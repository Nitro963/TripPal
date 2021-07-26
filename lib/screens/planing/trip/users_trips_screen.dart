import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/models/trip.dart';
import 'package:trip_pal_null_safe/screens/filtering/trip_filters_page.dart';
import '../../../dummy_data.dart';
import 'saved_trips_header.dart';
import 'trip_widget.dart';

class UsersTripsScreen extends StatefulWidget {
  UsersTripsScreen({Key? key, this.content = const []}) : super(key: key);
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: new TripWidget(
            days: element.days.length,
            imgPath: 'assets/images/$_city.jpg'.toLowerCase(),
            tripType: element.type,
            location: '$_city, $_country',
            details: element.details,
            // onTap: () => Get.to(TripPlan()),
          ),
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

  // TODO apply themes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.to(TripFiltersPage()),
              icon: Icon(
                FontAwesomeIcons.slidersH,
                size: 16,
              )),
        ],
        automaticallyImplyLeading: true,
        title: Text(
          'Trips',
        ),
      ),
      body: Container(
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
                height:
                    closeHeader ? 0 : MediaQuery.of(context).size.height * 0.1,
                child: SavedTripsHeader(
                  title: 'Most Popular Plans',
                  subTitle: 'See some trips planned Manualy by other users',
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  // TODO use controller and update values
                  await Future.delayed(Duration(seconds: 3));
                },
                child: ListView.builder(
                  controller: controller,
                  itemCount: _content.length,
                  physics: BouncingScrollPhysics(),
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
