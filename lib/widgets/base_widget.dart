import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseWidgets extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool showButton;
  final Widget? button;
  final Widget? background;
  final Widget? headerWidget;
  final Future<bool> Function()? onWillPop;
  final Future Function()? onRefresh;
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  BaseWidgets(
      {required this.children,
        this.mainAxisAlignment = MainAxisAlignment.center,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.title = "",
        this.button,
        this.onWillPop,
        this.backgroundColor,
        this.headerWidget,
        this.onRefresh,
        this.showButton = false,
        this.background});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: onRefresh ?? () async {},
              child: Stack(
                children: [
                  background ?? Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerWidget ?? Container(),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            width: 1.sw,
                            child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: _buildChild(context, withButton: showButton))),
                      ),
                    ],
                  ),
                  if (MediaQuery.of(context).viewInsets.bottom <= 0)
                    Positioned(
                      bottom: 100.w,
                      child: Container(
                        width: 0.425.sw,
                        height: 0.15.sw,
                        margin: EdgeInsets.only(
                          left: 0.5.sw - (0.425.sw / 2),
                          right: 0.5.sw - (0.425.sw / 2),
                        ),
                        child: button,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context, {required bool withButton}) {
    if (!withButton) {
      return Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            ...children,
            SizedBox(height: 0.2.sh)
          ]
      );
    }


    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ...children,
        if (MediaQuery.of(context).viewInsets.bottom > 0)
          Center(
            child: Container(
              width: 0.425.sw,
              height: 0.15.sw,
              margin: EdgeInsets.symmetric(vertical: 50.h),
              child: button,
            ),
          ),
        if (MediaQuery.of(context).viewInsets.bottom <= 0) SizedBox(height: 400.h),
        SizedBox(height: 0.2.sh)
      ],
    );
  }

  Widget _buildBackWidget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 25.w),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                // TODO find unfocus on BloC
                // if (onWillPop == null) return Get.back();
                // if (await onWillPop!()) Get.back();
              },
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Row(
                children: [
                  // Text(
                  //   title,
                  //   style: TextStyle(fontSize: FontSize.subHeaderFont, fontWeight: FontWeight.bold),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   softWrap: false,
                  // ),
                ],
              ),
            ),
            SizedBox(width: 25.w),
          ],
        ),
        SizedBox(height: 100.h),
      ],
    );
  }
}