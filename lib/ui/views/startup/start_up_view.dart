import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/asset_images.dart';
import '../../../core/constant/constants.dart';
import '/ui/views/startup/start_up_view_model.dart';
import '/ui/widgets/stateless/app_logo.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(context),
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor.fromHex(
            Constants.app_color_primary), //Theme.of(context).cardColor,
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(
                  child: Text(
                    'شِفاء',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.cairo(
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        color: HexColor.fromHex(Constants.app_color_on_primary),
                        fontWeight: FontWeight.bold),
                  ),
                  // Image.asset(
                  //   AssetImages.logo_png,
                  //   height: 250,
                  //   width: 250,
                  // ),
                ),
                model.isBusy
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color:
                              HexColor.fromHex(Constants.app_color_on_primary),
                          //Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
