import 'package:flutter/material.dart';
import 'package:maple_dashboard/src/ui/b_drawer/maple_drawer.dart';

class NotesHomepage extends StatelessWidget {
  static final String ROUTE_NAME = "/notes-homepage";
  final String title;

  const NotesHomepage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MapleDrawer.instance,
      appBar: AppBar(
        title: Text(
          title,
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
