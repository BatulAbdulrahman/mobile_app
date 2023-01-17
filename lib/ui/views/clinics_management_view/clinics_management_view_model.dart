import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/core/models/clinic/clinic.dart';
import 'package:mobile_app/core/models/specialization/specialization.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/doctor/doctor.dart';
import '../../../core/repositories/clinics_repository/clinics_repository.dart';
import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../core/repositories/specializations_repository/specializations_repository.dart';
import '../add_doctor/add_doctor.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/services/navigation/navigation_service.dart';
import '/locator.dart';

class CustomerClinicsManagementViewModel extends BaseViewModel {
  /*Future<void> init() async {
    notifyListeners();
  }*/
  BuildContext? context;
  List<Clinic> clinics = [];
  Doctor? doctor;
  String? q = '';
  Clinic? selected_clinic;
  Future<void> init(BuildContext context) async {
    this.context = context;
    setBusy(true);
    // notifyListeners();
    print("nnnnn");
    clinics =
        await runBusyFuture(locator<ClinicsRepository>().fetchClinicsList());

    /*doctors = await locator<DoctorsRepository>()
        .fetchDoctorsList({'paginate': '100'});

    specializations =
        await locator<SpecializationsRepository>().fetchSpecializationsList();*/

    if (clinics.isNotEmpty) {
      selected_clinic = clinics.first;
    }

    print("nnnnn");
    print(clinics.first.name);
    //print(doctors.first.Specializations!.first.name!);
    setBusy(false);
    notifyListeners();
  }

  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
