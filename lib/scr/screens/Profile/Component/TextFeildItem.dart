import 'package:flutter/material.dart';

class TextFeildItem extends StatelessWidget {
  final String label;
  final String value;
  final Function onChangeCallBack;
  TextFeildItem({this.label, this.onChangeCallBack, this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,style:TextStyle(fontSize:20,color: Colors.grey,fontWeight: FontWeight.w400)),
                Padding(
      padding: const EdgeInsets.only(top: 6.0),
                  child: TextFormField(
                    autofocus: false,
          decoration: InputDecoration(
            border:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[50]),
              gapPadding: 24,
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          initialValue: value,
          onChanged: onChangeCallBack,
        ),
                ),]
      ),
    );
  }
}