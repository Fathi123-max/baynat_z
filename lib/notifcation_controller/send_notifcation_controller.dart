import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:http/http.dart';

class MessageChat {
  /// *********************************************
  ///   SINGLETON PATTERN
  /// *********************************************

  factory MessageChat() {
    return _chat;
  }

  static final MessageChat _chat = MessageChat._intern();

  MessageChat._intern();

  /// *********************************************
  ///   TOPIC    METHODS
  /// *********************************************
  /// METHODS TO  SEND NOTIFICATION  TO GROUP OF USERS
  static Future<void> subscribeToTopic({required String topic}) async {
    try {
      await AwesomeNotificationsFcm().subscribeToTopic(topic);
    } catch (e) {
      log("subscribeToTopicError: $e");
    }
  }

  static Future<void> unSubscribeToTopic({required String topic}) async {
    try {
      await AwesomeNotificationsFcm().unsubscribeToTopic(topic);
    } catch (e) {
      log("unsubscribeToTopicError $e");
    }
  }

  static Future<void> sendNotificationToTopic(
      {subject, title, required topic}) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';

    String toParams = "/topics/" + '$topic';

    final data = {
      "notification": {"body": subject ?? "subject", "title": title ?? "title"},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "sound": 'default',
        "screen": "yourTopicName",
      },
      "to": "${toParams}"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAAninzEzc:APA91bH1k4UPlUYVI7HOV7kE8yIr2mCMr5LGmN0y2GpP6ac01t32yRDyUR3JEZvZYlbebq_n9MqaibkD54dIVYCUOk6jQHcJCOsr4p6OQBt-GJk-bKmhs73_dTbQI7L6qoruJUcWz4Nt'
    };

    final response = await post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      print("true");
    } else {
      print("false");
    }
  }

  /// *********************************************
  ///   SPECIFIC    METHODS
  /// *********************************************

  /// METHODS TO  SEND NOTIFICATION  TO SPECIFIC  USER
  static Future<void> sendSimplePushNotification(
      {required String bodyOfNotification,
      required String titleOfNotification,
      required String otherUserToken}) async {
    try {
      final body = {
        "to": otherUserToken,
        "notification": {
          "title": titleOfNotification, //our name should be send
          "body": bodyOfNotification,
        },
      };

      var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                'key=fDCBslUyTRS90eBRHLYLts:APA91bFU98mjAEId3NJjS66uhdvVVouC93Bn1PaCvPif8oynoBU5wimXiyFTdBOA1KCaNGYkfiTrRHdx_NRs0NFH4g0LNkJQrBicoCPUwkeu0hGVmj-0krmWz6dn6h31K1XIQ-kV7c1d'
          },
          body: jsonEncode(body));
      log('Response status: ${res.statusCode}');
      log('Response body: ${res.body}');
    } catch (e) {
      log('\nsendPushNotificationE: $e');
    }
  }

  static Future<void> sendAdvancedPushNotification(
      {required String bodyOfNotification,
      required String titleOfNotification,
      required String otherUserToken}) async {
    try {
      final body = {
        "to": otherUserToken,
        "priority": "high",
        "mutable_content": true,
        "notification": {
          "badge": 42,
          "title": titleOfNotification,
          "body": bodyOfNotification
        },
        "data": {
          "content": {
            "id": 1,
            "badge": 42,
            "channelKey": "alerts",
            "displayOnForeground": true,
            "notificationLayout": "BigPicture",
            "largeIcon":
                "https://br.web.img3.acsta.net/pictures/19/06/18/17/09/0834720.jpg",
            "bigPicture": "https://www.dw.com/image/49519617_303.jpg",
            "showWhen": true,
            "autoDismissible": true,
            "privacy": "Private",
            "payload": {"secret": "Awesome Notifications Rocks!"}
          },
          "actionButtons": [
            {"key": "REDIRECT", "label": "Redirect", "autoDismissible": true},
            {
              "key": "DISMISS",
              "label": "Dismiss",
              "actionType": "DismissAction",
              "isDangerousOption": true,
              "autoDismissible": true
            }
          ],
          "Android": {
            "content": {
              "title": "Android! The eagle has landed!",
              "payload": {"android": "android custom content!"}
            }
          },
          "iOS": {
            "content": {
              "title": "Jobs! The eagle has landed!",
              "payload": {"ios": "ios custom content!"}
            },
            "actionButtons": [
              {
                "key": "REDIRECT",
                "label": "Redirect message",
                "autoDismissible": true
              },
              {
                "key": "DISMISS",
                "label": "Dismiss message",
                "actionType": "DismissAction",
                "isDangerousOption": true,
                "autoDismissible": true
              }
            ]
          }
        }
      };

      var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                'key=AAAAninzEzc:APA91bH1k4UPlUYVI7HOV7kE8yIr2mCMr5LGmN0y2GpP6ac01t32yRDyUR3JEZvZYlbebq_n9MqaibkD54dIVYCUOk6jQHcJCOsr4p6OQBt-GJk-bKmhs73_dTbQI7L6qoruJUcWz4Nt'
          },
          body: jsonEncode(body));
      log('Response status: ${res.statusCode}');
      log('Response body: ${res.body}');
    } catch (e) {
      log('\nsendPushNotificationE: $e');
    }
  }
}
