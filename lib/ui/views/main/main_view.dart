import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/ui/shared/responsive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:mobile_app/generated/l10n.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/constants.dart';
import '../../shared/drawer_menu_controler.dart';
import '../../widgets/stateless/drawer/customer_drawer_menu.dart';
import '../home_view/home_view.dart';
import '../posts_list/posts_list_view.dart';
import '/ui/widgets/animation/fade_in.dart';
import '../settings/settings_view.dart';
import 'main_view_model.dart';

class CustomerMainView extends StatefulWidget {
  const CustomerMainView({Key? key}) : super(key: key);

  @override
  State<CustomerMainView> createState() => _CustomerMainViewState();
}

class _CustomerMainViewState extends State<CustomerMainView> {
  final _views = [FadeIn(child: PostsListView())];
  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomerMainViewModel>.reactive(
      onModelReady: (model) {
        model.init(context);
      },
      viewModelBuilder: () => CustomerMainViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: _views.length,
        child: Scaffold(
            key: context.read<DrawerMenuControler>().ScaffoldKey,
            drawer: CustomerDrawerMenu(),
            body: SafeArea(
              child: Row(children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomerHomeView(),
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: CustomerDrawerMenu(),
                  )
              ]),
            )),
      ),
    );
  }
}


// class CustomerMainView extends StatefulWidget {
//   @override
//   _CustomerMainViewState createState() => _CustomerMainViewState();
// }

// class _CustomerMainViewState extends State<CustomerMainView> {
//   final _views = [
//     FadeIn(child: PostsListView()),
//     FadeIn(child: SettingsView())
//   ];

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

// //
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<CustomerMainViewModel>.reactive(
//       onModelReady: (model) {
//         model.init(context);
//       },
//       viewModelBuilder: () => CustomerMainViewModel(),
//       builder: (context, model, child) => DefaultTabController(
//         length: _views.length,
//         child: Scaffold(
//           bottomNavigationBar: ValueListenableBuilder(
//             //valueListenable: CustomerMainView.notifier,
//             valueListenable: ValueNotifier<bool>(true),
//             builder: (context, bool value, child) => AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               height: value ? kBottomNavigationBarHeight - 5 : 0.0,
//               child: Wrap(
//                 children: <Widget>[
//                   BottomNavigationBar(
//                     selectedFontSize: 12,
//                     unselectedFontSize: 12,
//                     type: BottomNavigationBarType.fixed,
//                     backgroundColor: Colors.white,
//                     selectedItemColor: Theme.of(context).colorScheme.primary,
//                     unselectedItemColor:
//                         Theme.of(context).colorScheme.primary.withOpacity(0.3),
//                     items: <BottomNavigationBarItem>[
//                       BottomNavigationBarItem(
//                         icon: Icon(
//                           Icons.home,
//                           size: 25,
//                         ),
//                         label: AppLocalizations.of(context).main_view_home,
//                       ),
//                       BottomNavigationBarItem(
//                         icon: Icon(
//                           Icons.settings,
//                           size: 25,
//                         ),
//                         label: AppLocalizations.of(context).main_view_settings,
//                       ),
//                     ],
//                     currentIndex: _selectedIndex,
//                     onTap: _onItemTapped,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           body: Center(
//             child: _views.elementAt(_selectedIndex),
//           ),
//         ),
//       ),
//     );
//   }
// }
