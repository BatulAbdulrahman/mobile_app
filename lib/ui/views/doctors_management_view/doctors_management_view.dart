import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mobile_app/logger.dart';
import 'package:stacked/stacked.dart';
import '../add_doctor/add_doctor.dart';
import '../../widgets/stateless/doctors_data_table/doctors_data_table.dart';
import '../../widgets/stateless/header/header.dart';
import 'doctors_management_view_model.dart';

class CustomerDoctorsManagementView extends StatefulWidget {
  @override
  State<CustomerDoctorsManagementView> createState() =>
      _CustomerDoctorsManagementViewState();
}

class _CustomerDoctorsManagementViewState
    extends State<CustomerDoctorsManagementView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDoctorsManagementViewModel>.nonReactive(
        viewModelBuilder: () => CustomerDoctorsManagementViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) => Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Header(
                          title: 'إدارة الأطباء',
                          buttonText: 'إضافة',
                          buttonPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomerAddDoctorView(),
                            );
                          }),
                      Expanded(
                        child: DoctorsDataTable(
                          doctor: model.doctors.first,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
