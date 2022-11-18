import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/analytic_cards/analytic_cards.dart';
import '../../widgets/stateless/title_view/title_view.dart';
import 'home_view_model.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerHomeViewModel>.nonReactive(
        viewModelBuilder: () => CustomerHomeViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => homeView());
  }
}

class homeView extends StatelessWidget {
  const homeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                child: TitleView(
              title: "الرئيسية",
            )),
            Expanded(
              child: AnalyticCards(),
            )
          ],
        ),
      ),
    );
  }
}
