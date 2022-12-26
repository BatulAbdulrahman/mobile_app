import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:mobile_app/ui/views/settings/settings_view_model.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/title_view/title_view.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final formKey = GlobalKey<FormState>();
  int click_count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                    child: Container(
                  margin: EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0,
                  ),
                  child: TitleView(
                    title: 'الإعدادات',
                  ),
                )),
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (ctx) {
                            return StatefulBuilder(
                              builder: (BuildContext context_,
                                  void Function(void Function()) setState) {
                                return Container(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 32, horizontal: 16),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'شِفاء',
                                            textDirection: TextDirection.rtl,
                                            style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 25,
                                                color: HexColor.fromHex(
                                                    Constants
                                                        .app_color_primary),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Container(
                                          //   child: AppLogo(
                                          //     height: 70.0,
                                          //     width: 70.0,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 16.0 * 2,
                                          ),
                                          Text(
                                            'عن التطبيق',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.cairo(
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                                color: HexColor.fromHex(Constants
                                                    .app_color_on_secondary),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'عن التطبيق',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: HexColor.fromHex(
                                Constants.app_color_on_secondary),
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
