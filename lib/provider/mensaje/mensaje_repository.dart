import 'package:life_point/models/mensaje_model.dart';

import 'package:life_point/provider/mensaje/mensaje_provider.dart';

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

  Future<MensajeModel> postMensaje(model, id, idEmisor) {
    return _apiProvider.postMensaje(model, id, idEmisor);
  }
}
