import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart';
import '../../../core/models/doctor/doctor.dart';
import '../../../core/repositories/doctors_repository/doctors_repository.dart';
import '../../../locator.dart';

class CustomerAddDoctorViewModel extends BaseViewModel {
  BuildContext? context;
  Doctor? doctor;
  //int rating = 0;

  Future<void> init(BuildContext context, Doctor doctor) async {
    this.context = context;

    setBusy(true);

    this.doctor = await locator<DoctorsRepository>().fetchDoctor({
      'id': doctor.id.toString(),
    });

    setBusy(false);
  }

  Future<void> addDoctor(String name, String phone, String email,
      String password, String description) async {
    var json = {
      "name": "name",
      "phone": "phone",
      "email": "email",
      "password": "password",
      "description": "description",
    };
    setBusy(true);
    print('the id is ${doctor?.id}');
    //print('the commet is ${comment}');
    //print('the rate is $rate');
    final url = Uri.parse('http://44.212.230.27:8000/api/v1/doctors');

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    final response = await post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({json}),
    );
    try {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
    } catch (e, _) {
      debugPrint(e.toString());
    }
  }
}
