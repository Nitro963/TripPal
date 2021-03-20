import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/stars.dart';

class ReviewWriting extends StatefulWidget {
  @override
  _ReviewWritingState createState() => _ReviewWritingState();
}

class _ReviewWritingState extends State<ReviewWriting> {
  String reviewText = '';
  int rate = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showErrorSnackBar(String error) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: new Duration(seconds: 2),
      content: new Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'images/review-mod.jpg',
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
                        left: SizeConfig.blockSizeHorizontal * 2),
                    child: BackButton(
                        color: Colors.white70,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
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
                    children: [
                      ClickableStars(
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
                          mainAxisAlignment: MainAxisAlignment.center),
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
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white54),
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
                    child: RaisedButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (rate == 0) {
                          showErrorSnackBar(
                              'You must set a rating before submitting.');
                        } else {
                          if (reviewText.isEmpty) {
                            showErrorSnackBar('Review text can\'t be empty.');
                          }
                          print("review sent");
                        }
                      },
                      elevation: 15,
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

// ListView(
//   shrinkWrap: true,
//   children: [
//     Card(
//       elevation: 25,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                       child: Icon(Icons.person)),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment
//                               .spaceBetween,
//                       children: [
//                         Column(
//                           mainAxisAlignment:
//                               MainAxisAlignment.start,
//                           crossAxisAlignment:
//                               CrossAxisAlignment
//                                   .start,
//                           children: [
//                             Text('UserName'),
//                             SizedBox(height: 3),
//                             Text('Review Date'),
//                             SizedBox(height: 3),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.star,
//                                 color: const Color(
//                                     0xffffaa00)),
//                             Icon(Icons.star,
//                                 color: const Color(
//                                     0xffffaa00)),
//                             Icon(Icons.star,
//                                 color: const Color(
//                                     0xffffaa00)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                     'This is review text.\nThis is review text\nThis is review text'),
//               )
//             ]),
//       ),
//     ),
//   ],
// ),
