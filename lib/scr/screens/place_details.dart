import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/image_card.dart';
import 'package:travel_app/scr/widgets/place_card.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:readmore/readmore.dart';

class PlaceDetails extends StatelessWidget {
  final data = ['5.jpg', '6.jpg', '7.jpg', '8.jpg'];
  final dataNames = ['Vienna', 'Venice', 'Scotland', 'Berlin'];
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    print("back");
                  }),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15.0, top: 10.0),
                  child: ListView(
                    children: [
                      Text('Place details',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline2
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ImageCard(data[index],
                                  SizeConfig.blockSizeHorizontal * 60);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20);
                            },
                            itemCount: data.length),
                      ),
                      SizedBox(height: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bali',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline1
                                  .copyWith(color: Colors.black)),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 20, color: const Color(0xffffaa00)),
                              Icon(Icons.star,
                                  size: 20, color: const Color(0xffffaa00)),
                              Icon(Icons.star,
                                  size: 20, color: const Color(0xffffaa00)),
                              Icon(Icons.star,
                                  size: 20, color: const Color(0xff8C8C98)),
                              Icon(Icons.star,
                                  size: 20, color: const Color(0xff8C8C98)),
                            ],
                          ),
                          SizedBox(height: 18),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 40,
                            child: OverflowView(
                              spacing: -5,
                              children: <Widget>[
                                CircleAvatar(
                                  child: InkWell(onTap: () {
                                    print('Go to 9 user review');
                                  }),
                                  backgroundImage: AssetImage('images/9.jpg'),
                                ),
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/10.jpg'),
                                ),
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/11.jpg'),
                                ),
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/12.jpg'),
                                ),
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/12.jpg'),
                                )
                              ],
                              builder: (context, remaining) {
                                return CircleAvatar(
                                  backgroundColor: Colors.black45,
                                  child: InkWell(
                                    onTap: () {
                                      print("Go to reviews screen");
                                    },
                                    child: Center(
                                      child: Text('$remaining+',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 18),
                          ReadMoreText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
                              colorClickableText:
                                  Theme.of(context).primaryColor,
                              trimMode: TrimMode.Length,
                              trimCollapsedText: '...Read more',
                              trimExpandedText: ' Less'),
                          SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text('Reviews',
                              //     style: Theme.of(context)
                              //         .primaryTextTheme
                              //         .headline3
                              //         .copyWith(color: Colors.black)),
                              CupertinoButton(
                                  child: Text(
                                    'Write a review',
                                    style: TextStyle(
                                      color: const Color(0xffffaa00),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onPressed: () {
                                    print('writing a review');
                                  })
                            ],
                          ),
                          SizedBox(height: 10),
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
                          Text('Places like Bali',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headline3
                                  .copyWith(color: Colors.black)),
                          SizedBox(height: 20),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 11,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return PlaceCard(
                                      data[index],
                                      SizeConfig.blockSizeHorizontal * 26,
                                      dataNames[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 15);
                                },
                                itemCount: data.length),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
