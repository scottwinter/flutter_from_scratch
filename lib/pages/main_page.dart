import 'package:flutter/material.dart';
import 'package:flutter_from_scratch/pages/view_note.dart';
import 'package:flutter_from_scratch/pages/add_note.dart';
import 'package:flutter_from_scratch/podo/note.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Noted"),
      ),
      body: PageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute<void>(
              builder: (BuildContext context){
                return AddNote();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PageBody extends StatelessWidget {

  List<Note> notes = new List();

  @override
  Widget build(BuildContext context) {
    _populateNotes();
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          Note note = notes[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Theme.of(context).dividerColor)
            ),
            child: ListTile(
              title: Text('${note.noteTitle}'),
              subtitle: Text("${note.noteBody}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${note.noteUpdatedDate}"),
                    Container(padding: EdgeInsets.all(5.0)),
                    Icon(Icons.date_range)
                  ]),
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return ViewNote(note);
                    },
                  ),
                );
              },
            ),
          );
        },
      );
  }

  void _populateNotes() {
    for (var i = 0; i < 20; i++) {
      Note note = new Note();
      note.noteTitle = "This is note $i";
      note.noteBody = "Some note body text for note number $i ...";
      note.noteUpdatedDate = "$i days";
      notes.add(note);
    }
  }
}
