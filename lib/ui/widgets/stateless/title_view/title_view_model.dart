import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';
import '../../../router.gr.dart';

class TitleViewModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();

  Future<void> init() async {
    notifyListeners();
  }

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
