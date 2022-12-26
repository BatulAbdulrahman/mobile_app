import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';

class CustomerDoctorAccountManagementViewModel extends BaseViewModel {
  Future<void> init() async {
    notifyListeners();
  }
}
