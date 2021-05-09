import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/RadioModel.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _item.isSelected ? Colors.transparent : Colors.black,
                ),
                borderRadius: BorderRadius.circular(4),
                color:
                    _item.isSelected ? Colors.blueAccent : Colors.transparent,
              ),
              child: Center(
                  child: _item.isSelected
                      ? Icon(
                          Icons.check_sharp,
                          color: Colors.white,
                          size: 18,
                        )
                      : null)),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(_item.text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}

