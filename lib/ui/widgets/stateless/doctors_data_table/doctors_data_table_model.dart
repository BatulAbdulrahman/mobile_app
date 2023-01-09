import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/doctor/doctor.dart';
import '../../../../core/repositories/doctors_repository/doctors_repository.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/locator.dart';

class DoctorsDataTableModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();
  /*Future<void> init() async {
    notifyListeners();
  }*/
  /*Doctor? doctor;

  void init(Doctor doctor) {
    this.doctor = doctor;
  }*/
  BuildContext? context;
  List<Doctor> doctors = [];
  //Doctor? doctor;

  Future<void> init(BuildContext context) async {
    this.context = context;
    //doctor = doctor;
    setBusy(true);
    doctors = await locator<DoctorsRepository>().fetchDoctorsList();
    print(doctors);
    setBusy(false);
  }

  /*Future<void> init() async {
    notifyListeners();
  }*/

  void moveToLogin(BuildContext context) {}

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
