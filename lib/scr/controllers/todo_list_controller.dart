// import "package:get/get.dart";
// import 'package:travel_app/scr/models/DemoData.dart';
// import "package:travel_app/scr/models/tasks.dart";
//
// class ToDoListController extends GetxController {
//   final tasks = myTasks.obs;
//   List categories = List<Task>.empty(growable: true).obs;
//   void addTask(Task task) {
//     tasks.add(task);
//     updateCatInfo(task.category);
//   }
//
//   void removeTask(Task task) {
//     tasks = tasks.removeAt(tasks.indexOf(task));
//   }
//
//   var _mapOfTasks = Map().obs;
//   void updateCatInfo(TaskCategory cat) {
//     print(tasks.length);
//     if (_mapOfTasks.containsKey(cat))
//       _mapOfTasks[cat] += 1;
//     else
//       _mapOfTasks[cat] = 1;
//   }
//
//   @override
//   void onInit() {
//     TaskCategory.values.forEach((e) => categories
//         .add(CategoryData(title: e, taskCnt: 0, icon: categoryIcon(e))));
//     tasks.forEach((el) {
//       if (el.category != TaskCategory.All) {
//         if (!_mapOfTasks.containsKey(getCategoryName(el.category)))
//           _mapOfTasks[getCategoryName(el.category)] = 1;
//         else
//           _mapOfTasks[getCategoryName(el.category)] += 1;
//       }
//     });
//     _mapOfTasks["All"] = tasks.length;
//     for (var i = 0; i < categories.length; i++) {
//       if (_mapOfTasks.containsKey(categories[i].title))
//         categories[i].taskCnt = _mapOfTasks[categories[i].title];
//     }
//     //categorys.forEach((el)=>el.taskCnt=_mapOfTasks[el.taskCnt]);
//     //categorys.add(CategoryData(title: getCategoryName(key),taskCnt: value,icon:categoryIcon(key)));
//     //_buildMyitems();
//     super.onInit();
//   }
// }
