import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:life_point_empleado/controllers/controllers.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:life_point_empleado/controllers/home/home_controller.dart';
import 'package:life_point_empleado/models/inbox_model.dart';
import 'package:life_point_empleado/models/mensaje_model.dart';
import 'package:life_point_empleado/models/person_model.dart';
import 'package:life_point_empleado/provider/Inbox/inbox_repository.dart';
import 'package:life_point_empleado/screens/chat/inbox/components/widgets/chat_card.dart';

class ChatBody extends StatefulWidget {
  final PersonaModel persona;

  ChatBody({Key key, this.persona}) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState(persona);
}

class _ChatBodyState extends State<ChatBody> {
  SocketIO socketIO;
  final PersonaModel persona;
  final HomeController _controller = Get.find();
  int idEmpleado;
  List<MensajeModel> mensajes;
  _ChatBodyState(this.persona);
  InboxRepository _inboxRepository = InboxRepository();

  @override
  void initState() {
    idEmpleado = _controller?.currerEmpleadoModel?.idEmpleado;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: FutureBuilder(
              future: _inboxRepository.getInboxParticipantes(
                  persona.idPersona, idEmpleado),
              builder: (context, AsyncSnapshot<InboxModel> snapshot1) {
                return snapshot1.hasData
                    ? ChatCard(
                        empleado: idEmpleado,
                        persona: persona,
                        idInbox: snapshot1.data.idInbox,
                      )
                    : CircularProgressIndicator();
              },
            )));
  }
}
