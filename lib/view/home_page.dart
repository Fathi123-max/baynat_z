import 'package:byanat_z/view/test.dart';
import 'package:flutter/material.dart';

import '../notifcation_controller/get_notifcation_controller.dart';
import '../notifcation_controller/send_notifcation_controller.dart';

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
    debugPrint(NotificationController().nativeToken);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                ''' First Task''',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                ''' 
Marketing notifications to mass-users for promoting services like
promotions, coupons, sales, reminders to use certain features or services.
                ''',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                ''' 
In Firebase  we use Topic Concept   ''',
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    ''' 
Enter Topic Name   ''',
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                  child: TextField(
                    controller: editingController,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            await MessageChat.subscribeToTopic(
                                topic: editingController.text);
                          },
                          child: const Text("Subscribe to topic  ")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SubscribeToTopicPage(),
                            ));
                          },
                          child: const Text("UNSubscribe to topic  ")),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  MessageChat.sendSimplePushNotification(
                      bodyOfNotification: '',
                      titleOfNotification: '',
                      otherUserToken: '');
                },
                child: const Text("SendMessage")),
            ElevatedButton(
                onPressed: () async {
                  MessageChat.sendSimplePushNotification(
                      bodyOfNotification: "",
                      titleOfNotification: "",
                      otherUserToken: '');
                },
                child: const Text("send to ")),
            ElevatedButton(
                onPressed: () async {
                  await MessageChat.unSubscribeToTopic(topic: "hello");
                },
                child: const Text("unsepscriptotopicfathi "))
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
            const SizedBox(width: 20),
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
