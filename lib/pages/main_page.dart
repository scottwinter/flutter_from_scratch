import 'package:flutter/material.dart';
import 'package:flutter_from_scratch/pages/second_page.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("What the hell?"),
      ),
      body: PageBody(), // Create function call here to populate body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute<void>(
              builder: (BuildContext context){
                return SecondPage();
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

  List<String> notes = new List();

  @override
  Widget build(BuildContext context) {
    _populateNotes();
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Theme.of(context).dividerColor)
            ),
            child: ListTile(
              title: Text('${notes[index]}'),
              subtitle: Text("Some note body."),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("23d"),
                    Container(padding: EdgeInsets.all(5.0)),
                    Icon(Icons.date_range)
                  ]),
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return SecondPage();
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
      notes.add("This is note $i");
    }
  }
}
