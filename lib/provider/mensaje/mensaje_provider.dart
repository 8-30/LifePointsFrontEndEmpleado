import 'package:dio/dio.dart';
import 'package:life_point_empleado/models/mensaje_model.dart';

class MensajeApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/mensaje/";
  final Dio _dio = Dio();

  Future<List<MensajeModel>> getAllMensaje() async {
    List<MensajeModel> mensajeList = List<MensajeModel>();
    try {
      Response response = await _dio.get(_endpoint);
      for (var data in response.data["mensaje"]) {
        mensajeList.add(MensajeModel.fromJson(data));
      }
      return mensajeList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<MensajeModel>> getAllMensajeInbox(id) async {
    List<MensajeModel> mensajeList = List<MensajeModel>();
    try {
      Response response = await _dio.get(_endpoint + "inbox/" + id.toString());
      for (var data in response.data["mensaje"]) {
        mensajeList.add(MensajeModel.fromJson(data));
      }
      return mensajeList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<MensajeModel>> getLastMensajeInbox(id) async {
    List<MensajeModel> mensajeList = List<MensajeModel>();
    try {
      Response response =
          await _dio.get(_endpoint + "inboxlast/" + id.toString());
      print(response.data);
      mensajeList.add(MensajeModel.fromJson(response.data["mensaje"]));
      return mensajeList;
    } catch (error) {
      print("Exception occured: $error stackTrace: ");
      return null;
    }
  }

  Future<MensajeModel> getMensajeid(id) async {
    try {
      Response response = await _dio.get(_endpoint + id.toString());
      print(response);
      return MensajeModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<bool> postMensaje(String texto, int id, int idEmisor) async {
    try {
      MensajeModel mensaje = new MensajeModel(
          idMensaje: null,
          idInbox: id,
          texto: texto,
          idEmisor: idEmisor,
          estado: false);
      print(mensaje.toJson());
      await _dio.post(_endpoint, data: mensaje.toJson());
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> putMensaje(MensajeModel model) async {
    try {
      await _dio.put(_endpoint + model.idMensaje.toString(),
          data: model.toJson());
      return true;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}
