import 'package:retensi_bloc/main.dart';
import 'package:retensi_bloc/pages/testing/testing.dart';

class AppPages {
  static const String login = '/login';
  static const String testing = '/testing';
}

class AppRoutes {
  static final routes = {AppPages.testing: (context) => Testing()};
}
