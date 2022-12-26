import 'dart:html' as h;
import 'dart:io' as i;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/ui/shared/primary_button.dart';
import 'package:mobile_app/ui/shared/responsive.dart';
import 'package:stacked/stacked.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/specialties_multiselect_widget.dart';
import '../../shared/textfield_widget.dart';
import 'add_clinic_model.dart';

class CustomerAddClinicView extends StatefulWidget {
  const CustomerAddClinicView({Key? key}) : super(key: key);

  @override
  State<CustomerAddClinicView> createState() => _CustomerAddClinicViewState();
}

class _CustomerAddClinicViewState extends State<CustomerAddClinicView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerAddClinicViewModel>.nonReactive(
      viewModelBuilder: () => CustomerAddClinicViewModel(),
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
                      'إضافة مصحة',
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
                        'صورة المصحة',
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
                    child: Column(
                      children: [
                        TextFieldWidget(
                          label: 'اسم المصحة',
                          onChanged: (name) {},
                          hintText: 'اسم المصحة',
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 16.0),
                        TextFieldWidget(
                          label: 'الموقع',
                          onChanged: (name) {},
                          hintText: 'الموقع',
                          keyboardType: TextInputType.name,
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
                        label: 'الوصف',
                        onChanged: (name) {},
                        hintText: 'الوصف',
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
                        label: 'الوصف',
                        onChanged: (name) {},
                        hintText: 'الوصف ',
                        maxLines: 6,
                        height: 150,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16.0),
              SpecialtiesMultiSelectWidget(),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [PrimaryButton(buttonText: 'إضافة', press: () {})],
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
