import 'package:assignment_1/widget/open_notes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesCard extends StatelessWidget {
  final String title;
  final String body;
  final DateTime date;
  final VoidCallback delete;

  const NotesCard({
    super.key,
    required this.title,
    required this.body,
    required this.date,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openNotesDialog(context, title, body),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          body,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          DateFormat('d/MM/y').format(date),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: delete,
                    icon: Icon(Icons.delete_outline, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
