import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trip_pal_null_safe/controllers/hotel_search_controller.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/widgets/simple/rounded_button.dart';

class HotelSearchPage extends GetView<HotelSearchController> {
  @override
  Widget build(BuildContext context) {
    final themeData = Get.theme;
    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          Image.asset('assets/images/hotel_sp.jpg',
              fit: BoxFit.cover,
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
              height: double.infinity,
              width: double.infinity),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.menu,
                              size: MySize.size24, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          }),
                    ],
                  ),
                  Container(
                    margin: Spacing.symmetric(horizontal: 30),
                    child: Text(
                        'Our Engine let\'s you find the most amazing hotels in the world, easily.',
                        style: themeData.textTheme.headline5!
                            .copyWith(color: Colors.white)),
                  ),
                  Container(
                    margin: Spacing.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeData.cardColor.withOpacity(0.86),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    child: Form(
                      key: controller.key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCityFormField(),
                          buildDateTimeFormField(themeData, context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildDropdownButtonFormField(
                                'Adults',
                                '2',
                                Icons.person,
                                (int? val) {
                                  controller.adults = val!;
                                },
                                Spacing.horizontal(5),
                              ),
                              buildDropdownButtonFormField(
                                  'Children', '2', MdiIcons.humanMaleChild,
                                  (int? val) {
                                controller.children = val!;
                              }, Spacing.only(right: 2)),
                            ]
                                .map(
                                  (e) => Container(
                                      margin: Spacing.only(bottom: 10),
                                      width: MySize.getScaledSizeWidth(150),
                                      child: e),
                                )
                                .toList(),
                          ),
                          Container(
                            margin: Spacing.only(bottom: 10),
                            width: MySize.getScaledSizeWidth(150),
                            child: buildDropdownButtonFormField(
                              'Rooms',
                              '2',
                              MdiIcons.door,
                              (int? val) {
                                controller.rooms = val!;
                              },
                              Spacing.horizontal(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RoundedButton(
                      title: 'Search',
                      onPressed: () {
                        // if (controller.key.currentState!.validate()) {
                        //   Get.toNamed(
                        //       '/home/hotels?city_name__contains=${controller.cityName}');
                        // }
                        // if (controller.key.currentState!.validate()) {
                        // TODO send argument
                        Get.toNamed('/home/hotels');
                        // }
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final cityFormKey = UniqueKey();
  TextFormField buildCityFormField() {
    final themeData = Get.theme;
    return TextFormField(
        key: cityFormKey,
        validator: (val) => val?.isEmpty == null || val?.isEmpty == true
            ? 'Please Enter a City'
            : null,
        controller: TextEditingController(text: controller.cityName),
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            labelText: 'City Name',
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            errorBorder: OutlineInputBorder(),
            focusedErrorBorder: OutlineInputBorder(),
            hintText: "London",
            errorStyle: themeData.textTheme.caption!.copyWith(
                color: themeData.errorColor, fontWeight: FontWeight.w600),
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(
                fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w500)),
        // validator: validateCity,
        onChanged: (val) => controller.cityName = val);
  }

  Widget buildDateTimeFormField(ThemeData themeData, BuildContext context) {
    return FormField(
      validator: (_) {
        if (controller.checkOutDate == null) return 'Please select';
        return null;
      },
      builder: (state) {
        return GestureDetector(
            child: Container(
              margin: Spacing.only(top: 24, bottom: 24),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey[500],
                      ),
                      SizedBox(width: 10),
                      Obx(() => Text(controller.formattedDate,
                          style: controller.checkOutDate != null
                              ? themeData.textTheme.bodyText1
                              : themeData.textTheme.bodyText2)),
                    ],
                  ),
                  if (state.hasError) ...[
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          state.errorText!,
                          style: themeData.textTheme.caption!.copyWith(
                              color: themeData.errorColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
            onTap: () async {
              DateTimeRange? _tmp = await showDateRangePicker(
                  initialEntryMode: DatePickerEntryMode.inputOnly,
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  initialDateRange: controller.checkOutDate != null
                      ? DateTimeRange(
                          start: controller.checkInDate!,
                          end: controller.checkOutDate!,
                        )
                      : null);
              if (_tmp != null) controller.updateDates(_tmp.start, _tmp.end);
            });
      },
    );
  }

  Widget buildDropdownButtonFormField(String label, String hint, IconData icon,
      void Function(int?) onChanged, EdgeInsetsGeometry padding) {
    final themeData = Get.theme;
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          errorStyle: themeData.textTheme.caption!.copyWith(
              color: themeData.errorColor, fontWeight: FontWeight.w600),
          alignLabelWithHint: true,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(),
          contentPadding: padding),
      style:
          themeData.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600),
      icon: const Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      onChanged: onChanged,
      validator: (val) => val == null ? 'Please select' : null,
      items: Iterable<DropdownMenuItem<int>>.generate(
          6,
          (int index) => DropdownMenuItem<int>(
                value: index + 1,
                child: Text((index + 1).toString(),
                    style: TextStyle(color: Colors.grey[600])),
              )).toList(growable: true),
    );
  }
}
