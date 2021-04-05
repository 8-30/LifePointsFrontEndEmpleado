import 'package:dio/dio.dart';
import 'package:life_point/models/person_model.dart';

class AdministradorApiProvider {
  final String _endpoint = "http://lifepoints.herokuapp.com/api/persona/1";
  final Dio _dio = Dio();

  Future<PersonaModel> getUser() async {
    try {
      Response response = await _dio.get(_endpoint);
      print(response);
      return PersonaModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
