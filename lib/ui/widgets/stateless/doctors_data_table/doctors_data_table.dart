import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ui/shared/delete_bottun.dart';
import 'package:mobile_app/ui/shared/edit_bottun.dart';
import 'package:mobile_app/ui/views/edit_doctor_data_view/edit_doctor_data_view.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../shared/responsive.dart';
import 'data.dart';
import 'doctors_data_table_model.dart';

class DoctorsDataTable extends StatefulWidget {
  const DoctorsDataTable({Key? key}) : super(key: key);

  @override
  State<DoctorsDataTable> createState() => _DoctorsDataTableState();
}

class _DoctorsDataTableState extends State<DoctorsDataTable> {
  bool sort = true;
  List<DoctorsData>? filterData;

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        filterData!.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }
  }

  @override
  void initState() {
    filterData = demoDoctorsData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorsDataTableModel>.nonReactive(
      viewModelBuilder: () => DoctorsDataTableModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Expanded(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: PaginatedDataTable2(
            sortColumnIndex: 0,
            sortAscending: sort,
            source: RowSource(
              context: context,
              myData: demoDoctorsData,
              count: demoDoctorsData.length,
            ),
            header: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: ' بحث عن طبيب',
                  hintStyle: GoogleFonts.cairo(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    color: HexColor.fromHex(Constants.app_color_on_secondary)
                        .withOpacity(0.5),
                  ),
                  fillColor: HexColor.fromHex(Constants.app_color_on_primary),
                  filled: true,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        strokeAlign: StrokeAlign.inside,
                        color: HexColor.fromHex(Constants.app_color_primary),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: HexColor.fromHex(Constants.app_color_on_secondary)
                        .withOpacity(0.5),
                  )),
              onChanged: (value) {
                setState(() {
                  demoDoctorsData = filterData!
                      .where((element) => element.name!.contains(value))
                      .toList();
                });
              },
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
                        color:
                            HexColor.fromHex(Constants.app_color_on_secondary),
                        fontWeight: FontWeight.bold),
                  ),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sort = !sort;
                    });

                    onsortColum(columnIndex, ascending);
                  }),
              if (!Responsive.isMobile(context))
                DataColumn(
                  label: Text(
                    'رقم الهاتف',
                    style: GoogleFonts.cairo(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color:
                            HexColor.fromHex(Constants.app_color_on_secondary),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              DataColumn(
                label: Text(
                  'التخصص',
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: HexColor.fromHex(Constants.app_color_on_secondary),
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
                        color:
                            HexColor.fromHex(Constants.app_color_on_secondary),
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
    );
  }
}

DataRow dataRow(BuildContext context, DoctorsData doctorsdata) {
  return DataRow(
    cells: [
      DataCell(Text(
        doctorsdata.name!,
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_secondary),
            fontWeight: FontWeight.normal),
      )),
      if (!Responsive.isMobile(context))
        DataCell(Text(
          doctorsdata.phone!,
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.normal),
        )),
      DataCell(Text(
        doctorsdata.specialty!,
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_secondary),
            fontWeight: FontWeight.normal),
      )),
      if (!Responsive.isMobile(context))
        DataCell(Text(
          doctorsdata.evaluate!,
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.normal),
        )),
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
