import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';

class SigninButton extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const SigninButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(16.0),
          child: Ink(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0 * 2.5, vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: HexColor.fromHex(Constants.app_color_secondary),
            ),
            child: Text(
              title,
              style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
                color: HexColor.fromHex(Constants.app_color_on_primary),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
