// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:travel_app/scr/controllers/todo_list_controller.dart';
// import 'package:travel_app/scr/models/tasks.dart';
// import 'package:get/get.dart';
//
// class CheckList extends StatefulWidget {
//   final String title = 'Lists';
//   final ToDoListController controller = Get.put(ToDoListController());
//   final List<Task> tasks;
//   final TaskCategory cat;
//   CheckList({required this.tasks, required this.cat});
//   @override
//   _CheckListState createState() => _CheckListState();
// }
//
// class _CheckListState extends State<CheckList> {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> list = [];
//     widget.tasks.forEach((element) => list.add(_build(element)));
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       // appBar: AppBar(
//       //   title: Text(widget.title),
//       // ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//                 top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.white,
//                   child: categoryIcon(widget.cat),
//                   // color: Colors.lightBlueAccent, size: 30.0),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(getCategoryName(widget.cat),
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline3!
//                         .copyWith(color: Colors.white)),
//                 Text(widget.tasks.length.toString()),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30.0),
//                     topRight: Radius.circular(30.0)),
//               ),
//               child: ListView(
//                 children: list,
//               ),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         tooltip: 'Create',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Widget _build(Task task) {
//     int index = widget.controller.tasks.indexOf(task);
//     return ListTile(
//       title: Text(widget.controller.tasks[index].title,
//           style: TextStyle(
//             decoration: widget.controller.tasks[index].done
//                 ? TextDecoration.lineThrough
//                 : null,
//           )),
//       trailing: Checkbox(
//           value: widget.controller.tasks[index].done,
//           onChanged: (val) {
//             setState(() => widget.controller.tasks[index].done = val!);
//             print(widget.controller.tasks[index].done);
//             print("${task.done} here");
//           }),
//       onLongPress: () {
//         setState(() => widget.controller.tasks.removeAt(index));
//       },
//     );
//   }
// }
