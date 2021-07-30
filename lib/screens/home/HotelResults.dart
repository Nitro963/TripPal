import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_pal_null_safe/controllers/profile_controller.dart';
import 'package:trip_pal_null_safe/screens/details/place_details.dart';
import 'package:trip_pal_null_safe/screens/filtering/hotels_sort_page.dart';

import 'HotelCard.dart';

class HotelResult extends StatelessWidget{

  void _sortResults(){
    Get.bottomSheet(
      HotelSortWidget(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Available Hotels'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.filter), onPressed: () =>_sortResults())
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            HotelList(),
          ],
        ),
      ),
    );
  }
}


class HotelList extends StatefulWidget {
  const HotelList({
    Key? key,
  }) : super(key: key);

  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  final controller = Get.put(ProfileController());
  final _myListKey = GlobalKey<AnimatedListState>();
  final scrollingController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
          physics: BouncingScrollPhysics(),
          initialItemCount: controller.availableHotels.length,
          key: _myListKey,
          scrollDirection: Axis.vertical,
          controller: scrollingController,
          shrinkWrap: true,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(index % 2 == 0 ? 1 : -1, 0),
                        end: Offset(0, 0))
                    .animate(animation),
                child: HotelCard(
                    hotel: controller.availableHotels[index],
                    onTap: () => Get.to(PlaceDetails())));
          }),
    );
  }
}
