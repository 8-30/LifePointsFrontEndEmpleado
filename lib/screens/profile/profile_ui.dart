import 'package:flutter/material.dart';
import 'package:life_point/screens/profile/components/body.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil de Usuario"),
        centerTitle: true,
      ),
      body: BodyProfile(),
    );
  }
}
