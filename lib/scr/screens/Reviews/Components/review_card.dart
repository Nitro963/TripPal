import 'package:flutter/material.dart';
import 'package:travel_app/scr/shared/Widgets/stars.dart';

class ReviewCard extends StatelessWidget {
  //TODO make it grow to full review text on user click
  const ReviewCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/11.jpg'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Istiak Remon',
                          style: TextStyle(
                              fontSize: 19, color: const Color(0xff24253D)),
                        ),
                        SizedBox(height: 5),
                        StaticStars(active: 4, starsModel: StarsModel(5, 17)),
                      ],
                    ),
                  ],
                ),
                Text('June 2017',
                    style: TextStyle(
                        fontSize: 15, color: const Color(0xff8C8C98))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5, right: 20),
              child: Text(
                  'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.',
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 15, color: const Color(0xff8C8C98))),
            ),
          ],
        ),
      ),
    );
  }
}
