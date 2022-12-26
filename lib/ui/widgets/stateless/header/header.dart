import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../shared/primary_button.dart';
import '../../../shared/responsive.dart';
import '../title_view/title_view.dart';

class Header extends StatelessWidget {
  final VoidCallback buttonPress;
  final String title;
  final String buttonText;

  const Header({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.buttonPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
      ),
      child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleView(
              title: title,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                if (!Responsive.isMobile(context))
                  SizedBox(
                    width: 16.0 / 2,
                  ),
                PrimaryButton(press: buttonPress, buttonText: buttonText),
                SizedBox(
                  width: 16.0 / 2,
                ),
              ],
            ),
          ]),
    );
  }
}
