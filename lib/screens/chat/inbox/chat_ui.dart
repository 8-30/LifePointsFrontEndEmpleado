import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/chat/inbox/components/body.dart';

class ChatUI extends StatelessWidget {
  final PersonaModel persona;
  const ChatUI({Key key, this.persona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
      ),
      body: ChatBody(persona: persona),
    );
  }
}
