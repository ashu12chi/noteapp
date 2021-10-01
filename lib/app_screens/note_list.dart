import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/models/notes_model.dart';
import 'package:noteapp/providers/note_provider.dart';
import 'note.dart';

class NoteList extends StatefulWidget {

  @override
  NoteListState createState() {
    return new NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Ashutosh Chitranshi"
              ),
              accountEmail: Text(
                "ashutosh7234@gmail.com"
              ),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile (
              leading: Icon(Icons.perm_identity),
              title: Text(
                "Profile"
              ),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Notes"
              ),
              onTap: (){

              },
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings"
              ),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                "Feedback"
              ),
                onTap: (){

              }
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text(
                  "About"
              ),
              onTap: () {

              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.copyright),
                  title: Text(
                    "2020 by Ashutosh Chitranshi"
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: NoteProvider.getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            final notes = snapshot.data as List<NotesModel>;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {

                final note = notes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Note(NoteMode.Editing, note))
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _NoteTitle(note.title, note.dateTime),
                          Container(height: 4,),
                          _NoteText(note.text)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding, null))
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;
  final String _datetime;

  _NoteTitle(this._title,this._datetime);

  @override
  Widget build(BuildContext context) {
    return Row (
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment : MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          _title,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        _datetime.length == 0?Container():Image(
            image: AssetImage('assets/icon/alarm.png'),
            height: 40.0,
            width: 40.0,
        )
      ],
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;

  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
          color: Colors.grey.shade600
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}