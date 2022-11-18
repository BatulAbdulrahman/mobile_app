import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenuControler extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get ScaffoldKey => _scaffoldKey;

  void menuControl() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
