import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {

  final notes = [{
    'title' : 'Ashutosh Chitranshi is working on building a note app',
    'text' : 'Using Dart and Flutter is a way too fun'
  },
  {
  'title' : 'Ashutosh Chitranshi is working on building a note app',
  'text' : 'Using Dart and Flutter is a way too fun'
  },
    {
  'title' : 'Ashutosh Chitranshi is working on building a note app',
  'text' : 'Using Dart and Flutter is a way too fun'
  }
];

  NoteInheritedWidget(Widget child) : super(child: child);

  static NoteInheritedWidget of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>();
    return (context.dependOnInheritedWidgetOfExactType(aspect: widget));
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    return oldWidget.notes != notes;
  }

}