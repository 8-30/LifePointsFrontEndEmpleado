import 'package:flutter/material.dart';

import 'package:life_point_empleado/models/empleado_model.dart';

class CardPresentation extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);

  final EmpleadoModel empleado;
  CardPresentation({
    Key key,
    this.empleado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        "assets/bienvenido.png",
        fit: BoxFit.cover,
        width: 300.0,
        height: 300.0,
      ),
    );
  }
}
