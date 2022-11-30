import 'package:flutter/material.dart';
import 'package:retensi_bloc/constants/app_images.dart';
import 'package:retensi_bloc/widgets/app_local_image.dart';
import 'package:retensi_bloc/widgets/base_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
        backgroundColor: Colors.red,
        children: [
          AppLocalImage(image: AppImages.logo, height: 0.2.sh)
        ]
    );
  }
}
