import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/shared/services/validators.dart';

class SearchWidget extends StatelessWidget {
  final Key _formKey = GlobalKey<FormState>();
  final _city = ''.obs;
  final _date = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MySize.getScaledSizeHeight(7.5),
        child: Container(
          height: MySize.getScaledSizeHeight(40),
          width: MySize.getScaledSizeWidth(100),
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
                    onSaved: (val) => _city.value = val!,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Check In - Check Out",
                        hintStyle: TextStyle(color: Colors.grey[300])),
                    //validator: validateCity,
                    onSaved: (val) => _date.value = val!,
                  ),
                ),
                //   DropdownButtonFormField<String>()
              ],
            ),
          ),
        ));
  }
}
