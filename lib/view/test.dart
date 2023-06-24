import 'package:byanat_z/view/test2.dart';
import 'package:flutter/material.dart';

class SubscribeToTopicPage extends StatefulWidget {
  @override
  _SubscribeToTopicPageState createState() => _SubscribeToTopicPageState();
}

class _SubscribeToTopicPageState extends State<SubscribeToTopicPage> {
  bool isSubscribed = false;
  TextEditingController messageController = TextEditingController();

  void _subscribe() {
    setState(() {
      isSubscribed = true;
    });
  }

  void _unsubscribe() {
    setState(() {
      isSubscribed = false;
    });
  }

  void _sendMessage() {
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
        title: const Text('Subscribe Page'),
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
                    Text(
                      'Topic Subscription',
                      style: Theme.of(context).textTheme.headline6,
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
                          child:
                              Text(isSubscribed ? 'Unsubscribe' : 'Subscribe'),
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
                  builder: (context) => SendToSpecificUser(),
                ));
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
