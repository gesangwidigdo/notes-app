import 'package:flutter/material.dart';
import 'package:assignment_1/widget/notes_card.dart';
import 'package:assignment_1/model/notes.dart';
import 'package:assignment_1/widget/open_notes_dialog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App', style: TextStyle(color: Colors.white70)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          final note = noteList[index];
          return NotesCard(
            title: note.title,
            body: note.body,
            date: note.date,
            delete: () {
              setState(() {
                noteList.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNotesDialog(context, '', '');
        },
        backgroundColor: Colors.blueGrey[900],
        child: Icon(Icons.add, color: Colors.white70),
      ),
    );
  }
}
