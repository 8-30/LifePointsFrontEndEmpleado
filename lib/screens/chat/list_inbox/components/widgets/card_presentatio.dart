import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:life_point_empleado/models/inbox_model.dart';
import 'package:life_point_empleado/models/person_model.dart';
import 'package:life_point_empleado/screens/chat/inbox/chat_ui.dart';

class CardPresentation extends StatefulWidget {
  final InboxModel inbox;
  final PersonaModel persona;
  final String ultimoMensaje;
  final bool estado;
  CardPresentation({
    Key key,
    this.inbox,
    this.persona,
    this.ultimoMensaje,
    this.estado,
  }) : super(key: key);

  @override
  _CardPresentationState createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ChatUI(persona: widget.persona),
          transition: Transition.fadeIn),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 18.0),
                  child: new CircleAvatar(
                    child: new Text(widget.persona.nombre[0]),
                    backgroundColor: Colors.green,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.persona.nombre,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      this.widget.ultimoMensaje,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                !widget.estado
                    ? Container(
                        child: new CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 5.0,
                      ))
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
