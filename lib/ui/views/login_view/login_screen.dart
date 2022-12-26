import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/responsive.dart';
import '../../shared/signin_button.dart';
import 'login_screen_model.dart';

class CustomerLoginView extends StatefulWidget {
  const CustomerLoginView({Key? key}) : super(key: key);

  @override
  State<CustomerLoginView> createState() => _CustomerLoginViewState();
}

class _CustomerLoginViewState extends State<CustomerLoginView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<CustomerLoginViewModel>.reactive(
      onModelReady: (model) {
        model.init(context);
      },
      viewModelBuilder: () => CustomerLoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                        SizedBox(height: height * 0.064),
                        if (Responsive.isMobile(context))
                          Center(
                              child: Text(
                            'شِفاء',
                            style: GoogleFonts.cairo(
                                fontStyle: FontStyle.normal,
                                fontSize: 48,
                                color: HexColor.fromHex(
                                    Constants.app_color_secondary),
                                fontWeight: FontWeight.bold),
                          )),
                        // AppLogo(
                        //   height: 250,
                        //   width: 250,
                        // ),
                        SizedBox(height: height * 0.064),
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
                          'مرحبًا، قم بادخال بياناتك لتسجيل الدخول لحسابك',
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
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
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
                            color: HexColor.fromHex(
                                Constants.app_color_on_primary),
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
                                color: HexColor.fromHex(
                                        Constants.app_color_primary)
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        SigninButton(
                          press: () {},
                          title: 'تسجيل الدخول',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
