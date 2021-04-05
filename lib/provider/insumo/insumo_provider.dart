import 'package:dio/dio.dart';
import 'package:life_point/models/insumo_model.dart';

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
}
