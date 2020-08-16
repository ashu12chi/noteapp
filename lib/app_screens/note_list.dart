import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                  builder: (context) => Note(NoteNode.Editing)));
            },
            child: Card (
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,bottom: 20.0,left: 15.0,right: 21.0),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    _NoteTitle(),
                    Container(height:4),
                    _NoteText(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(
              builder: (context) => Note(NoteNode.Adding))
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Text("Some Title",
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),);
  }
}

class _NoteText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("Some text",
      style: TextStyle(
          color: Colors.grey.shade600
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

}