import 'package:flutter/material.dart';
import 'package:maple_dashboard/maple_exporter.dart';

class MapleUIUtilsScreen extends StatelessWidget {
  static const ROUTE_NAME = "/utils-screen";

  const MapleUIUtilsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MapleDrawer.instance,
      appBar: AppBar(
        title: Text(
          "Utiles",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text("Utiles"),
          ),
        ),
      ),
    );
  }
}
