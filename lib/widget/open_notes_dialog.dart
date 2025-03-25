import 'package:assignment_1/model/notes.dart';
import 'package:flutter/material.dart';

Future<bool?> openNotesDialog(BuildContext context, {int? index}) {
  bool isEditing = index != null;
  TextEditingController titleController = TextEditingController(
    text: isEditing ? noteList[index].title : '',
  );
  TextEditingController bodyController = TextEditingController(
    text: isEditing ? noteList[index].body : '',
  );

  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            title: isEditing ? Text('Edit Notes') : Text('Add Notes'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  String title = titleController.text;
                  String body = bodyController.text;
                  if (title.isNotEmpty || body.isNotEmpty) {
                    isEditing
                        ? editNotes(index, title, body)
                        : addNotes(title, body);
                  }
                  Navigator.pop(context, true);
                },
                icon: Icon(Icons.check),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
                TextField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    hintText: 'Body',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[400],
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void addNotes(String title, String body) {
  noteList.add(Notes(title: title, body: body, date: DateTime.now()));
}

void editNotes(int index, String newTitle, String newBody) {
  if (index >= 0 && index < noteList.length) {
    noteList[index].title = newTitle;
    noteList[index].body = newBody;
    noteList[index].date = DateTime.now();
  }
}
