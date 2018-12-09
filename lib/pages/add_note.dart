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
          SaveNoteData();
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void SaveNoteData() {
    String noteTitle = noteTitleController.text;
    print("Note data: $noteTitle");
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
        controller: noteBodyController,
        decoration: InputDecoration(
            hintText: "Note Body"
        ),
      )
    ]
    );
  }
}