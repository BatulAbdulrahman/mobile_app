import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget({
    Key? key,
    required this.roles,
    // this.text = '',
    required this.hintText,
  }) : super(key: key);

  final List<Map<String, dynamic>> roles;
  // final String text;

  final String hintText;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  // late final DropdownEditingController<Map<String, dynamic>> controller;

  // @override
  // void initState() {
  //   super.initState();

  //   controller = DropdownEditingController<Map<String, dynamic>>(
  //       value: widget.text);
  // }

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: HexColor.fromHex(Constants.app_color_on_primary),
      ),
      child: DropdownFormField<Map<String, dynamic>>(
        emptyText: 'لا يوجد تطابق',
        onEmptyActionPressed: () async {},
        // controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(Icons.arrow_drop_down),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary)
                  .withOpacity(0.2),
              fontWeight: FontWeight.normal),
          hintTextDirection: TextDirection.rtl,
        ),
        onSaved: (dynamic str) {},
        onChanged: (dynamic str) {},
        validator: (dynamic str) {},
        displayItemFn: (dynamic item) => Text(
          (item ?? {})['value'] ?? '',
          style: GoogleFonts.cairo(
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: HexColor.fromHex(Constants.app_color_on_secondary),
              fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
        findFn: (dynamic str) async => widget.roles,
        selectedFn: (dynamic item1, dynamic item2) {
          if (item1 != null && item2 != null) {
            return item1['value'] == item2['value'];
          }
          return false;
        },
        filterFn: (dynamic item, str) =>
            item['value'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
        dropdownItemFn: (dynamic item, int position, bool focused,
                bool selected, Function() onTap) =>
            ListTile(
          title: Text(
            item['value'],
            textDirection: TextDirection.rtl,
            style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.bold),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
