import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../widgets/stateless/title_view/title_view.dart';
import 'account_management_view_model.dart';

class CustomerAccountManagementView extends StatelessWidget {
  const CustomerAccountManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerAccountManagementViewModel>.nonReactive(
        viewModelBuilder: () => CustomerAccountManagementViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => accountManagementView());
  }
}

class accountManagementView extends StatelessWidget {
  const accountManagementView({
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
                  child: TitleView(
                title: "إدارة الحساب الشخصـي",
              )),
              Expanded(
                child: Container(),
                // SingleChildScrollView(
                //   padding: EdgeInsets.symmetric(vertical: 20),
                //   child: Column(
                //     children: [
                //       SizedBox(height: 20),
                //       Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //         child: TextButton(
                //           style: TextButton.styleFrom(
                //             primary: Color(0xFFFF7643),
                //             padding: EdgeInsets.all(20),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15)),
                //             backgroundColor: Color(0xFFF5F6F9),
                //           ),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(Icons.person_outline),
                //               SizedBox(width: 20),
                //               Expanded(child: Text('My Account')),
                //               Icon(Icons.arrow_forward_ios),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //         child: TextButton(
                //           style: TextButton.styleFrom(
                //             primary: Color(0xFFFF7643),
                //             padding: EdgeInsets.all(20),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15)),
                //             backgroundColor: Color(0xFFF5F6F9),
                //           ),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(Icons.person_outline),
                //               SizedBox(width: 20),
                //               Expanded(child: Text('Notifications')),
                //               Icon(Icons.arrow_forward_ios),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //         child: TextButton(
                //           style: TextButton.styleFrom(
                //             primary: Color(0xFFFF7643),
                //             padding: EdgeInsets.all(20),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15)),
                //             backgroundColor: Color(0xFFF5F6F9),
                //           ),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(Icons.person_outline),
                //               SizedBox(width: 20),
                //               Expanded(child: Text('Settings')),
                //               Icon(Icons.arrow_forward_ios),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //         child: TextButton(
                //           style: TextButton.styleFrom(
                //             primary: Color(0xFFFF7643),
                //             padding: EdgeInsets.all(20),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15)),
                //             backgroundColor: Color(0xFFF5F6F9),
                //           ),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(Icons.person_outline),
                //               SizedBox(width: 20),
                //               Expanded(child: Text('Help Center')),
                //               Icon(Icons.arrow_forward_ios),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //         child: TextButton(
                //           style: TextButton.styleFrom(
                //             primary: Color(0xFFFF7643),
                //             padding: EdgeInsets.all(20),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(15)),
                //             backgroundColor: Color(0xFFF5F6F9),
                //           ),
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               Icon(Icons.person_outline),
                //               SizedBox(width: 20),
                //               Expanded(child: Text('Log Out')),
                //               Icon(Icons.arrow_forward_ios),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
