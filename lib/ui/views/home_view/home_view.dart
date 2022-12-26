import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  child: Container(
                margin: EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: TitleView(
                  title: 'الرئيسية',
                ),
              )),
              Expanded(
                child: AnalyticCards(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
