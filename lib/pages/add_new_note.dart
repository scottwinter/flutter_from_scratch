import 'package:flutter/material.dart';

import 'package:flutter_from_scratch/model/note.dart';
import 'package:flutter_from_scratch/repository/database.dart';

class AddNewNote extends StatefulWidget {
  @override
  AddNewNoteState createState() => new AddNewNoteState();
}

class AddNewNoteState extends State<AddNewNote> {
  final DatabaseHelper db = new DatabaseHelper();
  final noteTitleController = TextEditingController();
  final noteBodyController = TextEditingController();
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Add New Note NEW"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(children: [
          TextField(
            autofocus: true,
            controller: noteTitleController,
            decoration: InputDecoration(hintText: "Note Title"),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              key: _formKey,
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
      ), // Create function call here to populate body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveNote().then((_) {
            Navigator.pop(context, 'save');
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Future<int> _saveNote() {
    String title = noteTitleController.text;
    String body = noteBodyController.text;
    if(title.isNotEmpty || body.isNotEmpty) {
     return db
          .saveNote(Note.data(
          title, body,
          new DateTime.now().millisecondsSinceEpoch));
    } else {
      return db.getCount();
    }
  }

}
