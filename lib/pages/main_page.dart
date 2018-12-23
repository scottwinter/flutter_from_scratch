import 'package:flutter/material.dart';
import 'package:flutter_from_scratch/model/note.dart';
import 'package:flutter_from_scratch/pages/add_new_note.dart';
import 'package:flutter_from_scratch/pages/view_note.dart';
import 'package:flutter_from_scratch/repository/database.dart';
import 'package:splashscreen/splashscreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 1,
        navigateAfterSeconds: new MainPage(),
        title: new Text(
          'Welcome To Noted',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
//        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
//        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.blue);
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Note> notes = new List();
  DatabaseHelper db = new DatabaseHelper();
//  var db = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Noted"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          Note note = notes[index];
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).dividerColor),
            ),
            child: ListTile(
              title: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
                  child: Text(
                    '${note.noteTitleForList()}',
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.4),
                  )),
              subtitle: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text("${note.noteBodyForList()}",
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.1),)),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(_updatedDateDiff(note)),
                Container(padding: EdgeInsets.all(5.0)),
                Icon(Icons.date_range)
              ]),
              onTap: () => _viewNewNote(context, note),
              onLongPress: () => _deleteNoteDialog(note, index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewNote(context),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    db.getAllNotes().then((notes) {
      setState(() {
        notes.forEach((note) {
          this.notes.add(Note.fromMap(note));
        });
      });
    });
  }

  String _updatedDateDiff(Note note) {
    String dateDiff;

    int diff = new DateTime.now().millisecondsSinceEpoch - note.updatedDate;
    int seconds = diff ~/ 1000;
    int minutes = seconds ~/ 60;
    int hours = minutes ~/ 60;
    int days = hours ~/ 24;

    if (seconds < 60) {
      dateDiff = seconds.toString() + " s";
    } else if (minutes < 60) {
      dateDiff = minutes.toString() + " m";
    } else if (hours < 24) {
      dateDiff = hours.toString() + " h";
    } else {
      dateDiff = days.toString() + " d";
    }
    return dateDiff;
  }

  void _deleteNote(BuildContext context, Note note, int position) async {
    await db.deleteNote(note.id).then((notes) {
      setState(() {
        this.notes.removeAt(position);
      });
    });
  }

  void _viewNewNote(BuildContext context, Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewNote(note)),
    );

    db.getAllNotes().then((notes) {
      setState(() {
        this.notes.clear();
        notes.forEach((note) {
          this.notes.add(Note.fromMap(note));
        });
      });
    });
  }

  void _createNewNote(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewNote()),
    );

    if (result == 'save') {
      db.getAllNotes().then((notes) {
        setState(() {
          this.notes.clear();
          notes.forEach((note) {
            this.notes.add(Note.fromMap(note));
          });
        });
      });
    }
  }

  Future<void> _deleteNoteDialog(Note note, int position) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Note!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you really want to delete this note?'),
                Text('It will be gone forever.... Unless you write it again.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes', style: TextStyle(fontSize: 20.0),),
              onPressed: () {
                _deleteNote(context, note, position);
                Navigator.pop(context, 'yes');
              },
            ),
            Container(width: 100, height: 20,),
            FlatButton(
              child: Text('No', style: TextStyle(fontSize: 20.0),),
              onPressed: () {
                Navigator.pop(context, 'no');
              },
            ),
            Container(width: 20, height: 20,),
          ],
        );
      },
    );
  }
}
