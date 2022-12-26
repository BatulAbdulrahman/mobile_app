import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback press;
  final bool selected;

  const DrawerListTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.press,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedTileColor: HexColor.fromHex(Constants.app_color_secondary),
      horizontalTitleGap: 0.0,
      trailing: icon,
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.cairo(
          fontStyle: FontStyle.normal,
          color: HexColor.fromHex(Constants.app_color_on_primary),
        ),
      ),
      onTap: press,
    );
  }
}
