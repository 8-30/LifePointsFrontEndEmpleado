import 'package:dio/dio.dart';
import 'package:life_point_empleado/models/insumo_model.dart';

class InsumoApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/insumo/";
  final Dio _dio = Dio();

  Future<List<InsumoModel>> getAllInsumos() async {
    List<InsumoModel> insumoList = List<InsumoModel>();
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data["insumo"]);
      for (var data in response.data["insumo"]) {
        insumoList.add(InsumoModel.fromJson(data));
      }
      return insumoList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<InsumoModel>> getInsumoEmpleado(id) async {
    List<InsumoModel> insumoList = List<InsumoModel>();
    try {
      Response response =
          await _dio.get(_endpoint + "empleado/" + id.toString());
      print(response.data["insumos"]);
      for (var data in response.data["insumos"]) {
        insumoList.add(InsumoModel.fromJson(data));
      }
      return insumoList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<InsumoModel> getInsumoid(id) async {
    try {
      Response response = await _dio.get(_endpoint + id.toString());
      print(response);
      return InsumoModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<InsumoModel> postInsumo(
      int idEmpleado, String nombre, double tarifa) async {
    try {
      print("yeaaaaa" + idEmpleado.toString());
      InsumoModel insumo = new InsumoModel(
          idInsumo: null,
          idInsumoEmpleado: idEmpleado,
          nombre: nombre,
          tarifa: tarifa,
          descripcion: "Ninguna");
      print(insumo.toJson());
      await _dio.post(_endpoint, data: insumo.toJson());
      return null;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  void updateInsumo(InsumoModel model) async {
    try {
      print(_endpoint + model.idInsumo.toString());
      Response response = await _dio.put(_endpoint + model.idInsumo.toString(),
          data: model.toJson());
    } catch (error) {
      print("Exception occured: $error");
    }
  }
}
