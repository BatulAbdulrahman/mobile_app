import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ui/views/add_clinic/add_clinic.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/analytic_cards/analytic_cards.dart';
import '../../widgets/stateless/clinics_data_table/clinics_data_table.dart';
import '../../widgets/stateless/header/header.dart';
import '../../widgets/stateless/title_view/title_view.dart';
import 'clinics_management_view_model.dart';

class CustomerClinicsManagementView extends StatelessWidget {
  const CustomerClinicsManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerClinicsManagementViewModel>.nonReactive(
        viewModelBuilder: () => CustomerClinicsManagementViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => ClinicsManagementView());
  }
}

class ClinicsManagementView extends StatelessWidget {
  const ClinicsManagementView({
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
                title: 'إدارةالمصحات',
                buttonText: 'إضافة',
                buttonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomerAddClinicView(),
                  );
                },
              ),
              ClinicsDataTable(),
            ],
          ),
        ),
      ),
    );
  }
}
