import 'notify_provider.dart';

class NotifyRepository {
  NotifyApiProvider _apiProvider = NotifyApiProvider();

  Future<void> sendNotify(mensaje, idInbox, idEmisor, nombre) {
    return _apiProvider.sendNotify(mensaje, idInbox, idEmisor, nombre);
  }
}
