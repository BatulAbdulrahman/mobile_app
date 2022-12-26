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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (MediaQuery.of(context).size.width < 360)
              Text(
                title,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: HexColor.fromHex(Constants.app_color_on_secondary),
                    fontWeight: FontWeight.bold),
              ),
            if (!(MediaQuery.of(context).size.width < 360))
              Text(
                title,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                    fontStyle: FontStyle.normal,
                    fontSize: 25,
                    color: HexColor.fromHex(Constants.app_color_on_secondary),
                    fontWeight: FontWeight.bold),
              ),
            if (!(MediaQuery.of(context).size.width < 360))
              SizedBox(
                width: 16.0,
              ),
            if ((MediaQuery.of(context).size.width < 360) &&
                (MediaQuery.of(context).size.width > 310))
              SizedBox(
                width: 16.0 / 2,
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
