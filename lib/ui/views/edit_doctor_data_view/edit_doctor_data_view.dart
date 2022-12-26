import 'dart:html' as h;
import 'dart:io' as i;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/ui/shared/primary_button.dart';
import 'package:mobile_app/ui/shared/edit_bottun.dart';
import 'package:mobile_app/ui/shared/responsive.dart';
import 'package:mobile_app/ui/views/edit_password_view/edit_password_view.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/dropdown_widget.dart';
import '../../shared/textfield_widget.dart';
import '../../widgets/stateless/gender_widget/gender_widget.dart';
import '../../widgets/stateless/work_dates_widget/work_dates_widget.dart';
import 'edit_doctor_data_view_model.dart';

// bool saturdayAmChecked = false;
// bool saturdayPmChecked = false;
// bool sundayAmChecked = false;
// bool sundayPmChecked = false;
// bool mondayAmChecked = false;
// bool mondayPmChecked = false;
// bool tuesdayAmChecked = false;
// bool tuesdayPmChecked = false;
// bool wednesdayAmChecked = false;
// bool wednesdayPmChecked = false;
// bool thursdayAmChecked = false;
// bool thursdayPmChecked = false;
// bool FridayAmChecked = false;
// bool FridayPmChecked = false;

class CustomerEditDoctorDataView extends StatefulWidget {
  const CustomerEditDoctorDataView({Key? key}) : super(key: key);

  @override
  State<CustomerEditDoctorDataView> createState() =>
      _CustomerEditDoctorDataViewState();
}

class _CustomerEditDoctorDataViewState
    extends State<CustomerEditDoctorDataView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerEditDoctorDataViewModel>.nonReactive(
      viewModelBuilder: () => CustomerEditDoctorDataViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFcfdfda),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(16.0 / 2),
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close),
                        color:
                            HexColor.fromHex(Constants.app_color_on_secondary)),
                    if (!(MediaQuery.of(context).size.width < 360))
                      SizedBox(
                        width: 16.0,
                      ),
                    if ((MediaQuery.of(context).size.width < 360) &&
                        (MediaQuery.of(context).size.width > 310))
                      SizedBox(
                        width: 16.0 / 2,
                      ),
                    Text(
                      'تعديل البيانات',
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'الصورة الشخصية',
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Stack(children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundColor:
                              HexColor.fromHex(Constants.app_color_secondary),
                          child: CircleAvatar(
                              backgroundColor: HexColor.fromHex(
                                  Constants.app_color_on_primary),
                              radius: 50,
                              backgroundImage:
                                  _pickedImage == null && _pickedImageI == null
                                      ? AssetImage('assets/images/photo.png')
                                      : kIsWeb
                                          ? Image.memory(
                                              webImage!,
                                              fit: BoxFit.fill,
                                            ).image
                                          : Image.file(
                                              _pickedImageI!,
                                              fit: BoxFit.fill,
                                            ).image),
                        ),
                        Positioned(
                          bottom: -4,
                          left: -25,
                          child: RawMaterialButton(
                            onPressed: (() {
                              _pickImage();
                            }),
                            fillColor:
                                HexColor.fromHex(Constants.app_color_secondary),
                            shape: CircleBorder(
                              side: BorderSide(
                                color: HexColor.fromHex(
                                    Constants.app_color_on_primary),
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: HexColor.fromHex(
                                  Constants.app_color_on_primary),
                            ),
                          ),
                        ),
                      ]),
                    ]),
              ),
              const SizedBox(height: 16.0),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      label: 'اسم الطبيب',
                      onChanged: (name) {},
                      hintText: 'اسم الطبيب',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: 16.0),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: genderWidget(),
                          ),
                          Expanded(
                            child: TextFieldWidget(
                              label: 'العمر',
                              onChanged: (name) {},
                              hintText: 'العمر',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              if (Responsive.isMobile(context)) const SizedBox(height: 16.0),
              if (Responsive.isMobile(context))
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: genderWidget(),
                    ),
                  ],
                ),
              if (Responsive.isMobile(context)) const SizedBox(height: 16.0),
              if (Responsive.isMobile(context))
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        label: 'العمر',
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
                      label: 'رقم الهاتف',
                      onChanged: (name) {},
                      hintText: 'رقم الهاتف',
                      keyboardType: TextInputType.phone,
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
              if (Responsive.isMobile(context)) const SizedBox(height: 16.0),
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
                          onChanged: (name) {},
                          hintText: 'البريد الإلكتروني',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                label: 'كلمة المرور',
                                onChanged: (name) {},
                                hintText: 'كلمة المرور',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                            ),
                            SizedBox(width: 16.0 * 1.8),
                            Column(
                              children: [
                                SizedBox(height: 16.0 * 1.8),
                                PrimaryButton(
                                  buttonText: 'تغيير كلمة المرور',
                                  press: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          CustomerEditPasswordView(),
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
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
                        onChanged: (name) {},
                        hintText: 'السيرة الذاتية',
                        maxLines: 6,
                        height: 150,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                ],
              ),
              if (Responsive.isMobile(context)) const SizedBox(height: 16.0),
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
              const SizedBox(height: 16.0 * 2),
              Container(
                margin: EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'جدول العمل',
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.cairo(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: HexColor.fromHex(
                              Constants.app_color_on_secondary),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    WorkDatesWidget(
                      day: 'سبت',
                    ),
                    SizedBox(height: 16.0 / 2),
                    WorkDatesWidget(
                      day: 'أحد',
                    ),
                    SizedBox(height: 16.0 / 2),
                    WorkDatesWidget(
                      day: 'إثنين',
                    ),
                    SizedBox(height: 16.0 / 2),
                    WorkDatesWidget(
                      day: 'ثلاثاء',
                    ),
                    SizedBox(height: 16.0 / 2),
                    WorkDatesWidget(
                      day: 'إربعاء',
                    ),
                    SizedBox(height: 16.0 / 2),
                    WorkDatesWidget(
                      day: 'خميس',
                    ),
                    SizedBox(height: 16.0 / 2),
                    WorkDatesWidget(
                      day: 'جمعة',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [PrimaryButton(buttonText: 'حفظ', press: () {})],
              ),
            ],
          ),
        ),
      ),
    );
  }

  h.File? _pickedImage;
  i.File? _pickedImageI;
  Uint8List? webImage = Uint8List(8);
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final _picker = ImagePicker();
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = i.File(image.path);
        setState(() {
          _pickedImageI = selected;
        });
      } else {
        print('No image picked');
      }
    } else if (kIsWeb) {
      final _picker = ImagePicker();
      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = h.File([], 'a');
        });
      } else {
        print('No image picked.');
      }
    } else {
      print('something went wrong.');
    }
  }
}
