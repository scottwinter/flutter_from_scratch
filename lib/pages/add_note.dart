import 'package:flutter/material.dart';

import 'package:flutter_from_scratch/model/note.dart';
import 'package:flutter_from_scratch/repository/database.dart';

class AddNote extends StatelessWidget {
  DatabaseHelper db = new DatabaseHelper();
  final noteTitleController = TextEditingController();
  final noteBodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Add New Note"),
      ),
      body: PageBody(noteTitleController,
          noteBodyController), // Create function call here to populate body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveNoteData();
          db.saveNote(Note.data(
                  noteTitleController.text,
                  noteBodyController.text,
                  new DateTime.now().millisecondsSinceEpoch))
              .then((_) {
            Navigator.pop(context, 'save');
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void saveNoteData() {
    String noteTitle = noteTitleController.text;
    print(
        "Todays date: " + new DateTime.now().millisecondsSinceEpoch.toString());
  }
}

class PageBody extends StatelessWidget {
  final noteTitleController;
  final noteBodyController;
  PageBody(this.noteTitleController, this.noteBodyController);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        TextField(
          autofocus: true,
          controller: noteTitleController,
          decoration: InputDecoration(hintText: "Note Title"),
        ),
        Expanded(
          flex: 1,
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.left,
                controller: noteBodyController,
                decoration: InputDecoration(
                    hintText: "Note Body", border: InputBorder.none),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
