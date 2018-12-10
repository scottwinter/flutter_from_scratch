import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final noteTitleController = TextEditingController();
  final noteBodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Add New Note"),
      ),
      body: PageBody(noteTitleController, noteBodyController), // Create function call here to populate body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveNoteData();
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void saveNoteData() {
    String noteTitle = noteTitleController.text;
    print("Note Title: $noteTitle");
  }
}

class PageBody extends StatelessWidget {

  final noteTitleController;
  final noteBodyController;
  PageBody(this.noteTitleController, this.noteBodyController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ TextField(
        controller: noteTitleController,
        decoration: InputDecoration(
          hintText: "Note Title"
        ),
      ),
      TextField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.left,
        controller: noteBodyController,
        decoration: InputDecoration(
            hintText: "Note Body",
            border: InputBorder.none
        ),
      ),
    ]
    );
  }
}