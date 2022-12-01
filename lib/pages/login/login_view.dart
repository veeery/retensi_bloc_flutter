import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retensi_bloc/bloc/auth/auth_bloc.dart';
import 'package:retensi_bloc/constants/app_images.dart';
import 'package:retensi_bloc/constants/app_textstyle.dart';
import 'package:retensi_bloc/pages/app_routes.dart';
import 'package:retensi_bloc/pages/navigator_key.dart';
import 'package:retensi_bloc/widgets/app_local_image.dart';
import 'package:retensi_bloc/widgets/app_textfield.dart';
import 'package:retensi_bloc/widgets/base_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retensi_bloc/widgets/loading/loading_center.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController username = TextEditingController(text: "");
    late TextEditingController password = TextEditingController(text: "");

    return BaseWidgets(
      children: [
        BlocProvider<AuthBloc>.value(
          value: AuthBloc(),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                // show error widget
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: Text(state.message),
                  ),
                );

              } else if (state is AuthLoaded) {
                //go to main screen
                Navigator.of(context).pushReplacementNamed(AppPages.main);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const LoadingCenter();
              } else {

                return Column(
                  children: [
                    SizedBox(height: 0.2.sh),
                   AppTextField(
                     controller: username,
                     labelText: "Username",
                   ),
                    SizedBox(height: 0.1.sh),
                    AppTextField(
                      controller: password,
                      labelText: "Password",
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(Login(username: username.text, password: password.text));
                      },
                    )
                  ],
                );
              }
            },
          ),
        )
      ],
    );

    return BaseWidgets(backgroundColor: Colors.blue, children: [
      // AppLocalImage(image: AppImages.logo, height: 0.2.sh),
      // AppTextField(
      //   controller: TextEditingController(text: ""),
      //   hintText: "www",
      // ),
      // WaveWidget(
      //   config: CustomConfig(
      //     gradients: [
      //       [Colors.red, Color(0xEEF44336)],
      //       [Colors.red[800]!, Color(0x77E57373)],
      //       [Colors.orange, Color(0x66FF9800)],
      //       [Colors.yellow, Color(0x55FFEB3B)]
      //     ],
      //     durations: [35000, 19440, 10800, 6000],
      //     heightPercentages: [0.20, 0.23, 0.25, 0.30],
      //     gradientBegin: Alignment.bottomLeft,
      //     gradientEnd: Alignment.topRight,
      //   ),
      //   backgroundColor: Colors.transparent,
      //   size: Size(1.sw, 1.sw),
      // )
    ]);
  }
}
