import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../notifcation_controller/get_notifcation_controller.dart';
import 'home_page.dart';
import 'notifcation_page.dart';

///  *********************************************
///     MAIN WIDGET
///  *********************************************

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // The navigator key is necessary to navigate using static methods
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  // This widget is the root of your application.

  static const String routeHome = '/', routeNotification = '/notification-page';
//initializes the NotificationController to listen for notification events and request Firebase tokens
  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    NotificationController.requestFirebaseToken();
    super.initState();
  }

//onGenerateInitialRoutes method is called when the app is launched and generates the initial routes for the app.
  List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
    List<Route<dynamic>> pageStack = [];
    pageStack.add(
        MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Bayanatz')));
    if (initialRouteName == routeNotification &&
        NotificationController().initialAction != null) {
      pageStack.add(MaterialPageRoute(
          builder: (_) => NotificationPage(
              receivedAction: NotificationController().initialAction!)));
    }
    return pageStack;
  }

//onGenerateRoute method is called when a named route is requested and generates the appropriate route based on the route name.
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: 'Bayanatz'));

      case routeNotification:
        ReceivedAction receivedAction = settings.arguments as ReceivedAction;
        return MaterialPageRoute(
            builder: (_) => NotificationPage(receivedAction: receivedAction));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bayanatz',
      navigatorKey: MyApp.navigatorKey,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
