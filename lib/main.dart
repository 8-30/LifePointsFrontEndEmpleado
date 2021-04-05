import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/screens/ui.dart';
import 'controllers/controllers.dart';

void main() async {
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Points',
      initialRoute: 'login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (BuildContext context) => SplashUI(),
        'login': (BuildContext context) => LoginUI(),
        'register': (BuildContext context) => RegisterUI(),
        'home': (BuildContext context) => HomeUI(),
        'solicitar-servicio': (BuildContext context) => SolicitarServicioUI()
      },
    );
  }
}
