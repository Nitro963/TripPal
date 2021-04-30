import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/services/validators.dart';

class SearchWidget extends StatelessWidget {
  final Key _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _city;
    String _date;
    return Positioned(
        top: SizeConfig.blockSizeVertical * 7.5,
        child: Container(
          height: SizeConfig.blockSizeVertical * 40,
          width: SizeConfig.blockSizeHorizontal * 100,
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //city Text Field
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "City",
                        hintStyle: TextStyle(color: Colors.grey[300])),
                    validator: validateCity,
                    onSaved: (val) => _city = val,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Check In - Check Out",
                        hintStyle: TextStyle(color: Colors.grey[300])),
                    //validator: validateCity,
                    onSaved: (val) => _date = val,
                  ),
                ),
                //   DropdownButtonFormField<String>()
              ],
            ),
          ),
        ));
  }
}
