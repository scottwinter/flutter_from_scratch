import 'dart:async';
import 'package:flutter_from_scratch/repository/database.dart';
import 'package:flutter_from_scratch/model/note.dart';

class NotesRepo {
  var db = new DatabaseHelper();

  populatesTestNotes() async {

    await db.saveNote(new Note.data("Flutter Tutorials", "Create SQLite Tutorial", 1));
    await db.saveNote(new Note.data("Android Development", "Build Firebase Android Apps", 2));
    await db.saveNote(new Note.data("Mobile App R&D", "Research more cross-flatforms", 3));
  }

  Future<List<Note>> getAllNotes() async {
    List<Note> notes = new List();
    List notesResult = await db.getAllNotes();

    notesResult.forEach((note) => notes.add(new Note.allData(note['id'], note['title'], note['body'], note['updatedDate'])));
    notes.forEach((note) => print("title: "+note.title +" body: "+ note.body));
    print("Notes length: " + notes.length.toString());
    return notes;
  }
}