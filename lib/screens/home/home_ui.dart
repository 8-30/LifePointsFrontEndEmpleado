import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_point_empleado/controllers/controllers.dart';
import 'package:life_point_empleado/screens/home/components/body.dart';
import 'package:life_point_empleado/screens/home/components/widgets/bottom_navigation_bar.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        autoRemove: false,
        builder: (controller) {
          return Scaffold(
            appBar: buildAppBar(controller),
            body: HomeBody(),
            bottomNavigationBar: BottomNavigationBarTravel(),
          );
        });
  }

  AppBar buildAppBar(HomeController controller) {
    return AppBar(
      title: Text("Bienvenido"),
      actions: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            controller.howCurrentEmpleado();
          },
        ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            controller.logOut();
          },
        )
      ],
    );
  }
}
