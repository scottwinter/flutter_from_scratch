import 'package:flutter/material.dart';

import 'package:flutter_from_scratch/model/note.dart';
import 'package:flutter_from_scratch/repository/database.dart';

class EditNote extends StatefulWidget {
  final Note note;
  EditNote(this.note);

  @override
  EditNoteState createState() => new EditNoteState(note);
}

class EditNoteState extends State<EditNote> {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final DatabaseHelper db = new DatabaseHelper();
  final noteTitleController = TextEditingController();
  final noteBodyController = TextEditingController();

  final Note note;
  EditNoteState(this.note);

  @override
  Widget build(BuildContext context) {
    if (noteBodyController.text.isEmpty) {
      noteTitleController.text = note.title;
      noteBodyController.text = note.body;
    }
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(children: [
          TextField(
            controller: noteTitleController,
            decoration: InputDecoration(hintText: "Note Title"),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              key: _formKey,
              autofocus: true,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.left,
              controller: noteBodyController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 10.0, top: 12.0),
                  hintText: "Note Body",
                  border: InputBorder.none),
            ),
          ),
          Container(
            height: 20.0,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveData();
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  saveData() {
    db.updateNote(Note.fromMap({
      'id': note.id,
      'title': noteTitleController.text,
      'body': noteBodyController.text,
      'updatedDate': new DateTime.now().millisecondsSinceEpoch
    }));

    note.title = noteTitleController.text;
    note.body = noteBodyController.text;
  }
}
