import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retensi_bloc/pages/login/login_view.dart';
import 'package:retensi_bloc/pages/testing/testing.dart';
import 'package:retensi_bloc/widgets/app_bottom_bar.dart';

import '../../services/notifications/notification_platform_service.dart';

// This is Dashboard / BottomNavigation with
// Home, Profile
class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  void initState()  {
    NotificationPlatformService.listenNotification();
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            child: AppDisplayPage(index: index),
          ),
          Positioned(
              bottom: 0,
              width: 1.sw,
              child: AppBottomBar(
                index: index,
                onTap: (int i) {
                  setState(() {
                    index = i;
                  });
                },
              ))
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget AppDisplayPage({int index = 0}) {
  switch (index) {
    case 0:
      return LoginView();
    case 1:
      return Testing();
    default:
      return Testing();
  }
}
