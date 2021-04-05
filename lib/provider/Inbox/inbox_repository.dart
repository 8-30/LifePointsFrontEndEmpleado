import 'package:life_point/models/inbox_model.dart';
import 'package:life_point/provider/inbox/inbox_provider.dart';

class InboxRepository {
  InboxApiProvider _apiProvider = InboxApiProvider();

  Future<List<InboxModel>> getAllInboxs() {
    return _apiProvider.getAllInboxs();
  }

  Future<List<InboxModel>> getInboxPersona(id) {
    return _apiProvider.getInboxPersona(id);
  }

  Future<InboxModel> getInboxParticipantes(id1, id2) {
    return _apiProvider.getInboxParticipantes(id1, id2);
  }

  Future<InboxModel> postInbox(idpersona1, idpersona2) {
    return _apiProvider.postInbox(idpersona1, idpersona2);
  }

  Future<InboxModel> getInboxid(id) {
    return _apiProvider.getInboxid(id);
  }
}
