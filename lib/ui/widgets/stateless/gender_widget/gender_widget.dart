import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';

class genderWidget extends StatelessWidget {
  const genderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            'الجنس',
            style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        CustomRadioButton(
          enableShape: true,
          elevation: 0,
          unSelectedColor: Theme.of(context).canvasColor,
          buttonLables: [
            'أنثى',
            'ذكر',
          ],
          buttonValues: [
            'أنثى',
            'ذكر',
          ],
          defaultSelected: 'ذكر',
          radioButtonValue: (value) {
            print(value);
          },
          selectedColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
