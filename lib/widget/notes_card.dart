import 'package:assignment_1/widget/open_notes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesCard extends StatefulWidget {
  final int index;
  final String title;
  final String body;
  final DateTime date;
  final VoidCallback delete;

  const NotesCard({
    super.key,
    required this.index,
    required this.title,
    required this.body,
    required this.date,
    required this.delete,
  });

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool? updated = await openNotesDialog(context, index: widget.index);
        print(updated);
        setState(() {});
      },
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
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.body,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          isLessThan24Hourse(widget.date)
                              ? DateFormat.Hm().format(widget.date)
                              : DateFormat('d/MM/y').format(widget.date),
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
                    onPressed: widget.delete,
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

bool isLessThan24Hourse(DateTime date) {
  return DateTime.now().difference(date).inHours < 24;
}
