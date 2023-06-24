import 'package:byanat_z/view/SendToSpecificUser.dart';
import 'package:flutter/material.dart';

import '../notifcation_controller/send_notifcation_controller.dart';

class SubscribeToTopicPage extends StatefulWidget {
  const SubscribeToTopicPage({super.key});

  @override
  _SubscribeToTopicPageState createState() => _SubscribeToTopicPageState();
}

class _SubscribeToTopicPageState extends State<SubscribeToTopicPage> {
  bool isSubscribed = false;
  TextEditingController messageTitleController = TextEditingController();
  TextEditingController messageBodyController = TextEditingController();

  /// - _subscribe(): This method subscribes the user to the "play" topic and updates the UI accordingly.
  void _subscribe() {
    setState(() {
      isSubscribed = true;
      MessageChat.subscribeToTopic(topic: "play");
    });
  }
//- _unsubscribe(): This method unsubscribes the user from the "play" topic and updates the UI accordingly.

  void _unsubscribe() {
    setState(() {
      isSubscribed = false;
      MessageChat.unSubscribeToTopic(topic: "play");
    });
  }

//- _sendMessage(): This method sends a message with a title and body to the "play" topic. It also clears the input fields after sending the message.
  void _sendMessage() {
    // Code to send message
    MessageChat.sendNotificationToTopic(
        topic: "play",
        body: messageBodyController.text.trim(),
        title: messageTitleController.text.trim());
    messageTitleController.clear();
    messageBodyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge 1'),
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
                        'Topic Subscription',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        isSubscribed
                            ? 'You are subscribed to play topic.'
                            : 'You are not subscribed to play topic.',
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: isSubscribed ? _unsubscribe : _subscribe,
                            child: Text(
                                isSubscribed ? 'Unsubscribe' : 'Subscribe'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Send Message to play topic ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: messageTitleController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Message Title',
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: messageBodyController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Message Body',
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _sendMessage,
                        child: const Text('Send'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SendToSpecificUser(),
                  ));
                },
                child: const Text('Next Challenge '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
