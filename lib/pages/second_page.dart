import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("What the hell?"),
      ),
      body: PageBody(), // Create function call here to populate body
    );;
  }
}

class PageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("This is the second page."),
    );
  }
}