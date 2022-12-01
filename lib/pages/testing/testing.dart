
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:retensi_bloc/pages/app_routes.dart';
import 'package:retensi_bloc/pages/navigator_key.dart';
import 'package:retensi_bloc/widgets/base_widget.dart';

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
      button: FloatingActionButton(
        onPressed: () async {
          FirebaseMessaging.instance.getToken().then((value) => print(value));
          await FirebaseMessaging.instance.subscribeToTopic('retensi');

        },
      ),
      children: [

        // BlocConsumer<NotificationBloc, NotificationState>(
        //   listener: (context, state) {
        //     if (state is NotificationLoaded) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text("Loading"),
        //         ),
        //       );
        //     }
        //   },
        //   builder: (context, state) {
        //     if (state is NotificationError) {
        //       return Text(state.errorMessage);
        //     }
        //     return Container();
        //   },
        // )

        // GestureDetector(
        //   onTap: () async {
        //     // await Navigator.pushNamed(context, AppPages.login);
        //     ScaffoldMessenger.of(context)
        //         .showSnackBar(SnackBar(content: Text("2okasckaocksa")));
        //   },
        //
        //   child: Container(
        //     color: Colors.amber,
        //     width: 1.sw,
        //     height: 0.5.sh,
        //     child: Text('OverHere'),
        //   ),
        // )
      ],
    );
  }
}
