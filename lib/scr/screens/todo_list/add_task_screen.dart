import 'dart:ui';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:intl/intl.dart";
import "package:footer/footer_view.dart";
import "package:footer/footer.dart";
import 'package:travel_app/scr/controllers/todo_list_controller.dart';
import '../../models/tasks.dart';
import 'Component/category_bottom_sheet.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final ToDoListController controller = Get.find();
  final scaffoldState = GlobalKey<ScaffoldState>();
  String _time =
      "${DateFormat(DateFormat.MONTH_DAY).format(DateTime.now())} , ${DateFormat(DateFormat.HOUR_MINUTE).format(DateTime.now())}";
  String _title;
  String _note = "";
  String _selectedCatgorey = "Please select a category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldState,
        resizeToAvoidBottomInset: false,
        drawer: new Drawer(),
        appBar: AppBar(
          brightness: Brightness.light,
          centerTitle: true,
          title: Text(
            "New Task",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Icon(Icons.close, color: Colors.black), onPressed: () {}),
          ],
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: FooterView(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "What are you planning ?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 1.4,
                        child: Container(
                          height: 5 * 24.0,
                          padding: EdgeInsets.all(8),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                            maxLines: 5,
                            onSubmitted: (val) => setState(() => _title = val),
                          ),
                        )),
                    ListTile(
                      leading:
                          Icon(Icons.alarm, color: Colors.lightBlueAccent[400]),
                      title: Text(_time),
                      onTap: () async {
                        print("Im Here");
                        DateTime _date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            initialDate: DateTime(2021),
                            lastDate: DateTime(2030));
                        TimeOfDay _t = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        setState(() {
                          _time =
                              "${DateFormat(DateFormat.MONTH_DAY).format(_date)} , ${_t.format(context)}";
                        });
                      },
                    ),
                    SizedBox(height: 6),
                    ListTile(
                      leading: Icon(Icons.note, color: Colors.amber[300]),
                      title: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Add Note",
                          hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w600),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        onSaved: (val) => setState(() => _note = val),
                      ),
                    ),
                    SizedBox(height: 6),
                    ListTile(
                      leading:
                          Icon(Icons.category, color: Colors.pinkAccent[200]),
                      title: Text("$_selectedCatgorey"),
                      onTap: () async {
                        String tmp = await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CategoryBottomSheet();
                          },
                        );
                        setState(() {
                          _selectedCatgorey = tmp;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
          footer: new Footer(
              child: new Flexible(
                  child: ListTile(
            title: Center(
                child: Text(
              "Create",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
            tileColor: Colors.lightBlueAccent[400],
            onTap: () {
              Task task = Task(
                  title: _title,
                  note: _note,
                  category: TaskCategory.values.firstWhere((element) {
                    if (getCategoryName(element) == _selectedCatgorey)
                      return true;
                    return false;
                  }));
              controller.addTask(task);
              Get.back();
            },
          ))),
          flex: 3,
        ));
  }
}
