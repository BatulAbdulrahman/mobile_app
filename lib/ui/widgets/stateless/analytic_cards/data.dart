import 'package:flutter/material.dart';

import 'analytic_info_modle.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/constants.dart';

List analyticData = [
  AnalyticInfo(
    title: "عدد الأطباء",
    count: 2000,
    icon: Icon(
      Icons.business_outlined,
      color: HexColor.fromHex(Constants.app_color_secondary),
    ),
    color: HexColor.fromHex(Constants.app_color_on_secondary),
  ),
  AnalyticInfo(
    title: "عدد المصحات",
    count: 100,
    icon: Icon(
      Icons.list_alt_outlined,
      color: HexColor.fromHex(Constants.app_color_secondary),
    ),
    color: HexColor.fromHex(Constants.app_color_on_secondary),
  ),
  AnalyticInfo(
    title: "عدد التقييمات",
    count: 128015,
    icon: Icon(
      Icons.rate_review_outlined,
      color: HexColor.fromHex(Constants.app_color_secondary),
    ),
    color: HexColor.fromHex(Constants.app_color_on_secondary),
  ),
  AnalyticInfo(
    title: "عدد التخصصات",
    count: 40,
    icon: Icon(
      Icons.business_outlined,
      color: HexColor.fromHex(Constants.app_color_secondary),
    ),
    color: HexColor.fromHex(Constants.app_color_on_secondary),
  ),
];
