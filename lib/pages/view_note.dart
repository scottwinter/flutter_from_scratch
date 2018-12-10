import 'package:flutter/material.dart';
import 'package:flutter_from_scratch/pages/edit_note.dart';
import 'package:flutter_from_scratch/podo/note.dart';

class ViewNote extends StatelessWidget {
  final Note note;
  ViewNote(this.note);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("View Note"),
      ),
      body: PageBody(note),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute<void>(
              builder: (BuildContext context){
                return EditNote(note);
              },
            ),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class PageBody extends StatelessWidget {


  final Note note;
  PageBody(this.note);

  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    noteTitleController.text = note.noteTitle;
    noteBodyController.text = note.noteBody;
    return Column(
        children: [
          TextField(
            enabled: false,
            controller: noteTitleController,
            decoration: InputDecoration(
                hintText: "Note Title"
            ),
          ),
          TextField(
            enabled: false,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textAlign: TextAlign.left,
            controller: noteBodyController,
            decoration: InputDecoration(
                hintText: "Note Title",
                border: InputBorder.none
            ),
          ),
        ]
    );
  }
}