import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ui/widgets/stateless/title_view/title_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../shared/drawer_menu_controler.dart';
import '../../../shared/responsive.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TitleViewModel>.nonReactive(
      viewModelBuilder: () => TitleViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Container(
        margin: EdgeInsets.only(
          top: 16.0 * 3,
          bottom: 16.0 * 3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.cairo(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,
                  color: HexColor.fromHex(Constants.app_color_on_secondary),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 16.0 * 1,
            ),
            if (!Responsive.isDesktop(context))
              IconButton(
                  onPressed: context.read<DrawerMenuControler>().menuControl,
                  icon: Icon(Icons.menu),
                  color: HexColor.fromHex(Constants.app_color_on_secondary)),
          ],
        ),
      ),
    );
  }
}
