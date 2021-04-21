import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';

import 'package:life_point_empleado/controllers/controllers.dart';

import 'package:life_point_empleado/models/inbox_model.dart';
import 'package:life_point_empleado/models/mensaje_model.dart';
import 'package:life_point_empleado/models/usuario_model.dart';
import 'package:life_point_empleado/provider/Inbox/inbox_repository.dart';
import 'package:life_point_empleado/provider/mensaje/mensaje_repository.dart';
import 'package:life_point_empleado/provider/usuario/usuario_repository.dart';
import 'package:life_point_empleado/screens/chat/list_inbox/components/widgets/card_presentatio.dart';

class BodyListInbox extends StatefulWidget {
  const BodyListInbox({Key key}) : super(key: key);

  @override
  _BodyListInboxState createState() => _BodyListInboxState();
}

class _BodyListInboxState extends State<BodyListInbox> {
  InboxRepository _inboxRepository = InboxRepository();
  UsuarioRepository _usuarioRepository = UsuarioRepository();
  MensajeRepository _mensajeRepository = MensajeRepository();
  List<MensajeModel> mensajes = List<MensajeModel>();
  int idEmpleado;
  int idCliente1;
  String emisor;
  String nombreCliente;
  final HomeController homeController = Get.find();

  void initState() {
    idEmpleado = homeController?.currerEmpleadoModel?.idEmpleado;
    nombreCliente = homeController?.currerEmpleadoModel?.nombre;
    idCliente1 = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: FutureBuilder(
                future: _inboxRepository.getInboxPersona(idEmpleado),
                builder: (context, AsyncSnapshot<List<InboxModel>> snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (idEmpleado == snapshot.data[index].persona1) {
                              idCliente1 = snapshot.data[index].persona2;
                            } else {
                              idCliente1 = snapshot.data[index].persona1;
                            }
                            print(idCliente1);
                            return FutureBuilder(
                              future: _usuarioRepository
                                  .getCurrentUsuario(idCliente1),
                              builder: (context,
                                  AsyncSnapshot<UsuarioModel> snapshot2) {
                                return snapshot2.hasData
                                    ? FutureBuilder(
                                        future: _mensajeRepository
                                            .getLastMensajeInbox(
                                                snapshot.data[index].idInbox),
                                        builder: (context,
                                            AsyncSnapshot<List<MensajeModel>>
                                                snapshot3) {
                                          if (snapshot3.hasData) {
                                            if (snapshot3.data[0].idEmisor ==
                                                idEmpleado) {
                                              emisor = nombreCliente + ":";
                                            } else {
                                              emisor =
                                                  snapshot2.data.nombre + ":";
                                            }
                                          }
                                          return snapshot3.hasData
                                              ? CardPresentation(
                                                  inbox: snapshot.data[index],
                                                  persona: snapshot2.data,
                                                  ultimoMensaje: (emisor +
                                                          snapshot3
                                                              .data[0].texto +
                                                          "                    ")
                                                      .substring(0, 20))
                                              : CardPresentation(
                                                  inbox: snapshot.data[index],
                                                  persona: snapshot2.data,
                                                  ultimoMensaje: "sin mensajes",
                                                );
                                        })
                                    : Center();
                              },
                            );
                          })
                      : Center(child: CircularProgressIndicator());
                })));
  }
}
