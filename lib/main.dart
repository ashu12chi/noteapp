import 'package:flutter/material.dart';
import './app_screens/note_list.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      home: NoteList(),
    );
  }
}