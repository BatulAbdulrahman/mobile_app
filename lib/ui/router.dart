import 'package:auto_route/auto_route.dart';
import 'package:mobile_app/ui/views/posts_list/posts_list_view.dart';
import 'package:mobile_app/ui/views/posts_view/posts_view.dart';
import 'package:mobile_app/ui/views/settings/settings_view.dart';

import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute>[
  AutoRoute(page: CustomerMainView),
  AutoRoute(page: StartUpView, initial: true),
  AutoRoute(page: PostsView),
  AutoRoute(page: PostsListView),
  AutoRoute(page: SettingsView),
])
class $AppRouter {}
