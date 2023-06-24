import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:http/http.dart';

class MessageChat {
  static Future<void> unsepscriptotopicfathi() async {
    try {
      await AwesomeNotificationsFcm().unsubscribeToTopic("fathi");
      print("okkkkkkk");
    } catch (e) {
      print(e);
    }
  }

  static Future<void> sendNotificationtotopic(subject, title) async {
    final postUrl = 'https://fcm.googleapis.com/fcm/send';

    String toParams = "/topics/" + 'fathi';

    final data = {
      "notification": {"body": subject, "title": title},
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
// on success do
      print("true");
    } else {
// on failure do
      print("false");
    }
  }

  // for accessing firebase messaging (Push Notification)
  static Future<void> sendPushNotification(String msg) async {
    try {
      final body = {
        "to":
            "fM_dzkIKTsW-iwmw3Khe9C:APA91bEh7250OUrJZiQ7Mk0-GS9DkAcIoWiV5brRAvZKife-xWB4SWDesRiYnqWVt_ggT9JbgKpppsT0KU1UG5fnJmlTR66rk2skCWL5mkUCQzf4xGyuFDGLK7F-g0M8iFGzmmoW6sJl",
        "notification": {
          "title": "push notifaction", //our name should be send
          "body": msg,
          // "android_channel_id": "chats"
        },
        "data": {
          "some_data": "User ID: hello wolrd ",
        },
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

  // for accessing firebase messaging (Push Notification)
  static Future<void> sendPushNotificationwithimages() async {
    try {
      final body = {
        "to":
            "fnjjhWGiTwK7BGTi4SroXH:APA91bFeqcb2lyOwdiJ81auujo1VCyeQufRWPd6uRG2HRNwMycP0sk6Om7jSXdQza1B5Mnab-PEkOYZbTffNTdTVGycA9KTzKq07Q3bdDEiaIqjUZ3U2n0dj_KGKwTZYNkdWItswmBXs",
        "priority": "high",
        "mutable_content": true,
        "notification": {
          "badge": 42,
          "title": "Huston! The eagle has landed!",
          "body":
              "A small step for a man, but a giant leap to Flutter's community!"
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
