import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/controllers/controllers.dart';
import 'package:life_point/models/empleado_model.dart';
import 'package:life_point/models/inbox_model.dart';
import 'package:life_point/models/mensaje_model.dart';
import 'package:life_point/provider/Inbox/inbox_repository.dart';
import 'package:life_point/provider/empleado/empleado_repository.dart';
import 'package:life_point/provider/mensaje/mensaje_repository.dart';
import 'package:life_point/screens/chat/list_inbox/components/widgets/card_presentatio.dart';

class BodyListInbox extends StatefulWidget {
  const BodyListInbox({Key key}) : super(key: key);

  @override
  _BodyListInboxState createState() => _BodyListInboxState();
}

class _BodyListInboxState extends State<BodyListInbox> {
  InboxRepository _inboxRepository = InboxRepository();
  EmpleadoRepository _empleadoRepository = EmpleadoRepository();
  MensajeRepository _mensajeRepository = MensajeRepository();
  List<MensajeModel> mensajes = List<MensajeModel>();
  int idCliente;
  int idEmpleado;
  String emisor;
  String nombreCliente;
  final usuarioIDStorage = GetStorage();
  final HomeController homeController = Get.find();

  void initState() {
    idCliente = usuarioIDStorage.read("usuarioID");
    nombreCliente = homeController.currerUserModel.nombre;
    idEmpleado = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: FutureBuilder(
                future: _inboxRepository.getInboxPersona(idCliente),
                builder: (context, AsyncSnapshot<List<InboxModel>> snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (idCliente == snapshot.data[index].persona1) {
                              idEmpleado = snapshot.data[index].persona2;
                            } else {
                              idEmpleado = snapshot.data[index].persona1;
                            }
                            return FutureBuilder(
                              future:
                                  _empleadoRepository.getEmpleado(idEmpleado),
                              builder: (context,
                                  AsyncSnapshot<EmpleadoModel> snapshot2) {
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
                                                idCliente) {
                                              emisor = nombreCliente + ":";
                                            } else {
                                              emisor = snapshot2
                                                      .data.persona.nombre +
                                                  ":";
                                            }
                                          }
                                          return snapshot3.hasData
                                              ? CardPresentation(
                                                  inbox: snapshot.data[index],
                                                  persona:
                                                      snapshot2.data.persona,
                                                  ultimoMensaje: (emisor +
                                                          snapshot3
                                                              .data[0].texto +
                                                          "                    ")
                                                      .substring(0, 20))
                                              : CardPresentation(
                                                  inbox: snapshot.data[index],
                                                  persona:
                                                      snapshot2.data.persona,
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
