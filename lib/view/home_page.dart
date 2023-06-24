import 'package:flutter/material.dart';

import '../controller/notifcation_controller.dart';
import '../notifcation_controller/send_notifcation.dart';

///  *********************************************
///     HOME PAGE
///  *********************************************

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    NotificationController().addListener(() => setState(() {}));
    super.initState();
  }

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(NotificationController().nativeToken);
    print("=========================");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Firebase Token:',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${NotificationController().firebaseToken}',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Native Token:',
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${NotificationController().nativeToken}',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Push the button to create a new local notification or reset the badge counter',
              ),
            ),
            TextField(
              controller: editingController,
            ),
            ElevatedButton(
                onPressed: () async {
                  MessageChat.sendPushNotification(editingController.text);
                },
                child: Text("SendMessage")),
            ElevatedButton(
                onPressed: () async {
                  MessageChat.sendNotificationtotopic(
                      "hello", "hello from mahoud ");
                },
                child: Text("send to ")),
            ElevatedButton(
                onPressed: () async {
                  await MessageChat.unsepscriptotopicfathi();
                },
                child: Text("unsepscriptotopicfathi "))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => NotificationController.createNewNotification(),
              tooltip: 'Create New notification',
              child: const Icon(Icons.outgoing_mail),
            ),
            SizedBox(width: 20),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () => NotificationController.resetBadge(),
              tooltip: 'Reset Badge',
              child: const Icon(Icons.exposure_zero),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
