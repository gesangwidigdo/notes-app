import 'package:flutter/material.dart';
import 'package:assignment_1/screens/notes_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      home: NotesScreen(),
    );
  }
}
