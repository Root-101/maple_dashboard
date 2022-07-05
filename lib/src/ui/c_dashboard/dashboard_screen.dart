import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const ROUTE_NAME = "/dashboard-screen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Text("Dashobard"),
      ),
    );
  }
}
