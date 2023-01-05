import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/doctor/doctor.dart';
import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';

class CustomerDoctorsManagementViewModel extends BaseViewModel {
  /*Future<void> init() async {
    notifyListeners();
  }*/

  Doctor? doctor;

  Future<void> init(Doctor doctor) async {
    this.doctor = doctor;
  }

  void moveToLogin(BuildContext context) {}

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
