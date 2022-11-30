import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retensi_bloc/constants/app_images.dart';

// ignore: must_be_immutable
class AppLocalImage extends StatelessWidget {
  double? width;
  double? height;
  double? radius;
  String image;
  Color? backgroundColor;
  Color? foregroundColor;
  BoxFit? fit;

  AppLocalImage({super.key, this.width, this.radius, this.height, this.foregroundColor,this.fit, required this.image, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0.5.sw,
      height: height ?? 0.3.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0.05.sw),
        color: backgroundColor ?? Colors.white
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0.05.sw),
        child: Image.asset(
          image,
          width: width ?? 0.5.sw,
          height: height ?? 0.3.sh,
          color: foregroundColor,
          fit: fit ?? BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 0.05.sw),
              child: Image.asset(
                AppImages.imageBroken,
                width: width ?? 0.5.sw,
                height: height ?? 0.3.sh,
                color: foregroundColor,
                fit: fit ?? BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }
}
