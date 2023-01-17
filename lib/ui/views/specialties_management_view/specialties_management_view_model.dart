import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/core/models/specialization/specialization.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/doctor/doctor.dart';
import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../core/repositories/specializations_repository/specializations_repository.dart';
import '../add_doctor/add_doctor.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';

class CustomerSpecialtiesManagementViewModel extends BaseViewModel {
  /*Future<void> init() async {
    notifyListeners();
  }*/
  BuildContext? context;
  List<Specialization> specializations = [];

  String? q = '';
  Specialization? selected_spec;
  Future<void> init(BuildContext context) async {
    this.context = context;
    setBusy(true);
    // notifyListeners();
    print("nnnnn");
    /*doctors =
        await runBusyFuture(locator<DoctorsRepository>().fetchDoctorsList());*/

    specializations = await runBusyFuture(
        locator<SpecializationsRepository>().fetchSpecializationsList());
    /*doctors = await locator<DoctorsRepository>()
        .fetchDoctorsList({'paginate': '100'});

    specializations =
        await locator<SpecializationsRepository>().fetchSpecializationsList();*/

    if (specializations.isNotEmpty) {
      selected_spec = specializations.first;
    }

    setBusy(false);
    notifyListeners();
  }

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  } //CustomerSpecialtiesManagementView
}
