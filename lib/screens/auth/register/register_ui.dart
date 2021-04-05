import 'package:flutter/material.dart';
import 'package:life_point/screens/auth/register/components/body.dart';

class RegisterUI extends StatelessWidget {
  const RegisterUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        centerTitle: true,
      ),
      body: BodyRegister(),
    );
  }
}
