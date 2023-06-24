import 'package:byanat_z/view/SubscribeToTopicPage.dart';
import 'package:flutter/material.dart';

import '../notifcation_controller/get_notifcation_controller.dart';

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
  TextEditingController editingController = TextEditingController();

  //The above code is the initialization state of a widget in a Flutter application. It sets up a listener for notifications using the NotificationController class and updates the state of the widget when a notification is received. This is achieved by calling the setState() method. The super.initState() method is called to complete the initialization process.
  @override
  void initState() {
    NotificationController().addListener(() => setState(() {}));
    super.initState();
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SubscribeToTopicPage(),
                    ));
                  },
                  child: const Text("Go To  Challenges ")),
            ),
          ],
        ),
      ),
    );
  }
}
