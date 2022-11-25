import 'package:flutter/material.dart';
import 'package:retensi_bloc/widgets/base_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
        backgroundColor: Colors.blue,
        children: [
          // BlocBuilder<NotificationBloc, NotificationState>(
          //  builder: (context, state) {
          //
          //    if (state is NotificationLoaded) {
          //
          //      NotificationModel? notif = state.notificationModel;
          //
          //      return Column(
          //        children: [
          //          Text('Title : ${notif!.title}'),
          //          Text('Body : ${notif.body}'),
          //        ],
          //      );
          //    }
          //
          //    return const SizedBox.shrink();
          //  },
          // )
        ]
    );
  }
}
