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
  List<Doctor> doctors_list = [];

  String? q = '';
  Doctor? selected_doctor;
  Future<void> init(Doctor doctor) async {
    this.doctor = doctor;

    doctors_list = await locator<DoctorsRepository>()
        .fetchDoctorsList({'paginate': '100'});

    if (doctors_list.isNotEmpty) {
      selected_doctor = doctors_list.first;
    }
    print(doctors_list);
    setBusy(false);
  }

  void moveToLogin(BuildContext context) {}

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
