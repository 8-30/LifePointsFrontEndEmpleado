import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/route_manager.dart';

import 'package:life_point_empleado/models/empleado_model.dart';
import 'package:life_point_empleado/provider/empleado/empleado_repository.dart';
import 'package:life_point_empleado/screens/chat/list_inbox/list_inbox_ui.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _empleadoRepository = EmpleadoRepository();
  final _streamcontroller = StreamController<String>.broadcast();
  Stream<String> get mensajes => _streamcontroller.stream;

  initNotifications(EmpleadoModel currerUserModel) {
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
}
