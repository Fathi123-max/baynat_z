import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

///  *********************************************
///     NOTIFICATION PAGE
///  *********************************************

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key, required this.receivedAction})
      : super(key: key);

  final ReceivedAction receivedAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receivedAction.title ?? receivedAction.body ?? ''),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              "Title: ${receivedAction.title!}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Body: ${receivedAction.body!}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
