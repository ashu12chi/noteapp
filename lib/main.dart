import 'package:flutter/material.dart';
import 'package:noteapp/inherited_widgets/note_inherited_widget.dart';
import 'package:splashscreen/splashscreen.dart';
import './app_screens/note_list.dart';


void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new _SplashScreen(),
    )
  );
}

class _SplashScreen extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: App(),
      image: new Image.asset('assets/icon/icon.png'),
      title: new Text(
        '\t\t\t\t\t\t\t\t\t\tNoteApp\nAshutosh Chitranshi',
        style: new TextStyle(fontSize: 25.0),
      ),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return NoteInheritedWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Notes",
          home: NoteList(),
        )
    );
  }
}