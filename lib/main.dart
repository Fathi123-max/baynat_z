import 'package:byanat_z/view/main_page.dart';
import 'package:flutter/material.dart';

import 'controller/notifcation_controller.dart';

Future<void> main() async {
  await NotificationController.initializeLocalNotifications(debug: true);
  await NotificationController.initializeRemoteNotifications(debug: true);
  await NotificationController.getInitialNotificationAction();
  runApp(const MyApp());
}
