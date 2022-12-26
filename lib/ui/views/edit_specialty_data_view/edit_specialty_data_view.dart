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
import 'edit_specialty_data_view_model.dart';

class CustomerEditSpecialtyDataView extends StatefulWidget {
  const CustomerEditSpecialtyDataView({Key? key}) : super(key: key);

  @override
  State<CustomerEditSpecialtyDataView> createState() =>
      _CustomerEditSpecialtyDataViewState();
}

class _CustomerEditSpecialtyDataViewState
    extends State<CustomerEditSpecialtyDataView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerEditSpecialtyDataViewModel>.nonReactive(
      viewModelBuilder: () => CustomerEditSpecialtyDataViewModel(),
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
              SizedBox(
                height: 16 * 2,
              ),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      TextFieldWidget(
                        label: 'اسم التخصص',
                        onChanged: (name) {},
                        text: 'عيون',
                        hintText: 'اسم التخصص',
                        keyboardType: TextInputType.name,
                      ),
                    ]),
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
}
