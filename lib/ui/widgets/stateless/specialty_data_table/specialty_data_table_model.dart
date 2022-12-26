import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '/core/services/key_storage/key_storage_service.dart';
import '/locator.dart';

class SpecialtyDataTableModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();

  Future<void> init() async {
    notifyListeners();
  }

  void moveToLogin(BuildContext context) {}

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
