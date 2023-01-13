import 'dart:html' as h;
import 'dart:io' as i;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/ui/shared/primary_button.dart';
import 'package:mobile_app/ui/shared/responsive.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../../core/models/doctor/doctor.dart';
import '../../shared/dropdown_widget.dart';
import '../../shared/textfield_widget.dart';
import '../../widgets/stateless/gender_widget/gender_widget.dart';
import '../../widgets/stateless/work_dates_widget/work_dates_widget.dart';
import '../doctors_management_view/doctors_management_view.dart';
import 'add_doctor_model.dart';

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

class CustomerAddDoctorView extends StatefulWidget {
  Doctor doctor;
  CustomerAddDoctorView({required this.doctor});
  //const CustomerAddDoctorView({Key? key}) : super(key: key);

  @override
  State<CustomerAddDoctorView> createState() => _CustomerAddDoctorViewState();
}

class _CustomerAddDoctorViewState extends State<CustomerAddDoctorView> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? descriptionController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    descriptionController = TextEditingController();
    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameController!.dispose();
    emailController!.dispose();
    phoneController!.dispose();
    passwordController!.dispose();
    descriptionController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerAddDoctorViewModel>.nonReactive(
      viewModelBuilder: () => CustomerAddDoctorViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.doctor);
      },
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
                      'إضافة طبيب',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'اسم الطبيب',
                        // onChanged: (name) {},
                        hintText: 'اسم الطبيب',
                      ),
                      controller: nameController,
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
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'العمر',
                                //onChanged: (name) {},
                                hintText: 'العمر',
                              ),
                              controller: null,
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
              const SizedBox(height: 16.0),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'رقم الهاتف',
                        // onChanged: (name) {},
                        hintText: 'رقم الهاتف',
                      ),
                      controller: phoneController,
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
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'البريد الإلكتروني',
                            //onChanged: (name) {},
                            hintText: 'البريد الإلكتروني',
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'كلمة المرور',
                                  //onChanged: (name) {},
                                  hintText: 'كلمة المرور',
                                ),
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: 16.0),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'السيرة الذاتية',
                          //    onChanged: (name) {},
                          hintText: 'السيرة الذاتية',
                        ),
                        maxLines: 6,
                        cursorHeight: 100,
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
                      'إضافة جدول العمل',
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
                children: [
                  PrimaryButton(
                      buttonText: 'إضافة',
                      press: () {
                        {
                          if (nameController!.text.isNotEmpty) {
                            model.addDoctor(
                              nameController!.text,
                              phoneController!.text,
                              emailController!.text,
                              passwordController!.text,
                              descriptionController!.text,
                            );
                            //model.getUser();
                            print(nameController!.text);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CustomerDoctorsManagementView()),
                          );
                        }
                      })
                ],
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
