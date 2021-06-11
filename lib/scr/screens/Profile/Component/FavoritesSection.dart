import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/shared/widgets/stars.dart';

class FavoritesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init();
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          FavoritesCard(),
          FavoritesCard(),
          FavoritesCard(),
          FavoritesCard(),
          FavoritesCard(),
          FavoritesCard(),
        ]);
  }
}

class FavoritesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: SizeConfig.blockSizeHorizontal * 45,
            height: SizeConfig.blockSizeVertical * 30,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red.withOpacity(.4)),
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100],
                      offset: Offset(1, 1),
                      blurRadius: 1)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: SizeConfig.blockSizeVertical * 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18)),
                        border: Border.all(color: Colors.red.withOpacity(.4)),
                        image: DecorationImage(
                            image: Image.asset("images/1.jpg").image,
                            fit: BoxFit.cover))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
                  child: Text("Paris",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: deactivatedColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: StarRating(size: 18, rating: 4),
                ),
                Spacer(),
              ],
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text("Reated In 2012/3/3",
                style: TextStyle(
                    color: deactivatedColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        Positioned(
            top: -20,
            right: -20,
            child: Icon(Icons.favorite, color: Colors.red, size: 40)),
        Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            right: SizeConfig.blockSizeHorizontal * 5,
            child: Icon(
              Icons.restaurant,
              size: 30,
              color: Colors.blueAccent,
            ))
      ],
    );
  }
}
