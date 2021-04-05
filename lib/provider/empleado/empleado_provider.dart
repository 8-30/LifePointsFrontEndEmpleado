import 'package:dio/dio.dart';
import 'package:life_point/models/empleado_model.dart';

class EmpleadoApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/empleado/";
  final Dio _dio = Dio();

  Future<List<EmpleadoModel>> getAllEmpleados() async {
    List<EmpleadoModel> empleadoList = List<EmpleadoModel>();
    try {
      Response response = await _dio.get(_endpoint);
      print(response.data["empleados"]);
      for (var data in response.data["empleados"]) {
        empleadoList.add(EmpleadoModel.fromJson(data));
      }
      return empleadoList;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<EmpleadoModel> getEmpleado(int uid) async {
    print(_endpoint + uid.toString());
    try {
      Response response = await _dio.get(_endpoint + uid.toString());
      return EmpleadoModel.fromJson(response.data['empleado']);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
