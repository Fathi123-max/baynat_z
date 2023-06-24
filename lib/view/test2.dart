import 'package:flutter/material.dart';

class SendToSpecificUser extends StatefulWidget {
  const SendToSpecificUser({super.key});

  @override
  _SendToSpecificUserState createState() => _SendToSpecificUserState();
}

class _SendToSpecificUserState extends State<SendToSpecificUser> {
  TextEditingController messageController = TextEditingController();

  void _sendMessage() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      // Code to send message
      messageController.clear();
    }
  }

  void _addUser() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      // Code to send message
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send To Specific User Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Token',
                      ),
                      maxLines: null,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _addUser,
                      child: const Text('Apply User'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Message',
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
    );
  }
}
