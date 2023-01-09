import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mobile_app/logger.dart';
import 'package:stacked/stacked.dart';
import '../add_doctor/add_doctor.dart';
import '../../widgets/stateless/doctors_data_table/doctors_data_table.dart';
import '../../widgets/stateless/header/header.dart';
import 'doctors_management_view_model.dart';


class CustomerDoctorsManagementView
    extends StatelessWidget {
  CustomerDoctorsManagementViewModel custormer=CustomerDoctorsManagementViewModel();
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<CustomerDoctorsManagementViewModel>.reactive(
        viewModelBuilder: () {
          ;
          return custormer;
        },
        onModelReady: (model)async => model.init(context).then((value) {
          model.notifyListeners();
          print("nnnnnnnn");

          print(model.doctors.first.name);
        }),
        builder: (context, model, child) => model.isBusy?Container(): Container(
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
                      Text("nnnn:" ),
                      Text(model.doctors.length>0? model.doctors.first.name! :""),
                  DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Phone'))

                    ],
                    rows: model.doctors.map((e) => DataRow(cells: [
                      DataCell(Text('#' + e.id.toString())),
                      DataCell(Text(e.name!)),
                      DataCell(Text(e.phone??""))
                    ])).toList()
                      ,),

                      // Expanded(
                      //   child: DoctorsDataTable(
                      //     doctor: model.doctors.first,
                      //     onChanged: (value) {},
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
