import 'package:flutter/material.dart';

import 'components/body.dart';

class ListInboxUI extends StatelessWidget {
  const ListInboxUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
      ),
      body: BodyListInbox(),
    );
  }
}
