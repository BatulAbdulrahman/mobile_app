import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/logger.dart';
import 'package:stacked/stacked.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
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
  CustomerDoctorsManagementViewModel custormer =
      CustomerDoctorsManagementViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerDoctorsManagementViewModel>.reactive(
        viewModelBuilder: () {
          ;
          return custormer;
        },
        onModelReady: (model) async => model.init(context).then((value) {
              model.notifyListeners();
              print(model.doctors.first.name);
            }),
        builder: (context, model, child) => model.isBusy
            ? Container()
            : Container(
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
                                builder: (context) => CustomerAddDoctorView(
                                    doctor: model.doctor!),
                              );
                            }),

                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextField(
                                      textDirection: TextDirection.rtl,
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          hintText: ' بحث عن طبيب',
                                          hintStyle: GoogleFonts.cairo(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15,
                                            color: HexColor.fromHex(Constants
                                                    .app_color_on_secondary)
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
                                                    Constants
                                                        .app_color_primary),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: HexColor.fromHex(Constants
                                                    .app_color_on_secondary)
                                                .withOpacity(0.5),
                                          )),
                                    ),
                                    DataTable(
                                      //columnSpacing: 25,
                                      columns: [
                                        DataColumn(
                                          label: Text(
                                            'الاسم',
                                            style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20,
                                                color: HexColor.fromHex(Constants
                                                    .app_color_on_secondary),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        if (!Responsive.isMobile(context))
                                          DataColumn(
                                            label: Text(
                                              'رقم الهاتف',
                                              style: GoogleFonts.cairo(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 20,
                                                  color: HexColor.fromHex(Constants
                                                      .app_color_on_secondary),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        DataColumn(
                                          label: Text(
                                            'التخصص',
                                            style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 20,
                                                color: HexColor.fromHex(Constants
                                                    .app_color_on_secondary),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        if (!Responsive.isMobile(context))
                                          DataColumn(
                                            label: Text(
                                              'التقييم',
                                              style: GoogleFonts.cairo(
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 20,
                                                  color: HexColor.fromHex(Constants
                                                      .app_color_on_secondary),
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
                                      rows: model.doctors
                                          .map((doctor) => DataRow(cells: [
                                                DataCell(Text(
                                                  doctor.name!,
                                                  style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_secondary),
                                                      fontWeight:
                                                          FontWeight.normal),
                                                )),
                                                if (!Responsive.isMobile(
                                                    context))
                                                  DataCell(Text(
                                                    doctor.phone!,
                                                    style: GoogleFonts.cairo(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15,
                                                        color: HexColor.fromHex(
                                                            Constants
                                                                .app_color_on_secondary),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )),
                                                DataCell(Text(
                                                  /* doctor.specializations!.first
                                                          .name ??*/
                                                  "null",
                                                  style: GoogleFonts.cairo(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 15,
                                                      color: HexColor.fromHex(
                                                          Constants
                                                              .app_color_on_secondary),
                                                      fontWeight:
                                                          FontWeight.normal),
                                                )),
                                                if (!Responsive.isMobile(
                                                    context))
                                                  DataCell(Text(
                                                    "5",
                                                    style: GoogleFonts.cairo(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 15,
                                                        color: HexColor.fromHex(
                                                            Constants
                                                                .app_color_on_secondary),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )),
                                                DataCell(
                                                  EditBottun(press: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          CustomerEditDoctorDataView(),
                                                    );
                                                  }),
                                                ),
                                                DataCell(
                                                  DeleteBottun(press: () {
                                                    showDeleteDialog(context,
                                                        () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  }),
                                                )
                                              ]))
                                          .toList(),
                                    ),
                                  ]),
                            ),
                          ),
                        ),

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
