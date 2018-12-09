import 'package:flutter/material.dart';
import 'package:flutter_from_scratch/podo/note.dart';

class EditNote extends StatelessWidget {
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
    String title = noteTitleController.text;
    String body = noteBodyController.text;
    note.noteTitle = noteTitleController.text;
    note.noteBody = noteBodyController.text;
    print("Note Data:  Title: $title, Body: $body");
  }
}

class PageBody extends StatelessWidget {
  final noteTitleController;
  final noteBodyController;
  final Note note;
  PageBody(this.note, this.noteTitleController, this.noteBodyController);

  @override
  Widget build(BuildContext context) {
    noteTitleController.text = note.noteTitle;
    noteBodyController.text = note.noteBody;
    return Column(
        children: [
          TextField(
            controller: noteTitleController,
            decoration: InputDecoration(
                hintText: "Note Title"
            ),
          ),
          TextField(
            textAlign: TextAlign.left,
            controller: noteBodyController,
            decoration: InputDecoration(
                hintText: "Note Title"
            ),
          ),
        ]
    );
  }
}