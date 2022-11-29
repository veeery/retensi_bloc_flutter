import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void AppSnackBar({
  required BuildContext context,
  String title = "",
  String body = "",
  String imageUrl = "",
  SnackBarAction? snackBarAction
}) {
  final snackbar = SnackBar(
    content: Container(
      height: 0.10.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(body),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    action: snackBarAction,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    margin: EdgeInsets.only(right: 0.05.sw, left: 0.05.sw, bottom: 0.82.sh),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
