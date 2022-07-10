import 'package:flutter/material.dart';

class MapleUnknownRouteScreen extends StatelessWidget {
  static const ROUTE_NAME = "/unknown-route-screen";

  final String unknownRoute;

  const MapleUnknownRouteScreen({Key? key, this.unknownRoute = "unknown"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404, route: $unknownRoute"),
      ),
      body: Center(
        child: Text("Error 404: page \'$unknownRoute\'not found"),
      ),
    );
  }
}
