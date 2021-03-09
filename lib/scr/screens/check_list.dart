import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/scr/models/tasks.dart';
import 'package:travel_app/scr/shared/constants.dart';

class CheckList extends StatefulWidget {
  final String title = 'Lists';
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                  child: Icon(Icons.assignment,
                      color: Colors.lightBlueAccent, size: 30.0),
                ),
                SizedBox(height: 10.0),
                Text('All',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white)),
                Text('3 Tasks'),
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
              child: TaskList(),
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
}

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(
            task: Task(
                title: 'This is a task.',
                details: '',
                category: TaskCategory.Home)),
        TaskTile(
            task: Task(
                title: 'This is a task.',
                details: '',
                category: TaskCategory.Home)),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      // trailing: Checkbox(value: task.isFinished, onChanged: (val) {}),
    );
  }
}
