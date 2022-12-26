import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/constants.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  final double height;
  final TextInputType keyboardType;
  final bool obscureText;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    this.text = '',
    required this.onChanged,
    required this.hintText,
    this.height = 50,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              widget.label,
              style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: HexColor.fromHex(Constants.app_color_on_secondary),
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: HexColor.fromHex(Constants.app_color_on_primary),
            ),
            child: TextField(
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.w400,
              ),
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: widget.hintText,
                hintTextDirection: TextDirection.rtl,
              ),
              maxLines: widget.maxLines,
            ),
          ),
        ],
      );
}
