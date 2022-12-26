import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

class EditBottun extends StatelessWidget {
  final VoidCallback press;

  const EditBottun({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0 / 2,
          ),
          backgroundColor: HexColor.fromHex(Constants.app_color_primary)),
      onPressed: press,
      child: Text(
        'تعديل',
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_on_primary),
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
