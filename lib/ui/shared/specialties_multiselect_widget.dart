import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

class SpecialtiesMultiSelectWidget extends StatefulWidget {
  const SpecialtiesMultiSelectWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SpecialtiesMultiSelectWidget> createState() =>
      _SpecialtiesMultiSelectWidgetState();
}

class _SpecialtiesMultiSelectWidgetState
    extends State<SpecialtiesMultiSelectWidget> {
  List? _myActivities;
  late String _myActivitiesResult;
  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: HexColor.fromHex(Constants.app_color_on_primary),
      ),
      child: MultiSelectFormField(
        fillColor: HexColor.fromHex(Constants.app_color_on_primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        autovalidate: AutovalidateMode.disabled,
        chipBackGroundColor: HexColor.fromHex(Constants.app_color_primary),
        chipLabelStyle: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_primary),
            fontWeight: FontWeight.bold),
        dialogTextStyle: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_secondary),
            fontWeight: FontWeight.bold),
        checkBoxActiveColor: HexColor.fromHex(Constants.app_color_secondary),
        checkBoxCheckColor: HexColor.fromHex(Constants.app_color_on_primary),
        dialogShapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        title: Text(
          'تخصصات المصحة',
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value == null || value.length == 0) {
            return 'الرجاء تحديد تخصص واحد أو أكثر';
          }
          return null;
        },
        dataSource: [
          {
            'name': 'عيون',
            'value': 'عيون',
          },
          {
            'name': 'عظام',
            'value': 'عظام',
          },
          {
            'name': 'نساء وولادة',
            'value': 'نساء وولادة',
          },
          {
            'name': 'تخدير',
            'value': 'تخدير',
          },
          {
            'name': 'أعصاب',
            'value': 'أعصاب',
          },
          {
            'name': 'جراحة',
            'value': 'جراحة',
          },
        ],
        textField: 'name',
        valueField: 'value',
        okButtonLabel: 'تم',
        cancelButtonLabel: 'إلغاء',
        hintWidget: Text(
          'الرجاء إختيار تخصص أو أكثر',
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.normal),
        ),
        initialValue: _myActivities,
        onSaved: (value) {
          if (value == null) return;
          setState(() {
            _myActivities = value;
          });
        },
      ),
    );
  }
}
