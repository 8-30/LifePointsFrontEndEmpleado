import 'package:flutter/material.dart';
import 'components/body.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Iniciar sesión"),
      ),
      body: BodyLogin(),
    );
  }
}
