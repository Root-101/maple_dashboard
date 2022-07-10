import 'package:flutter/material.dart';

class NotesHomepage extends StatelessWidget {
  static const ROUTE_NAME = "/notes-homepage";

  const NotesHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes title",
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Notes Homepage"),
        ),
      ),
    );
  }
}
