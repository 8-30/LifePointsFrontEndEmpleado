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
      child: Image(
        image: NetworkImage(
            "https://img.freepik.com/vector-gratis/palabra-bienvenida-personajes-dibujos-animados-plana-personas_81522-4207.jpg?size=626&ext=jpg"),
      ),
    );
  }
}
