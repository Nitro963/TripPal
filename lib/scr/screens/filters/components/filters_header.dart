import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class FiltersHeader extends StatelessWidget {
  const FiltersHeader({
    Key key, 
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                child: Text(
                  title,
                  style: kPrimaryFiltersTitleStyle,
                ),
              ),
              Icon(
                FontAwesomeIcons.rocket,
                size: 24.0,
                color: Colors.blue[900],
              )
            ],
          ),
          Text(subTitle,
              style: kSeconderyFiltersTitleStyle,
              textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
