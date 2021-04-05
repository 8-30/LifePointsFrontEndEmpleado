import 'package:flutter/material.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/screens/servicio/components/body.dart';

class DetalleServicioUI extends StatelessWidget {
  final PersonaModel persona;
  DetalleServicioUI({Key key, this.persona}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Servicios"),
      ),
      body: ServicioBody(persona: persona),
    );
  }
}
