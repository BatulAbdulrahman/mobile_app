import 'package:flutter/material.dart';
import 'package:mobile_app/ui/views/add_specialtie/add_specialtie.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/stateless/header/header.dart';
import '../../widgets/stateless/specialty_data_table/specialty_data_table.dart';
import 'specialties_management_view_model.dart';

class CustomerSpecialtiesManagementView extends StatelessWidget {
  const CustomerSpecialtiesManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerSpecialtiesManagementViewModel>.nonReactive(
        viewModelBuilder: () => CustomerSpecialtiesManagementViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => specialtiesManagementView());
  }
}

class specialtiesManagementView extends StatelessWidget {
  const specialtiesManagementView({
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
                title: 'إدارةالتخصصات',
                buttonText: 'إضافة',
                buttonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomerAddSpecialtieView(),
                  );
                },
              ),
              SpecialtyDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
