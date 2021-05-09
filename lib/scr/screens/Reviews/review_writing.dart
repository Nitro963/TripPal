import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/scr/shared/Constants/constants.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';
import 'package:travel_app/scr/shared/utils.dart';

class ReviewWriting extends StatefulWidget {
  @override
  _ReviewWritingState createState() => _ReviewWritingState();
}

class _ReviewWritingState extends State<ReviewWriting> {
  String reviewText = '';
  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Image.asset(
              'images/review-mod-.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6, bottom: 20),
                    child: Text('Write a Review',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline2
                            .copyWith(color: Colors.white70)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*ClickableStars(
                          callback: (indicator) {
                            setState(() {
                              rate = indicator;
                            });
                          },
                          starsModel: StarsModel(
                              5,
                              784 /
                                  (SizeConfig.blockSizeVertical *
                                      SizeConfig.blockSizeHorizontal)),
                          mainAxisAlignment: MainAxisAlignment.center),*/
                     
                           StarRating(
                             rating: rate,
                             mainAxisAlignment: MainAxisAlignment.center,
                            onRatingChanged: (indicator) {
                              setState(() {
                                rate = indicator;
                              });
                            },
                            size: 784 /
                                (SizeConfig.blockSizeVertical *
                                    SizeConfig.blockSizeHorizontal),
                          ),
                        
                      
                      Text(
                        'Tap a star to rate',
                        style: TextStyle(color: Colors.white54),
                      )
                    ],
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 6,
                        vertical: SizeConfig.blockSizeVertical * 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.025),
                        ],
                      ),
                    ),
                    child: TextField(
                        onChanged: (val) {
                          setState(() {
                            reviewText = val;
                          });
                        },
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            hintText: 'Review',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 6,
                        vertical: SizeConfig.blockSizeVertical),
                    width: double.infinity,
                    height: 6.5 * SizeConfig.blockSizeVertical,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (rate == 0)
                          Get.showSnackbar(buildErrorSnackBar(
                              'You must set a rating before submitting.'));
                        else {
                          if (reviewText.isEmpty)
                            Get.showSnackbar(buildErrorSnackBar(
                                'Review text can\'t be empty.'));
                          // TODO send a post request to TripPal servers.
                        }
                      },
                      // elevation: 15,
                      child: Text('Submit',
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
