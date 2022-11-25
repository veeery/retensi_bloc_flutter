import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar extends StatelessWidget {

  String message;

  AppSnackBar({
    required this.message
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.2.sh,
      child: Text(message),
    );
  }
}
