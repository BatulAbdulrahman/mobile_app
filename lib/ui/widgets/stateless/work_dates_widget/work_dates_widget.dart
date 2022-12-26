import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../shared/dropdown_widget.dart';
import '../../../shared/responsive.dart';

class WorkDatesWidget extends StatefulWidget {
  final String day;
  const WorkDatesWidget({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  State<WorkDatesWidget> createState() => _WorkDatesWidgetState();
}

class _WorkDatesWidgetState extends State<WorkDatesWidget> {
  bool amChecked = false;
  bool pmChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: HexColor.fromHex(Constants.app_color_primary),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          if (!Responsive.isMobile(context))
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Text(
                      widget.day,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color:
                              HexColor.fromHex(Constants.app_color_on_primary),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: DropdownWidget(
                      hintText: 'اختر مصحة',
                      roles: [
                        {'value': 'مشفى غريان الطبي'},
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      CustomCheckBox(
                        value: amChecked,
                        shouldShowBorder: true,
                        borderColor:
                            HexColor.fromHex(Constants.app_color_on_primary),
                        checkedFillColor:
                            HexColor.fromHex(Constants.app_color_secondary),
                        borderRadius: 5,
                        borderWidth: 2,
                        checkBoxSize: 22,
                        onChanged: (val) {
                          setState(() {
                            amChecked = val;
                          });
                        },
                      ),
                      Text(
                        'صباحًا',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        width: 16 / 2,
                      ),
                      CustomCheckBox(
                        value: pmChecked,
                        shouldShowBorder: true,
                        borderColor:
                            HexColor.fromHex(Constants.app_color_on_primary),
                        checkedFillColor:
                            HexColor.fromHex(Constants.app_color_secondary),
                        borderRadius: 5,
                        borderWidth: 2,
                        checkBoxSize: 22,
                        onChanged: (val) {
                          setState(() {
                            pmChecked = val;
                          });
                        },
                      ),
                      Text(
                        'مساءًا',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ))
                ]),
          if (Responsive.isMobile(context))
            Text(
              widget.day,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                  fontWeight: FontWeight.bold),
            ),
          if (Responsive.isMobile(context))
            SizedBox(
              height: 16.0,
            ),
          if (Responsive.isMobile(context))
            DropdownWidget(
              hintText: 'اختر مصحة',
              roles: [
                {'value': 'مشفى غريان الطبي'},
              ],
            ),
          if (Responsive.isMobile(context))
            SizedBox(
              height: 16.0,
            ),
          if (Responsive.isMobile(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                CustomCheckBox(
                  value: amChecked,
                  shouldShowBorder: true,
                  borderColor: HexColor.fromHex(Constants.app_color_on_primary),
                  checkedFillColor:
                      HexColor.fromHex(Constants.app_color_secondary),
                  borderRadius: 5,
                  borderWidth: 2,
                  checkBoxSize: 22,
                  onChanged: (val) {
                    setState(() {
                      amChecked = val;
                    });
                  },
                ),
                Text(
                  'صباحًا',
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: HexColor.fromHex(Constants.app_color_on_primary),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: 16 / 2,
                ),
                CustomCheckBox(
                  value: pmChecked,
                  shouldShowBorder: true,
                  borderColor: HexColor.fromHex(Constants.app_color_on_primary),
                  checkedFillColor:
                      HexColor.fromHex(Constants.app_color_secondary),
                  borderRadius: 5,
                  borderWidth: 2,
                  checkBoxSize: 22,
                  onChanged: (val) {
                    setState(() {
                      pmChecked = val;
                    });
                  },
                ),
                Text(
                  'مساءًا',
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: HexColor.fromHex(Constants.app_color_on_primary),
                      fontWeight: FontWeight.normal),
                ),
              ],
            )
        ],
      ),
    );
  }
}
