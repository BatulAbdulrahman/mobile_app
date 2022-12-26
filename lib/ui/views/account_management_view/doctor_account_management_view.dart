import 'dart:html' as h;
import 'dart:io' as i;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/dropdown_widget.dart';
import '../../shared/responsive.dart';
import '../../shared/textfield_widget.dart';
import '../../widgets/stateless/gender_widget/gender_widget.dart';
import '../../widgets/stateless/header/header.dart';
import '../../widgets/stateless/title_view/title_view.dart';
import '../../widgets/stateless/work_dates_widget/work_dates_widget.dart';
import '../edit_doctor_data_view/edit_doctor_data_view.dart';
import 'admin_account_management_view_model.dart';
import 'doctor_account_management_view_model.dart';

class CustomerDoctorAccountManagementView extends StatefulWidget {
  const CustomerDoctorAccountManagementView({Key? key}) : super(key: key);

  @override
  State<CustomerDoctorAccountManagementView> createState() =>
      _CustomerAdminAccountManagementViewState();
}

class _CustomerAdminAccountManagementViewState
    extends State<CustomerDoctorAccountManagementView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<
            CustomerDoctorAccountManagementViewModel>.nonReactive(
        viewModelBuilder: () => CustomerDoctorAccountManagementViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => accountManagementView());
  }
}

class accountManagementView extends StatefulWidget {
  const accountManagementView({
    Key? key,
  }) : super(key: key);

  @override
  State<accountManagementView> createState() => _accountManagementViewState();
}

class _accountManagementViewState extends State<accountManagementView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                  child: Container(
                margin: EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: Header(
                  title: 'إدارة الحساب الشخصـي',
                  buttonText: 'تعديل البيانات',
                  buttonPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomerEditDoctorDataView(),
                    );
                  },
                ),
              )),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 52,
                            backgroundColor:
                                HexColor.fromHex(Constants.app_color_secondary),
                            child: CircleAvatar(
                              backgroundColor: HexColor.fromHex(
                                  Constants.app_color_on_primary),
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'data:image/jpeg;base64,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'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              text: 'هاجر فتحي',
                              label: 'الاسم',
                              onChanged: (name) {},
                              hintText: 'الاسم',
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          if (!Responsive.isMobile(context))
                            const SizedBox(width: 16.0),
                          if (!Responsive.isMobile(context))
                            Expanded(
                              child: TextFieldWidget(
                                text: '5/5',
                                label: 'التقييم',
                                onChanged: (name) {},
                                hintText: 'التقييم',
                                keyboardType: TextInputType.name,
                              ),
                            ),
                        ],
                      ),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: 16.0),
                      if (Responsive.isMobile(context))
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                text: '5/5',
                                label: 'التقييم',
                                onChanged: (name) {},
                                hintText: 'التقييم',
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16.0),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              label: 'رقم الهاتف',
                              text: '0923456781',
                              onChanged: (name) {},
                              hintText: 'رقم الهاتف',
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          if (!Responsive.isMobile(context))
                            const SizedBox(width: 16.0),
                          if (!Responsive.isMobile(context))
                            Expanded(
                              child: TextFieldWidget(
                                label: 'العمر',
                                text: '30',
                                onChanged: (name) {},
                                hintText: 'العمر',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                        ],
                      ),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: 16.0),
                      if (Responsive.isMobile(context))
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                label: 'العمر',
                                text: '30',
                                onChanged: (name) {},
                                hintText: 'العمر',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16.0),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              label: 'الجنس',
                              text: 'أنثى',
                              onChanged: (name) {},
                              hintText: 'الجنس',
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          if (!Responsive.isMobile(context))
                            const SizedBox(width: 16.0),
                          if (!Responsive.isMobile(context))
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(
                                      'التخصص',
                                      style: GoogleFonts.cairo(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: HexColor.fromHex(
                                              Constants.app_color_on_secondary),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownWidget(
                                    hintText: 'اختر تخصص',
                                    roles: [
                                      {'value': 'أطفال'},
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: 16.0),
                      if (Responsive.isMobile(context))
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Text(
                                      'التخصص',
                                      style: GoogleFonts.cairo(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          color: HexColor.fromHex(
                                              Constants.app_color_on_secondary),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownWidget(
                                    hintText: 'اختر تخصص',
                                    roles: [
                                      {'value': 'أطفال'},
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16.0),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  label: 'البريد الإلكتروني',
                                  text: 'abc@gmail.com',
                                  onChanged: (name) {},
                                  hintText: 'البريد الإلكتروني',
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 16.0),
                                TextFieldWidget(
                                  label: 'كلمة المرور',
                                  text: '123456789',
                                  onChanged: (name) {},
                                  hintText: 'كلمة المرور',
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                          if (!Responsive.isMobile(context))
                            const SizedBox(width: 16.0),
                          if (!Responsive.isMobile(context))
                            Expanded(
                              child: TextFieldWidget(
                                label: 'السيرة الذاتية',
                                text: 'دكتورة أطفال بمشفى غريان الطبي',
                                onChanged: (name) {},
                                hintText: 'السيرة الذاتية',
                                maxLines: 6,
                                height: 150,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                        ],
                      ),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: 16.0),
                      if (Responsive.isMobile(context))
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                label: 'السيرة الذاتية',
                                onChanged: (name) {},
                                hintText: 'السيرة الذاتية',
                                maxLines: 6,
                                height: 150,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
