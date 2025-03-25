class Notes {
  String title;
  String body;
  DateTime date;

  Notes({required this.title, required this.body, required this.date});
}

List<Notes> noteList = [
  Notes(
    title: 'Notes 1',
    body:
        'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet ',
    date: DateTime.now(),
  ),
  Notes(
    title: 'Notes 2',
    body:
        'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet ',
    date: DateTime.now(),
  ),
  Notes(
    title: 'Notes 3',
    body:
        'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet ',
    date: DateTime.now(),
  ),
  Notes(
    title: 'Notes 4',
    body:
        'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet ',
    date: DateTime.now(),
  ),
  Notes(
    title: 'Notes 5',
    body:
        'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet ',
    date: DateTime.now(),
  ),
];
