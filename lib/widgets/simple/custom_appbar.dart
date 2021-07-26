// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:trip_pal_null_safe/utilities/constants.dart';

// class CustomAppbar extends StatelessWidget {
//   const CustomAppbar({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.only(top: 25.0),
//           child: Center(
//             child: Text(
//               title,
//               style: kPrimaryFiltersTitleStyle.copyWith(color: Colors.black),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 100.0,
//           width: 80.0,
//           child: TextButton(
//               style: ButtonStyle(
//                 overlayColor: MaterialStateProperty.all<Color>(Colors.white),
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 30.0),
//                 child: Row(
//                   children: <Widget>[
//                     Icon(
//                       FontAwesomeIcons.angleLeft,
//                       color: Colors.black,
//                       size: 20,
//                     ),
//                     Text(
//                       'back',
//                       style: TextStyle(color: Colors.black),
//                     )
//                   ],
//                 ),
//               )),
//         ),
//       ],
//     );
//   }
// }
