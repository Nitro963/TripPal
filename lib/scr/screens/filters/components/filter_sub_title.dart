
import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';

class FilterSubTitle extends StatelessWidget {
  const FilterSubTitle({
    Key key, 
    @required this.filterName,
  }) : super(key: key);
  final String filterName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Text(
        filterName,
        textAlign: TextAlign.left,
        style: kFiltersSubTitle,
      ),
    );
  }
}