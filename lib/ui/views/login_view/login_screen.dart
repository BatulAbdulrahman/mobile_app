import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/responsive.dart';

class CustomerLoginView extends StatefulWidget {
  const CustomerLoginView({Key? key}) : super(key: key);

  @override
  State<CustomerLoginView> createState() => _CustomerLoginViewState();
}

class _CustomerLoginViewState extends State<CustomerLoginView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context)
                        ? height * 0.032
                        : height * 0.12),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'لنقم',
                              style: GoogleFonts.cairo(
                                fontStyle: FontStyle.normal,
                                fontSize: 25.0,
                                color: HexColor.fromHex(
                                    Constants.app_color_primary_variant),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' بتسجيل الدخول',
                              style: GoogleFonts.cairo(
                                fontStyle: FontStyle.normal,
                                fontSize: 25.0,
                                color: HexColor.fromHex(
                                    Constants.app_color_primary_variant),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'مرحبًا، قم بادخال بياناتك لتسجيل الدخول لحسابك.',
                        style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'البريد الإلكتروني',
                          style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0,
                            color: HexColor.fromHex(
                                Constants.app_color_primary_variant),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color:
                              HexColor.fromHex(Constants.app_color_on_primary),
                        ),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0,
                            color: HexColor.fromHex(
                                Constants.app_color_primary_variant),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.email_outlined,
                                color: HexColor.fromHex(
                                    Constants.app_color_primary_variant),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'ادخل البريد الإلكتروني',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: GoogleFonts.cairo(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                              color: HexColor.fromHex(
                                      Constants.app_color_primary_variant)
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          'كلمة المرور',
                          style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0,
                            color: HexColor.fromHex(
                                Constants.app_color_primary_variant),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color:
                              HexColor.fromHex(Constants.app_color_on_primary),
                        ),
                        child: TextFormField(
                          style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0,
                            color: HexColor.fromHex(
                                Constants.app_color_primary_variant),
                            fontWeight: FontWeight.w400,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.lock_outline,
                                color: HexColor.fromHex(
                                    Constants.app_color_primary_variant),
                              ),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: HexColor.fromHex(
                                    Constants.app_color_primary_variant),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'ادخل كلمة المرور',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: GoogleFonts.cairo(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                              color:
                                  HexColor.fromHex(Constants.app_color_primary)
                                      .withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: GoogleFonts.cairo(
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                              color:
                                  HexColor.fromHex(Constants.app_color_primary),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Center(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(16.0),
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70.0, vertical: 18.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: HexColor.fromHex(
                                    Constants.app_color_secondary),
                              ),
                              child: Text(
                                'تسجيل الدخول',
                                style: GoogleFonts.cairo(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0,
                                  color: HexColor.fromHex(
                                      Constants.app_color_on_primary),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Responsive.isMobile(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: HexColor.fromHex(Constants.app_color_primary),
                      child: Center(
                          child: Text(
                        'شِفاء',
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 48,
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
