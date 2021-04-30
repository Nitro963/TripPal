import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/screens/Profile/Component/InfoContainer.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/Widgets/BottomNavigationBar.dart';
import 'package:travel_app/scr/shared/services/location.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _picker = ImagePicker();
  List<RadioModel> gender = [
    RadioModel(false, "Male"),
    RadioModel(false, "female"),
    RadioModel(false, "other")
  ];
  File image;
  @override
  Widget build(BuildContext context) {
    //  LocationCustom loc = Get.find<LocationCustom>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              child: image == null
                                  ? Icon(
                                      Icons.person,
                                      color: Colors.grey[500],
                                      size: 60,
                                    )
                                  : null,
                              radius: 80,
                              foregroundImage: image != null
                                  ? Image.file(image).image
                                  : null,
                              backgroundColor: Colors.grey[100],
                            ),
                            Positioned(
                                bottom: SizeConfig.blockSizeVertical * 3,
                                right: SizeConfig.blockSizeHorizontal * .05,
                                child: CircleAvatar(
                                  child: GestureDetector(
                                      onTap: () async {
                                        final tmp = await _picker.getImage(
                                            source: ImageSource.gallery);
                                        print(tmp.path);
                                        setState(() => image = File(tmp.path));
                                      },
                                      child: Icon(Icons.camera_alt,
                                          color: Colors.white, size: 20)),
                                  radius: 20,
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                )),
                          ],
                        ))),
                Item(
                  label: "First Name",
                  value: "Amgad",
                ),
                Item(
                  label: "Last Name",
                  value: "All Najjar",
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 4),
                Text("Gender",
                    style: TextStyle(color: Colors.grey, fontSize: 19)),
                Container(
                  height: SizeConfig.blockSizeVertical * 10,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      //padding: EdgeInsets.symmetric(horizontal:12),
                      itemCount: gender.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            splashColor: Colors.blueAccent,
                            onTap: () {
                              setState(() {
                                gender.forEach(
                                    (element) => element.isSelected = false);
                                gender[index].isSelected = true;
                              });
                            },
                            child: RadioItem(gender[index]));
                      }),
                ),
                Item(label: "Email Adress", value: "email@gmail.com"),
                Item(label: "Phone", value: "0997493103"),
                Item(label: "Location", value: "Damscus")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String label;
  final String value;
  Item({this.label, this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 19),
        ),
        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
        initialValue: value,
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _item.isSelected ? Colors.transparent : Colors.black,
                ),
                borderRadius: BorderRadius.circular(4),
                color:
                    _item.isSelected ? Colors.blueAccent : Colors.transparent,
              ),
              child: Center(
                  child: _item.isSelected
                      ? Icon(
                          Icons.check_sharp,
                          color: Colors.white,
                          size: 18,
                        )
                      : null)),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(_item.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
