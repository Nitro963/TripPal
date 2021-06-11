import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/shared/constants.dart';

TextStyle disabledStyle = TextStyle(
    fontSize: 18,
    color: Color(0xffAAA1A1).withOpacity(.86),
    fontWeight: FontWeight.w600);
TextStyle activatedStyle = TextStyle(
    fontSize: 20,
    color: Color(0xff7BDC91).withOpacity(.86),
    fontWeight: FontWeight.w600);
Rx<int> selectedIndex = 0.obs;
class PagesIndecators extends StatelessWidget {
  final PageController controller;
  final int index;
  PagesIndecators({this.controller,this.index});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    selectedIndex.value=index;

    return Container(
      width: SizeConfig.blockSizeHorizontal * 80,
      height: SizeConfig.blockSizeVertical * 4.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xffA1A1A1).withOpacity(.16)),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: SizeConfig.blockSizeHorizontal),

            PageIndecectorItem(
                index: 0,
                title: "History",
                isSelected: selectedIndex.value == 0,
                onTapCallBack: (int index) {
                  selectedIndex.value = index;
                  controller.animateToPage(index,duration: Duration(milliseconds: 500),curve:Curves.slowMiddle);
                }),
            PageIndecectorItem(
                index: 1,
                title: "Faviourate",
                isSelected: selectedIndex.value == 1,
                onTapCallBack: (int index) {
                  selectedIndex.value = index;
                  controller.animateToPage(index,duration: Duration(milliseconds: 500),curve:Curves.slowMiddle);
                  
                }),
            PageIndecectorItem(
                index: 2,
                title: "Settings",
                isSelected: selectedIndex.value == 2,
                onTapCallBack: (int index) {
                  selectedIndex.value = index;
                  controller.animateToPage(index,duration: Duration(milliseconds: 500),curve:Curves.slowMiddle);

                }),
          
            SizedBox(width: SizeConfig.blockSizeHorizontal),
          ],
        ),
      ),
    );
  }
}

class PageIndecectorItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final TextStyle style;
  final int index;
  final Function(int) onTapCallBack;
  PageIndecectorItem(
      {this.title,
      this.isSelected,
      this.style,
      this.index,
      this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(title, style: isSelected ? activatedStyle : disabledStyle),
      onTap: () {
        onTapCallBack(index);
      },
    );
  }
}
