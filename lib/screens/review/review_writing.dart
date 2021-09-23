import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:trip_pal_null_safe/dialogs/review_dialog.dart';
import 'package:trip_pal_null_safe/models/review.dart';
import 'package:trip_pal_null_safe/services/backend_service.dart';
import 'package:trip_pal_null_safe/utilities/error_handlers.dart';
import 'package:trip_pal_null_safe/utilities/size_config.dart';
import 'package:trip_pal_null_safe/utilities/utils.dart';
import 'package:trip_pal_null_safe/widgets/animated/stars.dart';

class ReviewWriting extends StatefulWidget {
  @override
  _ReviewWritingState createState() => _ReviewWritingState();
}

class _ReviewWritingState extends State<ReviewWriting> {
  String reviewText = '';
  double rate = 0;
  late final int place;

  @override
  void initState() {
    place = Get.arguments;
    super.initState();
  }

  bool inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: BackButton(color: Colors.white),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              Image.asset(
                'assets/images/review-mod-.jpg',
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: Spacing.only(left: 24, bottom: 24),
                      child: Text('Write a Review',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StarRating(
                          rating: rate,
                          mainAxisAlignment: MainAxisAlignment.center,
                          onRatingChanged: (indicator) {
                            setState(() {
                              rate = indicator;
                            });
                          },
                          size: MySize.getScaledSizeWidth(30),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Tap a star to rate',
                          style: TextStyle(color: Colors.white54),
                        )
                      ],
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      margin: Spacing.symmetric(vertical: 24, horizontal: 12),
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
                              hintStyle: TextStyle(
                                  color: Colors.white54, fontSize: 15),
                              hintText: 'Review',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    Container(
                      margin: Spacing.symmetric(horizontal: 12),
                      width: double.infinity,
                      height: MySize.getScaledSizeHeight(50),
                      child: ElevatedButton(
                        onPressed: sendReview, // elevation: 15,
                        child: Text('Submit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 19)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void sendReview() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (rate == 0)
      Get.showSnackbar(
          buildErrorSnackBar('You must set a rating before submitting.'));
    else {
      if (reviewText.isEmpty)
        Get.showSnackbar(buildErrorSnackBar('Review text can\'t be empty.'));
      else {
        setState(() {
          inAsyncCall = true;
        });
        Get.find<BackendService>().getApiView(name: 'reviews').postItem<Review>(
            {
              'review_text': reviewText,
              'place': place,
              'overall_rating': rate.toInt()
            },
            (data) => Review.fromJson(data)).then((value) {
          setState(() {
            inAsyncCall = true;
          });
          Get.back();
          Future.delayed(Duration(milliseconds: 200),
              () => Get.dialog(ReviewDialog(review: value)));
        }).onError((error, stackTrace) {
          handelError(error, sendReview);
        });
      }
    }
  }
}
