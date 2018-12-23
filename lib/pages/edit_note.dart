import 'package:flutter/material.dart';

import 'package:flutter_from_scratch/model/note.dart';
import 'package:flutter_from_scratch/repository/database.dart';

class EditNote extends StatelessWidget {
  final DatabaseHelper db = new DatabaseHelper();
  final noteTitleController = TextEditingController();
  final noteBodyController = TextEditingController();
  final Note note;
  EditNote(this.note);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Edit Note"),
      ),
      body: PageBody(note, noteTitleController, noteBodyController), // Create function call here to populate body
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

class PageBody extends StatelessWidget {
  final noteTitleController;
  final noteBodyController;
  final Note note;
  PageBody(this.note, this.noteTitleController, this.noteBodyController);

  @override
  Widget build(BuildContext context) {
    noteTitleController.text = note.title;
    noteBodyController.text = note.body;
    return Column(
        children: [
          TextField(
            controller: noteTitleController,
            decoration: InputDecoration(
                hintText: "Note Title"
            ),
          ),
          Container(
            child: Expanded(
              flex: 1,
              child: TextField(
                  autofocus: true,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.left,
                  controller: noteBodyController,
                  decoration: InputDecoration(
                      hintText: "Note Body",
                      border: InputBorder.none
                  ),
                ),
                ),
          ),
          Container(
            height: 20.0,
          )
        ]
    );
  }
}