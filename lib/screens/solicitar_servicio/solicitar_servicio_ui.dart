import 'package:flutter/material.dart';
import 'package:life_point/screens/solicitar_servicio/components/body.dart';

class SolicitarServicioUI extends StatefulWidget {
  const SolicitarServicioUI({Key key}) : super(key: key);

  @override
  _SolicitarServicioUIState createState() => _SolicitarServicioUIState();
}

class _SolicitarServicioUIState extends State<SolicitarServicioUI> {
  List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Solicitar Servicio"),
      ),
      body: BodySolicitarServicio(),
    );
  }
}
