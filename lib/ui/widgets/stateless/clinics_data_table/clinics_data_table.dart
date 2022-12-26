import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ui/shared/delete_bottun.dart';
import 'package:mobile_app/ui/shared/edit_bottun.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../views/edit_clinic_data_view/edit_clinic_data_view.dart';
import 'data.dart';
import 'clinics_data_table_model.dart';

class ClinicsDataTable extends StatefulWidget {
  const ClinicsDataTable({Key? key}) : super(key: key);

  @override
  State<ClinicsDataTable> createState() => _ClinicsDataTableState();
}

class _ClinicsDataTableState extends State<ClinicsDataTable> {
  bool sort = true;
  List<ClinicsData>? filterData;

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
    filterData = demoClinicsData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClinicsDataTableModel>.nonReactive(
      viewModelBuilder: () => ClinicsDataTableModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Expanded(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: PaginatedDataTable2(
            sortColumnIndex: 0,
            sortAscending: sort,
            source: RowSource(
              context: context,
              myData: demoClinicsData,
              count: demoClinicsData.length,
            ),
            header: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: ' بحث عن مصحة',
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
                  demoClinicsData = filterData!
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
              DataColumn(
                label: Text(
                  'الموقع',
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: HexColor.fromHex(Constants.app_color_on_secondary),
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

DataRow dataRow(BuildContext context, ClinicsData doctorsdata) {
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
      DataCell(Text(
        doctorsdata.location!,
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
            builder: (context) => CustomerEditClinicDataView(),
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
