import 'package:noteapp/models/notes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(),"notes.db"),
      version: 1,
      onCreate: (Database db,int version) async {
        db.execute('''create table notes(id integer primary key autoincrement,title text not null, text text not null, datetime text)''');
      }
    );
  }

  static Future<List<NotesModel>> getNoteList() async {
    if (db == null) {
      await open();
    }
    return (await db.query('Notes')).map((e) => NotesModel.fromJson(e)).toList();
  }

  static Future insertNote(NotesModel note) async {
    await db.insert('Notes', note.toJson());
  }

  static Future updateNote(NotesModel note) async {
    await db.update(
        'Notes',
        note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id]);
  }

  static Future deleteNote(int id) async {
    await db.delete(
        'Notes',
        where: 'id = ?',
        whereArgs: [id]);
  }

}