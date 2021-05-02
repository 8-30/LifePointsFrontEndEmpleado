import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:life_point_empleado/models/person_model.dart';
import 'package:life_point_empleado/screens/chat/inbox/components/body.dart';
import 'package:life_point_empleado/screens/chat/list_inbox/list_inbox_ui.dart';

class ChatUI extends StatelessWidget {
  final PersonaModel persona;
  const ChatUI({Key key, this.persona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Inbox"),
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back_sharp),
                onPressed: () =>
                    Get.to(() => ListInboxUI(), transition: Transition.fadeIn)),
          ),
          body: ChatBody(persona: persona),
        ));
  }
}
