import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/models/Hotel.dart';
import 'Component/HotelCard.dart';
import 'Component/UpperNavBar.dart';

class HotelResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          UpperNavBar(
            onTapCallBack: (index) {
              print(index.toString());
            },
          ),
          HotelList(),
        ],
      ),
    );
  }
}

class HotelList extends StatefulWidget {
  const HotelList({
    Key key,
  }) : super(key: key);

  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Hotel> _list=[];
  void initState(){
    super.initState();
       WidgetsBinding.instance.addPostFrameCallback((_) {
    myHotels.forEach((element) {
      _list.add(element);
      _listKey.currentState.insertItem(_list.length-1 ,  duration: const Duration(milliseconds: 2500)
);

    });});
  }

  @override
  Widget build(BuildContext context) {
  
    return AnimatedList(
        key:_listKey,
        shrinkWrap: true,
        initialItemCount: _list.length,
        itemBuilder: (context, index, animation) => SlideTransition(
              child: HotelCard(hotel: _list[index]),
              position: Tween<Offset>(
                  begin: Offset(index % 2 == 0 ? 1 : -1, 0),
                  end: Offset(0, 0)).animate(animation),
            ));
  }
}
