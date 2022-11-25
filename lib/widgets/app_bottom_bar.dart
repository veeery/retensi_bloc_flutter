import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  AppBottomBar({required this.onTap, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70.h),
          topRight: Radius.circular(70.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              splashColor: Colors.cyan[400],
              splashRadius: 100.r,
              onPressed: () => onTap(0),
              icon: Icon(
                Icons.home_rounded,
                color: index == 0 ? Colors.cyan : Colors.grey[400],
              )),
          IconButton(
              splashColor: Colors.cyan[400],
              splashRadius: 100.r,
              onPressed: () => onTap(1),
              icon: Icon(
                Icons.account_circle_sharp,
                color: index == 1 ? Colors.red : Colors.grey[400],
              )),
          // IconButton(
          //     splashColor: Colors.cyan[400],
          //     splashRadius: 500,
          //     onPressed: () => onTap(1),
          //     icon: Icon(
          //       Icons.local_fire_department_sharp,
          //       color: index == 1 ? Colors.red : Colors.grey[400],
          //     )),
          // IconButton(
          //     splashColor: Colors.cyan[400],
          //     splashRadius: 500,
          //     onPressed: () => onTap(2),
          //     icon: Icon(
          //       Icons.bookmark_outline_rounded,
          //       color: index == 2 ? Colors.cyan : Colors.grey[400],
          //     )),
          // IconButton(
          //     splashColor: Colors.cyan[400],
          //     splashRadius: 500,
          //     onPressed: () => onTap(3),
          //     icon: Icon(
          //       Icons.settings_rounded,
          //       color: index == 3 ? Colors.cyan : Colors.grey[400],
          //     )),
        ],
      ),
    );
  }
}