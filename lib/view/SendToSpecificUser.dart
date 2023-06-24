import 'package:flutter/material.dart';

import '../notifcation_controller/get_notifcation_controller.dart';
import '../notifcation_controller/send_notifcation_controller.dart';

class SendToSpecificUser extends StatefulWidget {
  const SendToSpecificUser({super.key});

  @override
  _SendToSpecificUserState createState() => _SendToSpecificUserState();
}

class _SendToSpecificUserState extends State<SendToSpecificUser> {
  TextEditingController messageTitleController = TextEditingController();
  TextEditingController messageBodyController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
//the  _sendMessage  method sends the push notification with the given message title and body to the specific user with the provided token
  void _sendMessage() {
    // Code to send message
    MessageChat.sendSimplePushNotificationForSpecificUser(
        bodyOfNotification: messageBodyController.text.trim(),
        titleOfNotification: messageTitleController.text.trim(),
        otherUserToken: tokenController.text.trim());

    messageTitleController.clear();
    messageBodyController.clear();
  }

//The  _getToken  method retrieves the current user's token and sets it in the token text field
  void _getToken() {
    String token = tokenController.text;
    if (token.isEmpty) {
      setState(() {
        tokenController.text = NotificationController().nativeToken;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Token',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: tokenController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Input Receiver Token',
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: _getToken,
                            child: const Text('Get Current User Token'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Send Message to User ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: messageTitleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Message title',
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: messageBodyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Message body',
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _sendMessage,
                        child: const Text('Send Message To User'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
