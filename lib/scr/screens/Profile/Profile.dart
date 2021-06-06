import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/models/RadioModel.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/shared/Widgets/radio_item.dart';
import 'package:image_picker/image_picker.dart';

import 'Component/TextFeildItem.dart';

class ProfilePageController extends GetxController {
  Rx<String> fName = ''.obs;
  Rx<String> lName = ''.obs;
  Rx<String> email = ''.obs;
  Rx<String> imgPath = ''.obs;
  Rx<String> phone = ''.obs;
  Rx<int> genderIndex = 0.obs;
  String get fullName => fName.value + " " + lName.value;
}

class ProfilePage extends GetView {
  final ProfilePageController _controller = ProfilePageController();
  final _picker = ImagePicker();
  final List<RadioModel> gender = [
    RadioModel(false, "Male"),
    RadioModel(false, "female"),
    RadioModel(false, "other")
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
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
                            Obx(
                              () => CircleAvatar(
                                child: _controller.imgPath.value == ""
                                    ? Icon(
                                        Icons.person,
                                        color: Colors.grey[500],
                                        size: 60,
                                      )
                                    : null,
                                radius: 80,
                                foregroundImage: _controller.imgPath.value != ""
                                    ? Image.file(File(_controller.imgPath.value))
                                        .image
                                    : null,
                                backgroundColor: Colors.grey[100],
                              ),
                            ),
                            Positioned(
                                bottom: SizeConfig.blockSizeVertical * 3,
                                right: SizeConfig.blockSizeHorizontal * .05,
                                child: CircleAvatar(
                                  child: GestureDetector(
                                      onTap: () async {
                                        final tmp = await _picker.getImage(
                                            source: ImageSource.gallery);
                                        _controller.imgPath.value = tmp.path;
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
                TextFeildItem(
                  label: "First Name",
                  value: "Amgad",
                  onChangeCallBack: (val) {
                    _controller.fName.value = val;
                  },
                ),
                TextFeildItem(
                  label: "Last Name",
                  value: "All Najjar",
                  onChangeCallBack: (val) {
                    _controller.lName.value = val;
                  },
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 4),
                Text("Gender",
                    style: TextStyle(color: Colors.grey, fontSize: 19)),
                Container(
                  height: SizeConfig.blockSizeVertical * 10,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gender.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            splashColor: Colors.blueAccent,
                            onTap: () {
                              gender.forEach(
                                  (element) => element.isSelected = false);
                              gender[index].isSelected = true;
                              _controller.genderIndex.value = index;
                            },
                            child: Obx(() => RadioItem(gender[
                                _controller.genderIndex.value == index
                                    ? _controller.genderIndex.value
                                    : index])));
                      }),
                ),
                TextFeildItem(
                  label: "Email Adress",
                  value: "email@gmail.com",
                  onChangeCallBack: (val) {
                    _controller.email.value = val;
                  },
                ),
                TextFeildItem(
                  label: "Phone",
                  value: "0997493103",
                  onChangeCallBack: (val) {
                    _controller.phone.value = val;
                  },
                ),
                ElevatedButton(
                  child: Text("Save"),
                  onPressed: () {
                    //TODO: Save changes to the user
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
