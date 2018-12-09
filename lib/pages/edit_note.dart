import 'package:flutter/material.dart';
import 'package:flutter_from_scratch/podo/note.dart';

class EditNote extends StatelessWidget {
  final myController = TextEditingController();
  final Note note;
  EditNote(this.note);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Edit Note"),
      ),
      body: PageBody(note), // Create function call here to populate body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  final noteTitleController = TextEditingController();
  final noteBodyController = TextEditingController();
  final Note note;
  PageBody(this.note);

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