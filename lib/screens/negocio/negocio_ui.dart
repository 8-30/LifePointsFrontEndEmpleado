import 'package:flutter/material.dart';
import 'package:life_point_empleado/screens/negocio/components/body.dart';

class NegocioUI extends StatelessWidget {
  const NegocioUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Negocio/Servicio"),
        centerTitle: true,
      ),
      body: BodyNegocio(),
    );
  }
}
