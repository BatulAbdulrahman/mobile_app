import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ui/shared/primary_button.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/textfield_widget.dart';
import 'add_specialtie_model.dart';

class CustomerAddSpecialtieView extends StatefulWidget {
  const CustomerAddSpecialtieView({Key? key}) : super(key: key);

  @override
  State<CustomerAddSpecialtieView> createState() =>
      _CustomerAddSpecialtieViewState();
}

class _CustomerAddSpecialtieViewState extends State<CustomerAddSpecialtieView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerAddSpecialtieViewModel>.nonReactive(
      viewModelBuilder: () => CustomerAddSpecialtieViewModel(),
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
                      'إضافة تخصص',
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
                        hintText: 'اسم التخصص',
                        keyboardType: TextInputType.name,
                      ),
                    ]),
              ),
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
}
