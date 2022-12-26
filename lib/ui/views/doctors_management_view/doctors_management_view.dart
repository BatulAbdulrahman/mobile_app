import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../add_doctor/add_doctor.dart';
import '../../widgets/stateless/doctors_data_table/doctors_data_table.dart';
import '../../widgets/stateless/header/header.dart';
import 'doctors_management_view_model.dart';

class CustomerDoctorsManagementView extends StatelessWidget {
  const CustomerDoctorsManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDoctorsManagementViewModel>.nonReactive(
        viewModelBuilder: () => CustomerDoctorsManagementViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => doctorsManagementView());
  }
}

class doctorsManagementView extends StatelessWidget {
  const doctorsManagementView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              DoctorsDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
