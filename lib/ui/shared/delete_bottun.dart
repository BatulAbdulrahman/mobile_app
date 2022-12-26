import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

class DeleteBottun extends StatelessWidget {
  final VoidCallback press;
  const DeleteBottun({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          side: BorderSide(
            width: 0.5,
            strokeAlign: StrokeAlign.inside,
            color: HexColor.fromHex(Constants.app_color_primary),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0 / 2,
          ),
          backgroundColor: HexColor.fromHex(Constants.app_color_on_primary)),
      onPressed: press,
      child: Text(
        'حذف',
        style: GoogleFonts.cairo(
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: HexColor.fromHex(Constants.app_color_primary),
            fontWeight: FontWeight.normal),
      ),
    );
  }
}

Future<dynamic> showDeleteDialog(
    BuildContext context, VoidCallback delerePressed) {
  return showDialog(
    context: context,
    builder: (context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text(
          'حذف',
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
                style: GoogleFonts.cairo(
                    fontStyle: FontStyle.normal, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'إلغاء',
              style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  color: HexColor.fromHex(Constants.app_color_on_secondary),
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'حذف',
              style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  color: Color(0xFFff0000),
                  fontWeight: FontWeight.bold),
            ),
            onPressed: delerePressed,
          ),
        ],
      ),
    ),
  );
}
