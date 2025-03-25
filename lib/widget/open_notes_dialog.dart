import 'package:flutter/material.dart';

Future<void> openNotesDialog(BuildContext context, String title, String body) {
  TextEditingController titleController = TextEditingController(text: title);
  TextEditingController bodyController = TextEditingController(text: body);

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title:
                title == '' && body == ''
                    ? Text('Add Notes')
                    : Text('Edit Notes'),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.check)),
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
