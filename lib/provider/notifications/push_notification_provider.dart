import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';

import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/provider/empleado/empleado_repository.dart';
import 'package:life_point_empleado/screens/chat/list_inbox/list_inbox_ui.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _empleadoRepository = EmpleadoRepository();
  final _streamcontroller = StreamController<String>.broadcast();
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Stream<String> get mensajes => _streamcontroller.stream;

  initNotifications(EmpleadoModel currerUserModel) {
    //esto es de las notify locales
    _setupNotificationPlugin();
    //
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print(token);
      if (currerUserModel.notyKey != token) {
        currerUserModel.notyKey = token;
      }
      _empleadoRepository.putEmpleado(currerUserModel, null);
    });
    _firebaseMessaging.configure(onMessage: (info) async {
      print("========On Mensaje========" + "yea");
      _setupNotification(
          info["notification"]["title"], info["notification"]["body"]);
      _streamcontroller.sink.add(null);
      print(info);
    }, onLaunch: (info) async {
      print("========On Launch========");
      Get.to(() => ListInboxUI(), transition: Transition.fadeIn);
      _streamcontroller.sink.add(null);
      print(info);
    }, onResume: (info) async {
      print("========On Resune========");
      Get.to(() => ListInboxUI(), transition: Transition.fadeIn);
      _streamcontroller.sink.add(null);
      print(info);
    });
  }

  dispose() {
    _streamcontroller.close();
  }

  //esto es de las noty locales
  void _setupNotificationPlugin() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("lp");
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: null);
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future onSelectNotification(String payload) async {
    await Get.to(() => ListInboxUI(), transition: Transition.fadeIn);
  }

  void _setupNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'daily-notifications', 'Daily Notifications', 'Daily Notifications');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }
  //
}
