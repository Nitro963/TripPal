import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/Models/DemoData.dart';
import 'package:travel_app/scr/screens/Hotels/HotelResults.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/scr/shared/Widgets/BottomNavigationBar.dart';
import 'package:travel_app/scr/shared/services/validators.dart';

class HotelSearchPage extends StatelessWidget {
  String _city = '';
  DateTimeRange _date;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(
          currentIndex: 3,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/BaiscBackground.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                        "TripPal will provide you what you really Need ",
                        style:TextStyle(
                            fontSize: 30, color: Colors.lightBlue[700])
                            ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Search for your perfect Hotel",
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    ),
                  ),
                  Spacer(),
                  // SizedBox(height: SizeConfig.blockSizeVertical * 5),

                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: SizeConfig.blockSizeVertical * 40,
                        child: Column(children: [
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _city != ''
                                            ? validateColor
                                            : deactivatedColor)),
                                hintText: "City",
                                prefixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(color: Colors.grey[300])),
                            validator: validateCity,
                            onSaved: (val) => _city = val,
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 5),
                          GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                  color: _date != null
                                      ? validateColor
                                      : deactivatedColor,
                                  width: 3,
                                ))),
                                child: Row(
                                  children: [
                                    SizedBox(width: 8),
                                    Icon(Icons.calendar_today_outlined,color: deactivatedColor,),
                                    SizedBox(width: 10),
                                    Text(_date == null
                                        ? "From - To"
                                        : "${DateFormat(DateFormat.MONTH_DAY).format(_date.start)} - ${DateFormat(DateFormat.MONTH_DAY).format(_date.end)}"
                                        //style:TextStyle()
                                        )
                                  ],
                                ),
                              ),
                              onTap: () async {
                                _date = await showDateRangePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(Duration(days: 365)));
                              }),
                          SizedBox(height: SizeConfig.blockSizeVertical * 5),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _city != ''
                                            ? validateColor
                                            : deactivatedColor)),
                                contentPadding: EdgeInsets.all(12)),
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            value: rooms[0],
                            items: rooms.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          FlatButton(
                            minWidth: SizeConfig.blockSizeHorizontal * 90,
                            child: Text(
                              "Search",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue[700],
                            onPressed: () {Get.to(HotelResult());},
                          ),
                        ])),
                  ),
                ],
              ),
            )));
  }
}
