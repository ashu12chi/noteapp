import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {

  final notes = [{}];

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