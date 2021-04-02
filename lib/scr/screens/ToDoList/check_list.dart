import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/scr/Controlers/toDoListControler.dart';
import 'package:travel_app/scr/models/tasks.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:get/get.dart';

class CheckList extends StatefulWidget {
  final String title = 'Lists';
  final ToDoListControler controler=Get.put(ToDoListControler());
  final List<Task> tasks;
  final TaskCategory cat;
  CheckList({this.tasks,this.cat});
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    List<Widget> list=[];
    widget.tasks.forEach((element) =>list.add(_build(element)));
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: categoryIcon(widget.cat),
                     // color: Colors.lightBlueAccent, size: 30.0),
                ),
                SizedBox(height: 10.0),
                Text(getCategoryName(widget.cat),
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white)),
                Text(widget.tasks.length.toString()),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: ListView(children:list,),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }




  
  Widget _build(Task task) {
    int index=widget.controler.tasks.indexOf(task);
    return
           ListTile(
        title: Text(widget.controler.tasks[index].title ,style: TextStyle(decoration: widget.controler.tasks[index].done ? TextDecoration.lineThrough:null,)),
        trailing: Checkbox(value: widget.controler.tasks[index].done, onChanged: (val) {
          setState(()=>
          widget.controler.tasks[index].done=val);
          print(widget.controler.tasks[index].done);
          print("${task.done} here");
          }),
          onLongPress: (){
            setState(()=>
            widget.controler.tasks.removeAt(index));
          
          },
      
    );
  
}
}