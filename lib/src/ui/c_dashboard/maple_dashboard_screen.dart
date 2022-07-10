import 'package:flutter/material.dart';
import 'package:maple_dashboard/src/ui/b_drawer/maple_drawer.dart';

class MapleDashboardScreen extends StatelessWidget {
  static const ROUTE_NAME = "/dashboard-screen";

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MapleDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MapleDrawer.instance,
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Text("Dashobard"),
      ),
    );
  }
}
