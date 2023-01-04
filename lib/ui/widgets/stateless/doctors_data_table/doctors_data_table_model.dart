import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/doctor/doctor.dart';
import '../../../../core/repositories/doctors_repository/doctors_repository.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/locator.dart';

class DoctorsDataTableModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();
  Future<void> init() async {
    notifyListeners();
  }
  /*Doctor? doctor;
  List<Doctor> doctors_list = [];

  String? q = '';
  Doctor? selected_doctor;
  Future<void> init(Doctor doctor) async {
    this.doctor = doctor;
    setBusy(true);

    doctors_list = await locator<DoctorsRepository>()
        .fetchDoctorsList({'paginate': '100'});

    if (doctors_list.isNotEmpty) {
      selected_doctor = doctors_list.first;
    }

    setBusy(false);
  }*/

  /*Future<void> init() async {
    notifyListeners();
  }*/

  void moveToLogin(BuildContext context) {}

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
