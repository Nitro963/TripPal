// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:travel_app/scr/controllers/todo_list_controller.dart';
// import 'package:travel_app/scr/models/tasks.dart';
// import "package:get/get.dart";
//
// import 'add_task_screen.dart';
// import 'check_list.dart';
// import 'component/grid_cards.dart';
//
// class CategorizedList extends GetView<ToDoListController> {
//   final String title = 'Lists';
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _myCards = [];
//     TaskCategory tappedCat;
//     controller.categories.forEach((catelement) => _myCards.add(GridCard(
//         item: catelement,
//         onTapCallBack: () {
//           List<Task> subTask = [];
//           tappedCat = catelement.title;
//
//           controller.tasks.forEach((element) {
//             if (catelement.title == TaskCategory.All) {
//               subTask = controller.tasks;
//             } else if (catelement.title == element.category) {
//               subTask.add(element);
//             }
//           });
//           Get.to(() => CheckList(tasks: subTask, cat: tappedCat));
//         })));
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               CircleAvatar(
//                 child: Icon(Icons.list, size: 30, color: Colors.grey),
//                 backgroundColor: Colors.white,
//               ),
//               SizedBox(height: 25),
//               Text(
//                 "Lists",
//                 style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.grey[700]),
//               ),
//               SizedBox(height: 25),
//               Flexible(
//                   child: GridView.count(crossAxisCount: 2, children: _myCards))
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => AddTask());
//         },
//         tooltip: 'Create',
//         backgroundColor: Colors.lightBlueAccent[200],
//         child: Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }
