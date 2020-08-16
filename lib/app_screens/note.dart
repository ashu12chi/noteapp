import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NoteNode {
  Editing,
  Adding
}

class Note extends StatelessWidget {

  final NoteNode _noteNode;

  const Note(this._noteNode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              _noteNode == NoteNode.Adding?"Add Note":"Edit Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: "Note Title"
                ),
              ),
              Container(height: 16,),
              TextField(
                decoration: InputDecoration(
                    hintText: "Note Text"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _NoteButton("Save",Colors.blue,(){
                    Navigator.pop(context);
                  }),
                  _NoteButton("Discard",Colors.grey,(){
                    Navigator.pop(context);
                  }),
                  _noteNode == NoteNode.Editing?
                  _NoteButton("Delete",Colors.red,(){
                    Navigator.pop(context);
                  }):Container(),
                ],
              )
            ],
          ),
        )
    );
  }
}

class _NoteButton extends StatelessWidget {
  @override
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text,this._color,this._onPressed);

  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(_text,
        style: TextStyle(color: Colors.white),
      ),
      height: 40,
      minWidth: 90,
      color: _color,
    );
  }
}