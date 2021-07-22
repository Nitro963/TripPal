import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/models/blog.dart';
import 'package:travel_app/scr/shared/Animation/Heart.dart';
import 'package:travel_app/scr/shared/constants.dart';

class BlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Blog",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlogTile(blog: blogs[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final Blog blog;
  BlogTile({required this.blog});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset(blog.image,
                    width: 90, height: 90, fit: BoxFit.cover)),
            SizedBox(width: 20),
            SizedBox(
              height: 90,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    blog.city.split(" ")[0],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    blog.city.split(" ")[1],
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                      blog.info.substring(
                          0, blog.info.length > 32 ? 32 : blog.info.length),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            //SizedBox(width: 20),
            // Center(child: Icon(Icons.favorite_border_outlined))
          ],
        ),
      ),
      Positioned(
          right: MySize.getScaledSizeWidth(3.5),
          top: MySize.getScaledSizeHeight(3.5),
          child: Center(
            child: Heart(
              size: 34,
              startingIcon: Icons.favorite_outline,
              endingIcon: Icons.favorite,
              tapCallBack: (bool t) {},
            ),
          ))
    ]);
  }
}
