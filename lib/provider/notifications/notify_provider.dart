import 'package:dio/dio.dart';
import 'package:life_point_empleado/models/inbox_model.dart';
import 'package:life_point_empleado/models/usuario_model.dart';
import 'package:life_point_empleado/provider/Inbox/inbox_repository.dart';

import 'package:life_point_empleado/provider/usuario/usuario_repository.dart';

class NotifyApiProvider {
  final String _endpoint = "https://fcm.googleapis.com/fcm/send";
  final Dio _dio = Dio();
  InboxRepository _inboxRepository = InboxRepository();
  UsuarioRepository _usuarioRepository = UsuarioRepository();

  Future<void> sendNotify(
      String mensaje, int idInbox, int idEmisor, String nombre) async {
    InboxModel inbox = await _inboxRepository.getInboxid(idInbox);
    UsuarioModel usuario = new UsuarioModel();
    if (inbox.persona1 == idEmisor) {
      usuario = await _usuarioRepository.getCurrentUsuario(inbox.persona2);
      print("simon");
      print(usuario.notyKey);
    } else {
      usuario = await _usuarioRepository.getCurrentUsuario(inbox.persona1);
      print("simon");
      print(usuario.notyKey);
    }

    try {
      Map<String, dynamic> noti = {
        "to": usuario.notyKey,
        "notification": {
          "title": nombre,
          "body": mensaje,
          "sound": "default",
          "tag": "sms"
        },
        "data": {}
      };
      await _dio.post(_endpoint,
          data: noti,
          options: Options(
            headers: {
              "Authorization":
                  "key=AAAA1Z1jYms:APA91bG8TH68WVTx30xFOHTsRrRwRDUj2rida7RxNUuQfDa7TML7OLHtnDriXMawKYAnnFxLxWbbnqczWWjEsmhmwQII4g-Stb5tL12hTdrPXd7WE-Kb52da2fsHoMNWaSuIeLr91GYs"
            },
          ));
    } catch (error) {
      print(error);
    }
  }
}
