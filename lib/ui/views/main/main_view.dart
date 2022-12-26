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
import '../clinics_management_view/clinics_management_view.dart';
import '../doctors_management_view/doctors_management_view.dart';
import '../home_view/home_view.dart';
import '../login_view/login_screen.dart';
import '../account_management_view/doctor_account_management_view.dart';
import '../specialties_management_view/specialties_management_view.dart';
import '/ui/widgets/animation/fade_in.dart';
import '../settings/settings_view.dart';
import 'main_view_model.dart';

class CustomerMainView extends StatefulWidget {
  const CustomerMainView({Key? key}) : super(key: key);

  @override
  State<CustomerMainView> createState() => _CustomerMainViewState();
}

class _CustomerMainViewState extends State<CustomerMainView> {
  final _views = [
    FadeIn(child: CustomerHomeView()),
    FadeIn(child: CustomerDoctorAccountManagementView()),
    FadeIn(child: CustomerDoctorsManagementView()),
    FadeIn(child: CustomerClinicsManagementView()),
    FadeIn(child: CustomerSpecialtiesManagementView()),
    FadeIn(child: SettingsView()),
  ];
  late bool homeSelected = true;
  late bool accSelected = false;
  late bool docSelected = false;
  late bool clinSelected = false;
  late bool specSelected = false;
  late bool settSelected = false;

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // if (_scaffoldKey.currentState.isDrawerOpen)
      //   _scaffoldKey.currentState.openEndDrawer();
      // else {
      //   _scaffoldKey.currentState.openDrawer();
      // }
      // context
      //     .read<DrawerMenuControler>()
      //     .ScaffoldKey
      //     .currentState!
      //     .closeDrawer();
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
            endDrawer: CustomerDrawerMenu(context),
            body: SafeArea(
              child: Row(textDirection: TextDirection.rtl, children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: CustomerDrawerMenu(context),
                  ),
                Expanded(
                  flex: 5,
                  child: _views.elementAt(_selectedIndex),
                ),
              ]),
            )),
      ),
    );
  }

  Container CustomerDrawerMenu(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: HexColor.fromHex(Constants.app_color_primary),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'شِفاء',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.cairo(
                      fontStyle: FontStyle.normal,
                      fontSize: 25,
                      color: HexColor.fromHex(Constants.app_color_on_primary),
                      fontWeight: FontWeight.bold),
                ),
                // AppLogo(
                //   height: 250,
                //   width: 250,
                // ),
              ),
              DrawerHeader(
                child: CircleAvatar(
                  radius: 52,
                  backgroundColor:
                      HexColor.fromHex(Constants.app_color_secondary),
                  child: CircleAvatar(
                    backgroundColor:
                        HexColor.fromHex(Constants.app_color_on_primary),
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'data:image/jpeg;base64,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'),
                  ),
                ),
              ),
              DrawerListTile(
                selected: homeSelected,
                press: () {
                  _onItemTapped(0);
                  if (_selectedIndex == 0) {
                    accSelected = false;
                    docSelected = false;
                    clinSelected = false;
                    specSelected = false;
                    settSelected = false;
                    homeSelected = true;
                  }
                },
                title: 'الرئيسية',
                icon: Icon(
                  Icons.home_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
              DrawerListTile(
                selected: accSelected,
                press: () {
                  _onItemTapped(1);
                  if (_selectedIndex == 1) {
                    docSelected = false;
                    clinSelected = false;
                    specSelected = false;
                    settSelected = false;
                    homeSelected = false;
                    accSelected = true;
                  }
                },
                title: 'إدارة الحساب الشخصـي',
                icon: Icon(
                  Icons.manage_accounts_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
              DrawerListTile(
                selected: docSelected,
                press: () {
                  _onItemTapped(2);
                  if (_selectedIndex == 2) {
                    accSelected = false;
                    clinSelected = false;
                    specSelected = false;
                    settSelected = false;
                    homeSelected = false;
                    docSelected = true;
                  }
                },
                title: 'إدارة الأطباء',
                icon: Icon(
                  Icons.people_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
              DrawerListTile(
                selected: clinSelected,
                press: () {
                  _onItemTapped(3);
                  if (_selectedIndex == 3) {
                    accSelected = false;
                    specSelected = false;
                    settSelected = false;
                    homeSelected = false;
                    docSelected = false;
                    clinSelected = true;
                  }
                },
                title: 'إدارة المصحات',
                icon: Icon(
                  Icons.business_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
              DrawerListTile(
                selected: specSelected,
                press: () {
                  _onItemTapped(4);
                  if (_selectedIndex == 4) {
                    accSelected = false;
                    settSelected = false;
                    homeSelected = false;
                    docSelected = false;
                    clinSelected = false;
                    specSelected = true;
                  }
                },
                title: 'إدارة التخصصات',
                icon: Icon(
                  Icons.list_alt_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(
                  color: HexColor.fromHex(Constants.app_color_secondary),
                  thickness: 0.2,
                ),
              ),
              DrawerListTile(
                selected: settSelected,
                press: () {
                  _onItemTapped(5);
                  if (_selectedIndex == 5) {
                    accSelected = false;
                    specSelected = false;
                    homeSelected = false;
                    docSelected = false;
                    clinSelected = false;
                    settSelected = true;
                  }
                },
                title: 'الإعدادات',
                icon: Icon(
                  Icons.settings_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
              DrawerListTile(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerLoginView()));
                },
                title: 'تسجيل الخروج',
                icon: Icon(
                  Icons.logout_outlined,
                  color: HexColor.fromHex(Constants.app_color_on_primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
