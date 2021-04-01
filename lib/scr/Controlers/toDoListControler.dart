import "package:get/get.dart";
import "package:travel_app/scr/models/tasks.dart";
import 'package:travel_app/scr/widgets/grid_cards.dart';
import '../models/tasks.dart';

class ToDoListControler extends GetxController
{
  List tasks=[Task(title:"a",category: TaskCategory.Home),
      Task(title:"b",category: TaskCategory.Airport),
      Task(title:"c",category: TaskCategory.Airport),
      Task(title:"d",category: TaskCategory.Airport),
      Task(title:"e",category: TaskCategory.Airport),
      Task(title:"f",category: TaskCategory.Shopping),
      Task(title:"g",category: TaskCategory.Shopping),
      Task(title:"h",category: TaskCategory.Others),].obs;
  List categorys=[].obs;
  void addTask(Task task){tasks.add(task);updateCatInfo(task.category);}
  void removeTask(Task task){tasks=tasks.removeAt(tasks.indexOf(task));}
  var _mapOfTasks=Map().obs;
  void updateCatInfo(TaskCategory cat){print(tasks.length);if(_mapOfTasks.containsKey(cat))_mapOfTasks[cat]+=1;else _mapOfTasks[cat]=1;}
 
 
  @override
  void onInit() {
    TaskCategory.values.forEach((e) => categorys.add(CategoryData(title: e,taskCnt:0,icon:categoryIcon(e))));
    tasks.forEach((el)
    {
      if(el.category !=TaskCategory.All)
      {
        if(!_mapOfTasks.containsKey(getCategoryName(el.category))) _mapOfTasks[getCategoryName(el.category)]=1;
        else _mapOfTasks[getCategoryName(el.category)] +=1;
      }
    });
    _mapOfTasks["All"]=tasks.length;
    for (var i =0;i<categorys.length;i++)
      {
        if(_mapOfTasks.containsKey(categorys[i].title))
        categorys[i].taskCnt=_mapOfTasks[ categorys[i].title];
      }
    //categorys.forEach((el)=>el.taskCnt=_mapOfTasks[el.taskCnt]);
    //categorys.add(CategoryData(title: getCategoryName(key),taskCnt: value,icon:categoryIcon(key))); 
    //_buildMyitems();
    super.onInit();
  }

}