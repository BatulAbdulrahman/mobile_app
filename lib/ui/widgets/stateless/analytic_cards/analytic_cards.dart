import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';
import '../../../shared/responsive.dart';
import 'analytic_cards_model.dart';
import 'analytic_info_modle.dart';
import 'data.dart';

class AnalyticCards extends StatelessWidget {
  const AnalyticCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<AnalyticCardsModel>.nonReactive(
        viewModelBuilder: () => AnalyticCardsModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Container(
              child: Responsive(
                mobile: AnalyticInfoCardGridView(
                  crossAxisCount: size.width < 675 ? 2 : 4,
                  childAspectRatio: size.width < 675 ? 1.3 : 1,
                ),
                tablet: AnalyticInfoCardGridView(),
                desktop: AnalyticInfoCardGridView(
                  childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                ),
              ),
            ));
  }
}

class AnalyticInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const AnalyticInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: analyticData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) => AnalyticInfoCard(
          info: analyticData[index],
        ),
      ),
    );
  }
}

class AnalyticInfoCard extends StatelessWidget {
  const AnalyticInfoCard({Key? key, required this.info}) : super(key: key);

  final AnalyticInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 / 2,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
          color: HexColor.fromHex(Constants.app_color_on_primary),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(16.0 / 2),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: info.color!.withOpacity(0.1), shape: BoxShape.circle),
            child: info.icon!,
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 15,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${info.count}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cairo(
                fontStyle: FontStyle.normal,
                fontSize: 25,
                color: HexColor.fromHex(Constants.app_color_on_secondary),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
