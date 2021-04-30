import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/DemoData.dart';
import 'package:travel_app/scr/models/blog.dart';

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
          // Spacer(),
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
  BlogTile({this.blog});
  @override
  Widget build(BuildContext context) {
    return Card(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blog.city.split(" ")[0],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(blog.city.split(" ")[1],
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColorLight)),
              Text(blog.info,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
            ],
          ),
          SizedBox(width: 20),
          Center(child: Icon(Icons.favorite_border_outlined))
        ],
      ),
    );
  }
}
