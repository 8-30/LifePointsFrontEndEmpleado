import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/insumo_model.dart';
import 'package:life_point/models/person_model.dart';
import 'package:life_point/provider/Inbox/inbox_repository.dart';
import 'package:life_point/screens/chat/inbox/chat_ui.dart';

class CardPresentation extends StatefulWidget {
  final PersonaModel persona;
  final EmpleadoModel empleado;
  final List<InsumoModel> insumos;

  CardPresentation({
    Key key,
    this.persona,
    this.empleado,
    this.insumos,
  }) : super(key: key);

  @override
  _CardPresentationState createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  final TextStyle estiloTexto = new TextStyle(color: Colors.white);

  InboxRepository _inboxRepository = InboxRepository();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: NetworkImage(widget.persona.foto),
                        height: 80,
                        width: 80,
                      ),
                      Text("  "),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.persona.nombre +
                              " " +
                              widget.persona.apellido),
                          Text(widget.persona.genero),
                          Text("Edad: 24"),
                          Text("Telefono: "),
                          Text(widget.persona.telefono),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Direccion: "),
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(text: widget.persona.direccion)
                          ])),
                      Text("Email: "),
                      Text(widget.persona.email),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("\nServicio: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Descripcion: "),
                      RichText(
                          text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(text: widget.empleado.descripcion)
                          ])),
                      Text("Tarifa por Hora: "),
                      Text(widget.empleado.tarifa.toString() + "\$"),
                      Text("Empresa: " + widget.empleado.empresa),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("\nInsumos Extras: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: new List.generate(
                            widget.insumos.length,
                            (index) =>
                                new Text(widget.insumos[index].nombre + ": ")),
                      ),
                      Column(
                        children: new List.generate(
                            widget.insumos.length,
                            (index) => new Text(
                                widget.insumos[index].tarifa.toString() +
                                    "\$")),
                      )
                    ],
                  ),
                ),
                Text(""),
                RaisedButton(
                    child: Text("Solicitar Servicio"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    textColor: Colors.white,
                    color: Colors.green[400],
                    elevation: 5.0,
                    onPressed: () async => {
                          //esto va en otro boton, por mientras esta aqui, el 47 es el id del usuario

                          await _inboxRepository.postInbox(
                              widget.persona.idPersona, 47),
                          await Get.to(() => ChatUI(persona: widget.persona),
                              transition: Transition.fadeIn),
                        })
              ],
            )));
  }
}
