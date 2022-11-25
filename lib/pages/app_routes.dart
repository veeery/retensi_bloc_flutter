import 'package:retensi_bloc/pages/login/login_view.dart';
import 'package:retensi_bloc/pages/main/main_view.dart';
import 'package:retensi_bloc/pages/testing/testing.dart';

class AppPages {
  static const String login = '/login';

  static const String main = '/main';

  static const String testing = '/testing';
}

class AppRoutes {
  static final routes = {
    AppPages.login: (context) => LoginView(),
    AppPages.main: (context) => MainView(),
    AppPages.testing: (context) => Testing(),
  };
}
