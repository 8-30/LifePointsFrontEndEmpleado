import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:life_point_empleado/screens/home/home_ui.dart';

import 'components/body.dart';

class ListInboxUI extends StatelessWidget {
  const ListInboxUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bandeja de Entrada"),
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back_sharp),
                onPressed: () =>
                    Get.to(() => HomeUI(), transition: Transition.fadeIn)),
          ),
          body: BodyListInbox(),
        ));
  }
}
