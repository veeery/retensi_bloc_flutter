import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingCenter extends StatelessWidget {
  const LoadingCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}