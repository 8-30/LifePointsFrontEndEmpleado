import 'package:life_point_empleado/models/mensaje_model.dart';

import 'package:life_point_empleado/provider/mensaje/mensaje_provider.dart';

class MensajeRepository {
  MensajeApiProvider _apiProvider = MensajeApiProvider();

  Future<List<MensajeModel>> getAllMensaje() {
    return _apiProvider.getAllMensaje();
  }

  Future<List<MensajeModel>> getAllMensajeInbox(id) {
    return _apiProvider.getAllMensajeInbox(id);
  }

  Future<List<MensajeModel>> getLastMensajeInbox(id) {
    return _apiProvider.getLastMensajeInbox(id);
  }

  Future<MensajeModel> getMensajeid(id) {
    return _apiProvider.getMensajeid(id);
  }

  Future<bool> postMensaje(model, id, idEmisor) {
    return _apiProvider.postMensaje(model, id, idEmisor);
  }

  Future<bool> putMensaje(model) {
    return _apiProvider.putMensaje(model);
  }
}
