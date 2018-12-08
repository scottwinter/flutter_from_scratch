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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.red,
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("This is the new Body."),
    );
  }
}