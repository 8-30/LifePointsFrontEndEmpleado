import 'package:dio/dio.dart';
import 'package:life_point/models/inbox_model.dart';

class InboxApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/inbox/";
  final Dio _dio = Dio();

  Future<List<InboxModel>> getAllInboxs() async {
    List<InboxModel> inboxList = List<InboxModel>();
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data["inbox"]);
      for (var data in response.data["inbox"]) {
        inboxList.add(InboxModel.fromJson(data));
      }
      return inboxList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<InboxModel>> getInboxPersona(id) async {
    List<InboxModel> inboxList = List<InboxModel>();
    try {
      Response response =
          await _dio.get(_endpoint + "persona/" + id.toString());
      print(response.data["inboxs"]);
      for (var data in response.data["inbox"]) {
        inboxList.add(InboxModel.fromJson(data));
      }
      return inboxList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<InboxModel> getInboxParticipantes(id1, id2) async {
    try {
      Response response =
          await _dio.get(_endpoint + id1.toString() + "/" + id2.toString());
      print(response.data["inboxs"]);
      return InboxModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<InboxModel> getInboxid(id) async {
    try {
      Response response = await _dio.get(_endpoint + id.toString());
      print(response);
      return InboxModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<InboxModel> postInbox(int idpersona1, int idpersona2) async {
    try {
      InboxModel inbox = new InboxModel(
        idInbox: null,
        persona1: idpersona1,
        persona2: idpersona2,
        nombre: "inbox",
      );
      print(inbox.toJson());
      await _dio.post(_endpoint, data: inbox.toJson());
      return null;
    } catch (error) {
      print("Exception occured: $error");
      return null;
    }
  }
}
