import 'dart:html';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/logger.dart';
import 'package:stacked/stacked.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../../core/models/doctor/doctor.dart';
import '../../shared/delete_bottun.dart';
import '../../shared/edit_bottun.dart';
import '../../shared/responsive.dart';
import '../add_doctor/add_doctor.dart';
import '../../widgets/stateless/doctors_data_table/doctors_data_table.dart';
import '../../widgets/stateless/header/header.dart';
import '../edit_doctor_data_view/edit_doctor_data_view.dart';
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
        onModelReady: (model) async => model.init(context).then((value) {
              model.notifyListeners();
              print("nnnnnnnn");
              print(model.doctors.first.name);
            }),
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
                      /*  Expanded(
                        child: model.doctors.isNotEmpty
                            ? DoctorsDataTable(
                                doctor: model.doctors.first,
                              )
                            : Container(
                                child: Text('There is no doctors'),
                              ),
                      )*/
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: PaginatedDataTable2(
                            sortColumnIndex: 0,
                            source: RowSource(
                              context: context,
                              myData: model.doctors,
                              count: model.doctors.length,
                            ),
                            header: TextField(
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: ' بحث عن طبيب',
                                  hintStyle: GoogleFonts.cairo(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15,
                                    color: HexColor.fromHex(
                                            Constants.app_color_on_secondary)
                                        .withOpacity(0.5),
                                  ),
                                  fillColor: HexColor.fromHex(
                                      Constants.app_color_on_primary),
                                  filled: true,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.5,
                                        strokeAlign: StrokeAlign.inside,
                                        color: HexColor.fromHex(
                                            Constants.app_color_primary),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: HexColor.fromHex(
                                            Constants.app_color_on_secondary)
                                        .withOpacity(0.5),
                                  )),
                            ),
                            rowsPerPage: 7,
                            columnSpacing: 16.0 / 2,
                            minWidth: 325,
                            columns: [
                              DataColumn(
                                label: Text(
                                  'الاسم',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (!Responsive.isMobile(context))
                                DataColumn(
                                  label: Text(
                                    'رقم الهاتف',
                                    style: GoogleFonts.cairo(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              DataColumn(
                                label: Text(
                                  'التخصص',
                                  style: GoogleFonts.cairo(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: HexColor.fromHex(
                                          Constants.app_color_on_secondary),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (!Responsive.isMobile(context))
                                DataColumn(
                                  label: Text(
                                    'التقييم',
                                    style: GoogleFonts.cairo(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15,
                                        color: HexColor.fromHex(
                                            Constants.app_color_on_secondary),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

DataRow dataRow(BuildContext context, Doctor doctor) {
  return DataRow(
    cells: [
      DataCell(Text(
        doctor.name!,
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_secondary),
            fontWeight: FontWeight.normal),
      )),
      if (!Responsive.isMobile(context))
        DataCell(Text(
          doctor.phone!,
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.normal),
        )),
      DataCell(Text(
        "doctorsdata.specialty!",
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_secondary),
            fontWeight: FontWeight.normal),
      )),
      if (!Responsive.isMobile(context))
        /* DataCell(Text(
          doctor.rating!,
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.normal),
        )),*/
        DataCell(
          EditBottun(press: () {
            showDialog(
              context: context,
              builder: (context) => CustomerEditDoctorDataView(),
            );
          }),
        ),
      DataCell(
        DeleteBottun(press: () {
          showDeleteDialog(context, () {
            Navigator.of(context).pop();
          });
        }),
      )
    ],
  );
}

class RowSource extends DataTableSource {
  var context;
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return dataRow(context, myData![index]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}
